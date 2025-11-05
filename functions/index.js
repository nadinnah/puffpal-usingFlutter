const functions = require("firebase-functions");
const admin = require("firebase-admin");
const fetch = require("node-fetch"); // v2
admin.initializeApp();

const METEO_BASE = "https://api.open-meteo.com/v1/forecast";

// thresholds - tune these
const TEMP_COLD_THRESHOLD = 15;    // < 15°C is considered cold
const PM25_THRESHOLD = 25;         // µg/m³ threshold for PM2.5
const PM10_THRESHOLD = 50;         // µg/m³ threshold for PM10
const POLLEN_THRESHOLD = 100;      // summed pollen threshold (approx)

/**
 * Analyze hourly data for triggers and produce a summary message string (or null)
 * data: parsed JSON returned from Open-Meteo hourly forecast
 */
function analyzeHourlyForTriggers(hourly) {
  const times = hourly.time || [];
  const temps = hourly.temperature_2m || [];
  const pm10 = hourly.pm10 || [];
  const pm25 = hourly.pm2_5 || [];
  const pollen_grass = hourly.pollen_grass || [];
  const pollen_tree = hourly.pollen_tree || [];
  const pollen_weed = hourly.pollen_weed || [];

  let lines = [];

  for (let i = 0; i < times.length; i++) {
    const t = temps[i];
    const d10 = pm10[i];
    const d25 = pm25[i];
    const p = (pollen_grass[i] || 0) + (pollen_tree[i] || 0) + (pollen_weed[i] || 0);
    let triggers = [];

    if (t != null && t < TEMP_COLD_THRESHOLD) triggers.push("cold air");
    if ((d10 != null && d10 > PM10_THRESHOLD) || (d25 != null && d25 > PM25_THRESHOLD)) triggers.push("dust/PM");
    if (p != null && p > POLLEN_THRESHOLD) triggers.push("pollen");

    if (triggers.length > 0) {
      // times[i] is ISO timestamp like "2025-11-05T07:00"
      const hour = new Date(times[i]).getHours();
      lines.push(`Around ${hour}:00 — ${triggers.join(" and ")}`);
    }
  }

  if (lines.length === 0) return null;
  // keep only first N entries to avoid extremely long message
  const MAX_LINES = 6;
  const summary = lines.slice(0, MAX_LINES).join("\n");
  return summary;
}

/**
 * Fetch hourly forecast for one day (forecast_days=1) for lat/lon
 */
async function fetchDailyForecast(lat, lon) {
  const params = [
    `latitude=${encodeURIComponent(lat)}`,
    `longitude=${encodeURIComponent(lon)}`,
    `hourly=temperature_2m,pm10,pm2_5,pollen_grass,pollen_tree,pollen_weed`,
    `forecast_days=1`,
    `timezone=auto`
  ];
  const url = `${METEO_BASE}?${params.join("&")}`;
  const res = await fetch(url, { method: "GET" });
  if (!res.ok) {
    const body = await res.text();
    throw new Error(`Open-Meteo failed ${res.status}: ${body}`);
  }
  return await res.json();
}

/**
 * Scheduled function: runs every day at 07:00 Africa/Cairo
 * also expose an HTTP endpoint for testing
 */
exports.dailyWeatherNotifier = functions.pubsub.schedule("0 7 * * *")
  .timeZone("Africa/Cairo")
  .onRun(async (context) => {
    const db = admin.firestore();
    const usersSnap = await db.collection("Users").get();

    const nowDateISO = (new Date()).toISOString().slice(0, 10); // YYYY-MM-DD for dedupe

    // Process users sequentially to avoid huge parallel fetches; you can batch if many users
    for (const doc of usersSnap.docs) {
      try {
        const user = doc.data();
        const fcmToken = user.fcmToken;
        const loc = user.location;
        if (!fcmToken || !loc || !loc.latitude || !loc.longitude) {
          console.log(`Skipping ${doc.id} (no token or location)`);
          continue;
        }

        // Check dedup: if lastNotifiedDate === today skip
        if (user.lastNotifiedDate === nowDateISO) {
          console.log(`Already notified today: ${doc.id}`);
          continue;
        }

        // Fetch forecast and analyze
        const forecast = await fetchDailyForecast(loc.latitude, loc.longitude);
        const hourly = forecast.hourly;
        if (!hourly) {
          console.log(`No hourly data for ${doc.id}`);
          continue;
        }

        const summary = analyzeHourlyForTriggers(hourly);
        if (!summary) {
          console.log(`No triggers today for ${doc.id}`);
          continue;
        }

        // Build and send notification
        const title = "Asthma Alert for Today 💨";
        const body = `Be careful today at these times:\n${summary}`;

        await admin.messaging().send({
          token: fcmToken,
          notification: { title, body },
        });

        // Mark lastNotifiedDate to avoid duplicate in the same day
        await db.collection("Users").doc(doc.id).update({
          lastNotifiedDate: nowDateISO
        });

        console.log(`Sent notification to ${doc.id}`);

      } catch (err) {
        console.error(`Error for user ${doc.id}:`, err.message || err);
      }
    } // end for users

    return null;
  });

/**
 * HTTP test endpoint so you can call the same logic on-demand for testing
 * POST JSON body: { uid: "userDocId" }  OR no body to run for all
 */
exports.testDailyWeatherNotifier = functions.https.onRequest(async (req, res) => {
  try {
    const uid = req.body && req.body.uid;
    const db = admin.firestore();
    if (uid) {
      const doc = await db.collection("Users").doc(uid).get();
      if (!doc.exists) return res.status(404).send("User not found");
      // reuse the scheduled handler by calling logic for single user
      const user = doc.data();
      const nowDateISO = (new Date()).toISOString().slice(0, 10);
      if (!user.fcmToken || !user.location) return res.status(400).send("No token/location");
      if (user.lastNotifiedDate === nowDateISO) return res.send("Already notified today");

      const forecast = await fetchDailyForecast(user.location.latitude, user.location.longitude);
      const summary = analyzeHourlyForTriggers(forecast.hourly);
      if (!summary) return res.send("No triggers today");
      await admin.messaging().send({
        token: user.fcmToken,
        notification: {
          title: "Asthma Alert for Today 💨",
          body: `Be careful today at these times:\n${summary}`
        }
      });
      await db.collection("Users").doc(uid).update({ lastNotifiedDate: nowDateISO });
      return res.send("Notification sent");
    } else {
      // run the scheduled function's logic for all users (dangerous for production, use carefully)
      await exports.dailyWeatherNotifier({}, {});
      return res.send("Triggered for all users");
    }
  } catch (err) {
    console.error(err);
    return res.status(500).send(err.message || String(err));
  }
});
