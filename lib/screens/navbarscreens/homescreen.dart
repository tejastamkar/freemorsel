import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:freemorsel/widgets/carouselviews.dart';
import 'package:freemorsel/widgets/cards/donationgridview.dart';
import 'package:freemorsel/widgets/tutorialcard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingData = [], foodDonationList = [], goodDonation = [];
  bool trendingDataloader = true, foodDataLoader = true, goodDataLoader = true;
  Future getTrendingData() async {
    await FirebaseFirestore.instance
        .collection('TrendingCampaigns')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        trendingData.add(doc.data());
      }
      trendingData.shuffle();
    }).whenComplete(
            () => mounted ? setState(() => trendingDataloader = false) : null);
  }

  Future getDonationData() async {
    await FirebaseFirestore.instance
        .collection('Donation')
        .where("TypeOfDonation", isEqualTo: "Food")
        .limit(4)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        foodDonationList.add(doc.data());
      }
      foodDonationList.shuffle();
    }).whenComplete(() => foodDonationList.isNotEmpty && mounted
            ? setState(() => foodDataLoader = false)
            : null);
    await FirebaseFirestore.instance
        .collection('Donation')
        .where("TypeOfDonation", isEqualTo: "Good")
        .limit(4)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        goodDonation.add(doc.data());
      }
      goodDonation.shuffle();
    }).whenComplete(() => goodDonation.isNotEmpty && mounted
            ? setState(() => goodDataLoader = false)
            : null);
  }

  Future callApi() async {
    await getTrendingData();
    await getDonationData();
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: callApi,
      child: Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TutorialCard(),
                TrendingCampaigns(
                  trendingData: trendingData,
                  loader: trendingDataloader,
                ),
                FoodDonationCardGrid(
                  foodDonationList: foodDonationList,
                  loader: foodDataLoader,
                ),
                GoodsDonationCardGrid(
                  goodDonation: goodDonation,
                  loader: goodDataLoader,
                ),
                // UpComingEvents(),
              ],
            )),
      ),
    );
  }
}
