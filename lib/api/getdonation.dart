import 'package:cloud_firestore/cloud_firestore.dart';

getDonationData() async {
  List donationData = [], donationImage = [];
  await FirebaseFirestore.instance
      .collection('Donations')
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      donationData.add(doc.data());
      Object? temp = doc.id;
      FirebaseFirestore.instance
          .collection('Donations/$temp/Images')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          donationImage.add(doc.data());
        }
      });
    }
  });

  return [donationData, donationImage];
}
