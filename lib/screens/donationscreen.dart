import 'dart:math';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/api/getdonation.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/models/postmodel.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
import 'package:freemorsel/widgets/cards/cardgrid.dart';
import 'package:freemorsel/widgets/cards/donationgridview.dart';

class DonationScreen extends StatefulWidget {
  final String id;
  const DonationScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  int current = 0;
  PostCardModel? data;
  Random random = Random();
  List otherDonation = [];
  bool loader = true;
  final List _colors = [primary2Color, primary3Color, primaryColor];
  getData() async {
    await FirebaseFirestore.instance
        .doc('Donation/${widget.id}')
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) async {
      otherDonation.addAll(await getDonationData());
      data = PostCardModel.fromMap(documentSnapshot.data()!);
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
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.white,
          // foregroundColor: Colors.black,
          title: const Text(
            'Donations',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      backgroundColor: Colors.white,
      body: loader
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 2,
                    color: _colors[random.nextInt(_colors.length)],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(width: 0.4, color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, right: 10, left: 10, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                                height: 250,
                                aspectRatio: 1 / 1,
                                viewportFraction: 1,
                                initialPage: 0,
                                autoPlay:
                                    data!.images.length > 1 ? true : false,
                                autoPlayInterval: const Duration(seconds: 12),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.easeInOut,
                                enlargeCenterPage: true,
                                scrollPhysics: data!.images.length > 1
                                    ? const ScrollPhysics()
                                    : const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    current = index;
                                  });
                                }),
                            items: data!.images.map((i) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  key: UniqueKey(),
                                  cacheManager: customCacheManager,
                                  placeholder: (context, url) => Container(
                                    height: 160,
                                    width: width,
                                    color: primary2Color,
                                  ),
                                  imageUrl: i,
                                  height: 160,
                                  width: width,
                                  fit: BoxFit.fitWidth,
                                ),
                              );
                            }).toList(),
                          ),
                          data!.images.length > 1
                              ? Center(
                                  child: CarouselIndicator(
                                    height: 10,
                                    width: 10,
                                    cornerRadius: 10,
                                    color: const Color.fromRGBO(0, 0, 0, 0.6),
                                    activeColor:
                                        const Color.fromARGB(255, 80, 0, 192),
                                    count: data!.images.length,
                                    index: current,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 30, 0, 15),
                            child: Text(
                              'Name: ${data!.name}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Food Name: ${data!.iteamName}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                            child: Text(
                              'Serves: ${data!.serves}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Level: ${data!.level}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 7),
                    child: Text(
                      "Other Donations",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  loader
                      ? donationcardskelton(
                          width: width, length: width < 441 ? 6 : 4)
                      : CardGridView(
                          width: width,
                          itemCount: width < 441 ? 6 : 4,
                          donationDataList: otherDonation,
                          // donationLimageList: otherDonationImages,
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Note:  ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: width - 100,
                          child: const Text(
                            'Higher the number of Level, Good number of feedback.',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.33),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
