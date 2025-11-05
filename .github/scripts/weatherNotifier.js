const fetch = require("node-fetch");
const admin = require("firebase-admin");

async function main() {
  try {
    // Initialize Firebase Admin with service account (from secret)
    const serviceAccount = parseServiceAccount(process.env.FIREBASE_SERVICE_ACCOUNT);
    admin.initializeApp({
      credential: admin.credential.cert({
        projectId: serviceAccount.FIREBASE_PROJECT_ID,
        clientEmail: serviceAccount.FIREBASE_CLIENT_EMAIL,
        privateKey: serviceAccount.FIREBASE_PRIVATE_KEY.replace(/\\n/g, '\n'),
      }),
    });

    const db = admin.firestore();

    // Get all users
    const usersSnapshot = await db.collection("Users").get();

    for (const userDoc of usersSnapshot.docs) {
      const user = userDoc.data();
      if (!user.fcmToken) continue;

      // TODO: Replace with actual coordinates if users can save them
      const latitude = user.latitude || 30.0444; // Default: Cairo
      const longitude = user.longitude || 31.2357;

      // Get weather from Open-Meteo
      const url = `${process.env.OPEN_METEO_API}?latitude=${latitude}&longitude=${longitude}&hourly=temperature_2m,dust,pollen_grass`;
      const response = await fetch(url);
      const weatherData = await response.json();

      // Simple trigger logic
      const triggers = [];

      const temps = weatherData.hourly.temperature_2m;
      if (temps.some(t => t < 15)) triggers.push("cold air");

      if (weatherData.hourly.dust && weatherData.hourly.dust.some(d => d > 50))
        triggers.push("dust levels");
      if (weatherData.hourly.pollen_grass && weatherData.hourly.pollen_grass.some(p => p > 50))
        triggers.push("pollen count");

      if (triggers.length > 0) {
        const message = `Today's asthma triggers: ${triggers.join(", ")}. Stay safe!`;

        await admin.messaging().send({
          token: user.fcmToken,
          notification: {
            title: "🌬️ Asthma Alert",
            body: message,
          },
        });

        console.log(`✅ Sent to ${user.name || user.email}: ${message}`);
      } else {
        console.log(`🌤️ No triggers for ${user.name || user.email}`);
      }
    }

  } catch (err) {
    console.error("❌ Error:", err);
    process.exit(1);
  }
}

function parseServiceAccount(secret) {
  const lines = secret.split("\n").filter(Boolean);
  const obj = {};
  for (const line of lines) {
    const [key, ...valueParts] = line.split("=");
    obj[key.trim()] = valueParts.join("=").trim().replace(/^"|"$/g, "");
  }
  return obj;
}

main();
