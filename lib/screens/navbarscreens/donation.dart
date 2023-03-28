import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/widgets/cards/cardgrid.dart';
import 'package:freemorsel/widgets/cards/donationgridview.dart';

class Donation extends StatefulWidget {
  final String whichData;
  const Donation({Key? key, required this.whichData}) : super(key: key);

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  List donationList = [];

  bool loader = true;

  Future getData() async {
    await FirebaseFirestore.instance
        .doc('Donation/${widget.whichData}')
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      donationList.add(documentSnapshot.data());
    }).whenComplete(() => setState(() => loader = false));
  }

  @override
  void initState() {
    getData();
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
              ? donationcardskelton(width: width, length: 6)
              : CardGridView(
                  width: width,
                  itemCount: donationList.length,
                  donationDataList: donationList,
                  // donationLimageList: foodDonationImages,
                ),
        ));
  }
}
