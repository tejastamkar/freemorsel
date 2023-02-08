import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/screens/navbarscreens/add.dart';

Future fireStoreFileUpload(refStorageImage, refImage) async {
  String pathValue = '';
  final firebaseStorageRef =
      FirebaseStorage.instance.ref().child(refStorageImage);
  final uploadTask = firebaseStorageRef.putFile(File(refImage));
  final taskSnapshot = await uploadTask.whenComplete(() {});
  await taskSnapshot.ref.getDownloadURL().then((value) async {
    pathValue = value;
  });
  return pathValue;
}

Future createDonation(
    {required String foodName,
    required String type,
    required int serves,
    required int sizeOfGood,
    required String address}) async {
  List imageUrl = [];

  DocumentReference donationId =
      await FirebaseFirestore.instance.collection("PendingDonation").add({
    "foodName": foodName,
    "Level": level,
    "name": username,
    "address": address,
    "Serves": serves,
    "TypeOfDonation": type,
    "SizeOfGood": sizeOfGood,
    "userid": FirebaseAuth.instance.currentUser!.uid
  });
  await FirebaseFirestore.instance
      .collection("PendingDonation")
      .doc(donationId.id)
      .update({
    "donationId": donationId.id,
  });
  imageUrl = await uploadImages(
      donationId: donationId.id,
      userId: FirebaseAuth.instance.currentUser!.uid) as List;

  await FirebaseFirestore.instance
      .collection("PendingDonation/${donationId.id}")
      .doc(donationId.id)
      .update({
    "images": imageUrl,
  });

  // for (int i = 0; i < 20; i++) {
  //   await addtoDonation(address: address, serves: serves, foodName: foodName);
  // }
  imageList.clear();
  imageUrl.clear();
}

Future uploadImages(
    {required String donationId, required String userId}) async {
  List imageUrl = [];
  for (int i = 0; i < imageList.length; i++) {
    imageUrl.add(await fireStoreFileUpload(
        "$userId/$donationId/image-$i.jpg", imageList[i]));
  }
  return imageUrl;
}

Future addtoDonation(
    {required String foodName,
    required int serves,
    required String address}) async {
  List imageUrl = [];

  DocumentReference donationId =
      await FirebaseFirestore.instance.collection("Donations").add({
    "foodName": foodName,
    "Level": level,
    "name": username,
    "address": address,
    "Serves": 0,
    "userid": FirebaseAuth.instance.currentUser!.uid
  });
  await FirebaseFirestore.instance
      .collection("Donations")
      .doc(donationId.id)
      .update({
    "donationId": donationId.id,
  });
  imageUrl = await uploadImages(
      donationId: donationId.id,
      userId: FirebaseAuth.instance.currentUser!.uid) as List;

  for (int i = 0; i < imageUrl.length; i++) {
    await FirebaseFirestore.instance
        .collection("Donations/${donationId.id}/Images")
        .add({
      "Image": imageUrl[i],
    });
  }
  // imageList.clear();
  // imageUrl.clear();
}
