import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/api/getdonation.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/models/postmodel.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';

class DonationStatusCard extends StatefulWidget {
  final String id, status;
  final Function getAPi;
  const DonationStatusCard(
      {Key? key, required this.id, required this.status, required this.getAPi})
      : super(key: key);

  @override
  State<DonationStatusCard> createState() => _DonationStatusCardState();
}

class _DonationStatusCardState extends State<DonationStatusCard> {
  int current = 0;
  PostCardModel? data;

  List otherDonation = [];
  bool loader = true;

  getData({required String id}) async {
    await FirebaseFirestore.instance
        .collection(widget.status == "Done" ? "Donation" : "PendingDonation")
        .doc(id)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      if (documentSnapshot.exists) {
        data = PostCardModel.fromMap(documentSnapshot.data()!);
        setState(() => loader = false);
      }
    });
  }

  @override
  void initState() {
    getData(id: widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            'Order',
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
      body: SafeArea(
          child: loader
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Card(
                    elevation: 2,
                    color: secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(width: 0.4, color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 30),
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
                            items: data?.images.map((i) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Container(
                                    height: 160,
                                    width: width,
                                    color: primary2Color,
                                  ),
                                  key: UniqueKey(),
                                  cacheManager: customCacheManager,
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
                                    count: data?.images.length,
                                    index: current,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 30, 0, 15),
                            child: Text(
                              'Name: ${data?.name}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Item Name: ${data?.iteamName}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                            child: Text(
                              'Address: ${data?.address}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
                            child: Text(
                              'Serves: ${data?.serves}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          data?.typeofDonation == "Good"
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, bottom: 15),
                                  child: Text(
                                    data?.size == 0
                                        ? 'Size Of Good: Small'
                                        : data?.size == 1
                                            ? 'Size Of Good: Medium'
                                            : 'Size Of Good: Large',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Level: ${data?.level}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5, top: 15, bottom: 20),
                            child: Text(
                              'Status: ${data?.status}',
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
                )),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          data?.status == "pending"
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        deletePendingDonation(donationId: widget.id);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: primary2Color,
                          minimumSize: Size(width, 50)),
                      child: const Text(
                        "Cancel Pickup",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      )),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
