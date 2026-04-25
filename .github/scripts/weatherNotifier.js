require('dotenv').config();
const fetch = require("node-fetch");
const admin = require("firebase-admin");

async function main() {
  try {
    console.log("🚀 Starting Egypt Weather Job...");

    // Mapping your .env keys to the Firebase Service Account object
    const serviceAccount = {
      type: process.env.FIREBASE_TYPE,
      project_id: process.env.FIREBASE_PROJECT_ID,
      private_key_id: process.env.FIREBASE_PRIVATE_KEY_ID,
      // We use .replace for Node.js to handle the newline characters correctly
      private_key: process.env.FIREBASE_PRIVATE_KEY ? process.env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, '\n') : undefined,
      client_email: process.env.FIREBASE_CLIENT_EMAIL,
      client_id: process.env.FIREBASE_CLIENT_ID,
      auth_uri: process.env.FIREBASE_AUTH_URI,
      token_uri: process.env.FIREBASE_TOKEN_URI,
      auth_provider_x509_cert_url: process.env.FIREBASE_AUTH_PROVIDER,
      client_x509_cert_url: process.env.FIREBASE_CLIENT_CERT_URL,
      universe_domain: process.env.FIREBASE_UNIVERSE_DOMAIN,
    };

    // Initialize Firebase Admin SDK
    if (!admin.apps.length) {
      admin.initializeApp({
        credential: admin.credential.cert(serviceAccount),
      });
    }

    const db = admin.firestore();

    // --- TEST MODE: SET TO TRUE TO BYPASS WEATHER CHECK ---
    const TEST_MODE = true;

    const usersSnapshot = await db.collection("Users").get();

    if (usersSnapshot.empty) {
      console.log("⚠️ No users found in Firestore.");
      return;
    }

    for (const userDoc of usersSnapshot.docs) {
      const user = userDoc.data();
      if (!user.fcmToken) continue;

      let triggers = [];

      if (TEST_MODE) {
        triggers = ["Test-Cold", "Test-Dust"];
      } else {
        const lat = user.latitude || 30.0444; // Default Cairo
        const lon = user.longitude || 31.2357;

        const weatherUrl = `https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&hourly=temperature_2m&forecast_days=1`;
        const airQualityUrl = `https://air-quality-api.open-meteo.com/v1/air-quality?latitude=${lat}&longitude=${lon}&hourly=dust,pollen_pollen_grass&forecast_days=1`;

        const [wRes, aRes] = await Promise.all([
          fetch(weatherUrl).then(r => r.json()),
          fetch(airQualityUrl).then(r => r.json())
        ]);

        if (wRes.hourly?.temperature_2m?.some(t => t < 16)) triggers.push("chilly air");
        if (aRes.hourly?.dust?.some(d => d > 80)) triggers.push("dust");
      }

      if (triggers.length > 0) {
        try {
          await admin.messaging().send({
            token: user.fcmToken,
            notification: {
              title: "🌬️ Asthma Alert",
              body: `Conditions: ${triggers.join(", ")}. Stay safe!`
            }
          });
          console.log(`✅ Success: Notification sent to ${user.email || userDoc.id}`);
        } catch (fcmError) {
          console.error(`❌ FCM Error for ${user.email}:`, fcmError.message);
        }
      }
    }
  } catch (error) {
    console.error("❌ Fatal Error:", error);
  }
}

main();