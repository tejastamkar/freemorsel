import functions from "firebase-functions";
import admin from 'firebase-admin';
import serviceAccount from "./serviceAccountKey.json" assert { type: "json" };


admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});




const db = admin.firestore();

// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
export const pickupCall = functions.region("asia-south1").firestore.document('PendingDonation/{donationId}')
    .onCreate(async (snapshot, context) => {
        const donationId = context.params.donationId;
        const donationData = snapshot.data();

        await db.collection("Rider").where("Active", "==", "").get().then((value) => value.docs.forEach(async (riderdetail) => {
            const payload = {
                token: riderdetail.data()["token"].toString(),
                notification: {
                    title: `FreeMorsel Rider`,
                    body: `Pickup Near ${donationData["address"]}`,
                },
                data: {
                    body: `Pickup Near ${donationData["address"]}`,
                }
            };
            await admin.messaging().send(payload).then((response) => {
                // Response is a message ID string.
                console.log("notification send");
                console.log('Successfully sent message:', response);

            }).catch((error) => {
                console.log("error:", error.code);
            });
        }));

        return Promise.resolve();
    });
export const pickupAlertCall = functions.region("asia-south1").firestore.document('PendingDonation/{donationId}')
    .onUpdate(async (snapshort, context) => {
        const donationData = snapshort.after.data();
        const donationId = context.params.donationId;
        const userDetail = await db.collection("Users").doc(donationData["userId"]).get().then((doc) => doc.data());


        if (donationData["Status"] == "Active") {

            await db.collection("Rider").where("Active", "==", donationId).get().then((value) => value.docs.forEach(async (doc) => {

                const payload = {
                    token: userDetail["token"].toString(),
                    notification: {
                        title: `FreeMorsel`,
                        body: `Your order will be picked up by ${doc["username"]}`,
                    },
                    data: {
                        body: `Your order will be picked up by ${doc["username"]}`,
                    }
                };
                await admin.messaging().send(payload).then((response) => {
                    // Response is a message ID string.
                    console.log("notification send");
                    console.log('Successfully sent message:', response);

                }).catch((error) => {
                    console.log("error:", error.code);
                });

            }));

        }
        return Promise.resolve();
    });

