import 'package:cloud_firestore/cloud_firestore.dart';

getDonationData() async {
  List donationData = [];
  await FirebaseFirestore.instance
      .collection('Donation')
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      donationData.add(doc.data());
    }
  });

  return donationData;
}

Future deletePendingDonation({required String donationId}) async {
  await FirebaseFirestore.instance.doc("PendingDonation/$donationId").delete();
}
