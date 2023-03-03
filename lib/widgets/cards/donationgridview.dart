import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/screens/navbarscreens/donation.dart';
import 'package:freemorsel/skeleton/skeleton_container.dart';
import 'package:freemorsel/widgets/cards/cardgrid.dart';

class FoodDonationCardGrid extends StatefulWidget {
  const FoodDonationCardGrid({Key? key}) : super(key: key);

  @override
  State<FoodDonationCardGrid> createState() => _FoodDonationCardGridState();
}

class _FoodDonationCardGridState extends State<FoodDonationCardGrid> {
  List foodDonationList = [];
  // List foodDonationImages = [];
  bool loader = true;

  Future getData() async {
    await FirebaseFirestore.instance
        .collection('Donation')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        foodDonationList.add(doc.data());
        // Object? temp = doc.id;
        //  await    FirebaseFirestore.instance
        //         .collection('Donations/$temp/Images')
        //         .get()
        //         .then((QuerySnapshot querySnapshot) {
        //       for (var doc in querySnapshot.docs) {
        //         foodDonationImages.add(doc.data());
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
        loader
            ? headingskeleton()
            : Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
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
            ? donationcardskelton(width: width, length: width < 441 ? 6 : 4)
            : CardGridView(
                width: width,
                itemCount: width < 441 ? 6 : 4,
                donationDataList: foodDonationList,
                // donationLimageList: foodDonationList,
              ),
      ],
    );
  }
}

Widget headingskeleton() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              SkeletonContainer(radius: 0, width: 98, height: 18),
              Spacer(),
              SkeletonContainer(radius: 0, width: 54, height: 19)
            ],
          )
        ],
      ),
    );

Widget donationcardskelton({required double width, required int length}) =>
    GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: width < 441 ? 3 : 2,
        ),
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                height: 170,
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SkeletonContainer(
                              radius: 7, width: 150, height: 100),
                        ),
                        SkeletonContainer(radius: 0, width: 80, height: 20),
                        SizedBox(
                          height: 5,
                        ),
                        SkeletonContainer(radius: 0, width: 70, height: 12)
                      ]),
                ),
              ),
            )));

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
        .collection('Donation')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        goodDonation.add(doc.data());
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
        loader
            ? headingskeleton()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
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
            ? donationcardskelton(width: width, length: width < 441 ? 6 : 4)
            : CardGridView(
                width: width,
                itemCount: width < 441 ? 6 : 4,
                donationDataList: goodDonation,
                // donationLimageList: goodDonationImages,
              ),
      ],
    );
  }
}
