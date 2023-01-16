import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/widgets/cards/cardgrid.dart';

class Donation extends StatefulWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  List foodDonationList = [];
  List foodDonationImages = [];
  bool loader = true;

  getData() {
    FirebaseFirestore.instance
        .collection('Donations')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        foodDonationList.add(doc.data());
        Object? temp = doc.id;
        FirebaseFirestore.instance
            .collection('Donations/$temp/Images')
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            foodDonationImages.add(doc.data());
          }
        }).whenComplete(() => setState(() => loader = false));
      }
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () => getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: const Text(
              "FreeMorsel",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            )),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: loader
              ? SkeletonCardGridView(
                  width: width,
                  itemCount: 10,
                )
              : CardGridView(
                  width: width,
                  itemCount: foodDonationList.length,
                  donationDataList: foodDonationList,
                  donationLimageList: foodDonationImages,
                ),
        ));
  }
}
