const fetch = require("node-fetch");
const admin = require("firebase-admin");

async function main() {
  try {
    console.log("🚀 Starting Egypt Weather Notification Job...");

    // 1. Initialize Firebase
    const serviceAccount = JSON.parse(process.env.FIREBASE_SERVICE_ACCOUNT);
    if (!admin.apps.length) {
      admin.initializeApp({
        credential: admin.credential.cert(serviceAccount),
      });
    }

    const db = admin.firestore();
    const usersSnapshot = await db.collection("Users").get();

    if (usersSnapshot.empty) {
      console.log("⚠️ No users found in Firestore.");
      return;
    }

    for (const userDoc of usersSnapshot.docs) {
      const user = userDoc.data();
      if (!user.fcmToken) continue;

      // Default to Cairo, Egypt coordinates
      const lat = user.latitude || 30.0444;
      const lon = user.longitude || 31.2357;

      /**
       * We use two different API endpoints because Open-Meteo splits
       * standard weather from air quality (Dust/Pollen).
       */
      const forecastUrl = `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&hourly=temperature_2m&forecast_days=1`;
      const airQualityUrl = `https://air-quality-api.open-meteo.com/v1/air-quality?latitude=${lat}&longitude=${lon}&hourly=dust,pollen_pollen_grass&forecast_days=1`;

      // Fetch both simultaneously to save time
      const [weatherRes, airRes] = await Promise.all([
        fetch(forecastUrl).then(res => res.json()),
        fetch(airQualityUrl).then(res => res.json())
      ]);

      const triggers = [];

      // TRIGGER: Cold Air (Higher threshold for Egypt: < 16°C)
      const hourlyTemps = weatherRes.hourly?.temperature_2m || [];
      if (hourlyTemps.some(t => t < 16)) {
        triggers.push("chilly air");
      }

      // TRIGGER: Dust (Threshold for Egypt: > 80 μg/m³)
      // Egypt is naturally dustier, so 50 might be too sensitive.
      const hourlyDust = airRes.hourly?.dust || [];
      if (hourlyDust.some(d => d > 80)) {
        triggers.push("dust/sand");
      }

      // TRIGGER: Pollen (Note: May be 0 in Egypt depending on season/model)
      const hourlyPollen = airRes.hourly?.pollen_pollen_grass || [];
      if (hourlyPollen.some(p => p > 30)) {
        triggers.push("pollen");
      }

      // 2. Send Notification if triggers are detected
      if (triggers.length > 0) {
        const message = `Alert: Today's conditions (${triggers.join(", ")}) may trigger asthma. Stay safe!`;

        try {
          await admin.messaging().send({
            token: user.fcmToken,
            notification: {
              title: "🌬️ Asthma Health Alert",
              body: message,
            },
            android: {
              priority: "high",
              notification: {
                sound: "default",
                channelId: "health_alerts"
              }
            },
            apns: {
              payload: {
                aps: { sound: "default" }
              }
            }
          });
          console.log(`✅ Alert sent to ${user.name || "User"} in Egypt: ${message}`);
        } catch (fcmError) {
          console.error(`❌ FCM error for ${user.email || userDoc.id}:`, fcmError.message);
        }
      } else {
        console.log(`🌤️ No triggers for ${user.name || "User"} (Cairo coordinates)`);
      }
    }

    console.log("🎉 Job finished successfully.");
  } catch (error) {
    console.error("❌ Critical Job Failure:", error);
    process.exit(1);
  }
}

main();