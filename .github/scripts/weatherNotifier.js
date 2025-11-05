const fetch = require("node-fetch");
const admin = require("firebase-admin");

async function main() {
  try {
    console.log("🚀 Starting weather notification job...");

    // Parse Firebase service account from secret
    const serviceAccount = JSON.parse(process.env.FIREBASE_SERVICE_ACCOUNT);

    // Initialize Firebase Admin SDK
    if (!admin.apps.length) {
      admin.initializeApp({
        credential: admin.credential.cert(serviceAccount),
      });
    }

    const db = admin.firestore();

    // Fetch all users from Firestore
    const usersSnapshot = await db.collection("Users").get();

    if (usersSnapshot.empty) {
      console.log("⚠️ No users found in Firestore.");
      return;
    }

    // Process each user
    for (const userDoc of usersSnapshot.docs) {
      const user = userDoc.data();
      if (!user.fcmToken) continue;

      // Default to Cairo if no location saved
      const latitude = user.latitude || 30.0444;
      const longitude = user.longitude || 31.2357;

      // Fetch weather from Open-Meteo
      const weatherUrl = `${process.env.OPEN_METEO_API}?latitude=${latitude}&longitude=${longitude}&hourly=temperature_2m,dust,pollen_grass`;
      const response = await fetch(weatherUrl);
      const weatherData = await response.json();

      const triggers = [];

      // Temperature trigger
      if (weatherData.hourly?.temperature_2m?.some((t) => t < 15)) {
        triggers.push("cold air");
      }

      // Dust and pollen triggers (if available)
      if (weatherData.hourly?.dust?.some((d) => d > 50)) {
        triggers.push("dust");
      }

      if (weatherData.hourly?.pollen_grass?.some((p) => p > 50)) {
        triggers.push("pollen");
      }

      // If any triggers exist, send a notification
      if (triggers.length > 0) {
        const message = `Today's asthma triggers: ${triggers.join(", ")}. Stay safe!`;

        await admin.messaging().send({
          token: user.fcmToken,
          notification: {
            title: "🌬️ Asthma Alert",
            body: message,
          },
        });

        console.log(`✅ Notification sent to ${user.name || user.email}: ${message}`);
      } else {
        console.log(`🌤️ No triggers detected for ${user.name || user.email}`);
      }
    }

    console.log("🎉 Weather notification job completed successfully.");
  } catch (error) {
    console.error("❌ Error in weatherNotifier.js:", error);
    process.exit(1);
  }
}

main();
