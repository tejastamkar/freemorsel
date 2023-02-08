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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TutorialCard(width: width),
            const TrendingCampaigns(),
            const FoodDonationCardGrid(),
            const UpComingEvents(),
          ],
        ),
      )),
    );
  }
}
