require('dotenv').config();
const fetch = require("node-fetch");
const admin = require("firebase-admin");

async function main() {
  try {
    console.log("🚀 Starting Egypt Weather Job...");

    // 1. Initialize Firebase Admin
    let serviceAccount;
    if (process.env.FIREBASE_SERVICE_ACCOUNT) {
      serviceAccount = JSON.parse(process.env.FIREBASE_SERVICE_ACCOUNT);
    } else if (process.env.FIREBASE_PROJECT_ID) {
      serviceAccount = {
        type: process.env.FIREBASE_TYPE,
        project_id: process.env.FIREBASE_PROJECT_ID,
        private_key_id: process.env.FIREBASE_PRIVATE_KEY_ID,
        private_key: process.env.FIREBASE_PRIVATE_KEY?.replace(/\\n/g, '\n'),
        client_email: process.env.FIREBASE_CLIENT_EMAIL,
        client_id: process.env.FIREBASE_CLIENT_ID,
        auth_uri: process.env.FIREBASE_AUTH_URI,
        token_uri: process.env.FIREBASE_TOKEN_URI,
        auth_provider_x509_cert_url: process.env.FIREBASE_AUTH_PROVIDER,
        client_x509_cert_url: process.env.FIREBASE_CLIENT_CERT_URL,
        universe_domain: process.env.FIREBASE_UNIVERSE_DOMAIN,
      };
    } else {
      throw new Error("❌ No Firebase credentials found! Check your .env or GitHub Secrets.");
    }

    if (!admin.apps.length) {
      admin.initializeApp({
        credential: admin.credential.cert(serviceAccount),
      });
    }

    const db = admin.firestore();
    const TEST_MODE = false;

    // 2. Fetch Users
    const usersSnapshot = await db.collection("Users").get();
    if (usersSnapshot.empty) {
      console.log("No users found in Firestore.");
      return;
    }

    // 3. Group users by a coarser location region (1 decimal place ~11km accuracy)
    // This allows fine/coarse GPS inputs to safely merge into local regional buckets like Cairo.
    const locationGroups = {};

    for (const userDoc of usersSnapshot.docs) {
      const user = userDoc.data();
      if (!user.fcmToken) continue;

      // Fallback defaults to central Cairo coordinates
      const rawLat = user.latitude || 30.0444;
      const rawLon = user.longitude || 31.2357;

      // Rounding to 1 decimal place aggregates local neighborhoods together
      const groupLat = Number(rawLat).toFixed(1);
      const groupLon = Number(rawLon).toFixed(1);
      const geoKey = `${groupLat}_${groupLon}`;

      if (!locationGroups[geoKey]) {
        locationGroups[geoKey] = {
          lat: groupLat,
          lon: groupLon,
          users: []
        };
      }

      locationGroups[geoKey].users.push({
        id: userDoc.id,
        email: user.email || "Unknown User",
        fcmToken: user.fcmToken
      });
    }

    console.log(`Grouped users into ${Object.keys(locationGroups).length} unique weather regions.`);

    // 4. Process each geographic group
    for (const geoKey in locationGroups) {
      const { lat, lon, users } = locationGroups[geoKey];
      let triggers = [];

      console.log(`🌤️ Processing weather for region [Lat: ${lat}, Lon: ${lon}] containing ${users.length} user(s)...`);

      if (TEST_MODE) {
        triggers = ["Test-Cold", "Test-Dust"];
      } else {
        try {
          const weatherUrl = `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&hourly=temperature_2m&forecast_days=1`;
          const airQualityUrl = `https://air-quality-api.open-meteo.com/v1/air-quality?latitude=${lat}&longitude=${lon}&hourly=dust,pollen_pollen_grass&forecast_days=1`;

          const [wRes, aRes] = await Promise.all([
            fetch(weatherUrl).then(r => {
              if (!r.ok) throw new Error(`Weather API status ${r.status}`);
              return r.json();
            }),
            fetch(airQualityUrl).then(r => {
              if (!r.ok) throw new Error(`Air Quality API status ${r.status}`);
              return r.json();
            })
          ]);

          if (wRes.hourly?.temperature_2m?.some(t => t < 16)) triggers.push("chilly air");
          if (aRes.hourly?.dust?.some(d => d > 80)) triggers.push("dust");

        } catch (apiError) {
          // If the API fails for this location, log it and move to the next region without crashing the job
          console.error(`Failed to fetch weather for region ${geoKey}:`, apiError.message);
          continue;
        }
      }

      // 5. Send multicast notifications if weather thresholds are breached
      if (triggers.length > 0) {
        const tokens = users.map(u => u.fcmToken);
        const conditionString = triggers.join(", ");

        try {
          // sendEachForMulticast is efficient and returns individual statuses for each token
          const response = await admin.messaging().sendEachForMulticast({
            tokens: tokens,
            notification: {
              title: "🌬️ Asthma Alert",
              body: `Conditions: ${conditionString}. Stay safe!`
            }
          });

          console.log(`Region [${geoKey}] broadcast complete: ${response.successCount} successful, ${response.failureCount} failed.`);

          // Optional: Loop through responses to spot/clean expired FCM tokens
          response.responses.forEach((res, idx) => {
            if (!res.success) {
              console.error(`   FCM Error for user ${users[idx].email}:`, res.error.message);
            }
          });

        } catch (fcmError) {
          console.error(`Heavy FCM broadcast error for region ${geoKey}:`, fcmError.message);
        }
      } else {
        console.log(`Region [${geoKey}] conditions are optimal. No alerts needed.`);
      }
    }

  } catch (error) {
    console.error("❌ Fatal Script Error:", error);
  }
}

// Execute the main thread and enforce script termination
main().then(() => {
  console.log("🏁 Weather job routine finished cleanly.");
  process.exit(0);
}).catch(err => {
  console.error("💥 Unhandled fatal crash:", err);
  process.exit(1);
});