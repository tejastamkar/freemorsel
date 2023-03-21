// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:freemorsel/widgets/cards/foodcard.dart';

class MyDonations extends StatefulWidget {
  const MyDonations({Key? key}) : super(key: key);

  @override
  State<MyDonations> createState() => _MyDonationsState();
}

class _MyDonationsState extends State<MyDonations> {
  bool loader = true;
  List historyData = [];

  Future callApi() async {
    historyData.clear();
    await FirebaseFirestore.instance
        .collection("PendingDonation")
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              for (var doc in querySnapshot.docs) {historyData.add(doc.data())}
            });
    await FirebaseFirestore.instance
        .collection("Donation")
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              for (var doc in querySnapshot.docs) {historyData.add(doc.data())}
            })
        .whenComplete(() => setState(() => loader = false));
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
        onRefresh: callApi,
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              title: const Text(
                "My Donations",
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
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: loader
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: historyData.length,
                    itemBuilder: (context, index) {
                      DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(
                          historyData[index]["Time"].millisecondsSinceEpoch);
                      return FoodCard(
                          title: historyData[index]["foodName"],
                          status: historyData[index]["Status"],
                          image: historyData[index]["images"][0],
                          id: historyData[index]['donationId'],
                          date: "${tsdate.year}/${tsdate.month}/${tsdate.day}");
                    }),
          ),
        ));
  }
}
