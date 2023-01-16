import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/screens/navbarscreens/donation.dart';
import 'package:freemorsel/widgets/cards/cardgrid.dart';
import 'package:freemorsel/widgets/skeleton.dart';

class FoodDonationCardGrid extends StatefulWidget {
  const FoodDonationCardGrid({Key? key}) : super(key: key);

  @override
  State<FoodDonationCardGrid> createState() => _FoodDonationCardGridState();
}

class _FoodDonationCardGridState extends State<FoodDonationCardGrid> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: loader
              ? Skeleton(
                  width: width - 40,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Food Donated",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Donation()),
                        );
                      },
                      child: Row(
                        children: const [
                          Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(27, 215, 215, 100)),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Color.fromRGBO(27, 215, 215, 100),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
        loader
            ? SkeletonCardGridView(
                width: width,
                itemCount: width < 441 ? 6 : 4,
              )
            : CardGridView(
                width: width,
                itemCount: width < 441 ? 6 : 4,
                donationDataList: foodDonationList,
                donationLimageList: foodDonationImages,
              ),
      ],
    );
  }
}

class GoodsDonationCardGrid extends StatefulWidget {
  const GoodsDonationCardGrid({Key? key}) : super(key: key);

  @override
  State<GoodsDonationCardGrid> createState() => _GoodsDonationCardGridState();
}

class _GoodsDonationCardGridState extends State<GoodsDonationCardGrid> {
  List goodDonation = [];
  List goodDonationImages = [];
  bool loader = true;

  getData() {
    FirebaseFirestore.instance
        .collection('Donations')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        goodDonation.add(doc.data());
        Object? temp = doc.id;
        FirebaseFirestore.instance
            .collection('Donations/$temp/Images')
            .get()
            .then((QuerySnapshot querySnapshot) => goodDonationImages
                .add({for (var doc in querySnapshot.docs) doc.data()}));
      }
    }).whenComplete(() => setState(() => loader = false));
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () => getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: loader
              ? Skeleton(
                  width: width - 40,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Food Donated",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Donation()),
                        );
                      },
                      child: Row(
                        children: const [
                          Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(27, 215, 215, 100)),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Color.fromRGBO(27, 215, 215, 100),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
        loader
            ? SkeletonCardGridView(
                width: width,
                itemCount: width < 441 ? 6 : 4,
              )
            : CardGridView(
                width: width,
                itemCount: width < 441 ? 6 : 4,
                donationDataList: goodDonation,
                donationLimageList: goodDonationImages,
              ),
      ],
    );
  }
}
