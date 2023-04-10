// import { initializeApp, credential as _credential } from "firebase-admin";
import { data } from "./data.js";
import admin from "firebase-admin";
import serviceAccount from "./serviceAccountKey.json" assert { type: "json" };

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});
const db = admin.firestore();
async function uploadData() {
  data.forEach(async (data) => {
    await db.collection("Camps").add(data);
  });
}

async function addReview() {
  for (var i = 0; i < data.length; i++) {
    var ref = await db.collection("Camps").add(data[i]);
    await db.doc(`Camps/${ref.id}`).update({ id: ref.id });
  }
}
async function copyData() {
  await db
    .doc("hotels/GDNNjLi3X1Oz6ZySuWDI")
    .get()
    .then(async (value) => {
      await db.collection("hotels").add(value.data());
    });
}

// copyData()