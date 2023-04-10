import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:freemorsel/models/hoteldatamodel.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
import 'package:freemorsel/widgets/videocard.dart';
import 'package:intl/intl.dart';

class RestaurantInfo extends StatefulWidget {
  // String image, name;
  final HotelDatamodel hotelData;
  const RestaurantInfo({super.key, required this.hotelData});

  @override
  State<RestaurantInfo> createState() => _RestaurantInfoState();
}

class _RestaurantInfoState extends State<RestaurantInfo> {
  final hoteldata = CacheManager(Config('customCacheManager',
      stalePeriod: const Duration(minutes: 20), maxNrOfCacheObjects: 100));
  int hotelImageIndex = 0, donationImageIndex = 0;
  String timming = DateFormat('h:mm a').format(DateTime.now());
  @override
  void initState() {
    timming = DateFormat('h:mm a').format(widget.hotelData.timming);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Restaurant Details",
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: VideoCard(
              videoUrl: widget.hotelData.cover,
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.hotelData.hotelName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Text(
              "Owned by: ${widget.hotelData.owner}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Donation Timings: After $timming",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              "Hotel Images",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: primary2Color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                  // height: 250,
                  // height: width / 1.8,
                  onPageChanged: (i, r) {
                    setState(() {
                      hotelImageIndex = i;
                    });
                  },
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  enlargeFactor: 0,
                  autoPlayCurve: Curves.linear,
                  autoPlayInterval: const Duration(seconds: 8),
                  enlargeCenterPage: false,
                  padEnds: false,
                  scrollDirection: Axis.horizontal,
                ),
                items: widget.hotelData.hotelImage
                    .map(
                      (image) => Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () => showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                    child: CachedNetworkImage(
                                      // color: primaryColor,
                                      key: UniqueKey(),
                                      cacheManager: hoteldata,
                                      imageUrl: image,
                                      // height: width / 2.5,
                                      // width: width,
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) => Container(
                                        height: width / 2.5,
                                        width: width,
                                        color: primaryColor,
                                      ),
                                    ),
                                  )),
                          child: CachedNetworkImage(
                            key: UniqueKey(),
                            cacheManager: hoteldata,
                            imageUrl: image,
                            height: width / 2.5,
                            width: width,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              height: width / 2.5,
                              width: width,
                              color: primary3Color,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CarouselIndicator(
                  height: 10,
                  width: 10,
                  activeColor: primary2Color,
                  color: const Color.fromRGBO(196, 196, 196, 1),
                  count: widget.hotelData.hotelImage.length,
                  index: hotelImageIndex,
                ),
              ),
            ),
            Text(
              "Donation Images",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: primary2Color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                  // height: 250,
                  // height: width / 1.8,
                  onPageChanged: (i, r) {
                    setState(() {
                      donationImageIndex = i;
                    });
                  },
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  enlargeFactor: 0,
                  autoPlayCurve: Curves.linear,
                  autoPlayInterval: const Duration(seconds: 8),
                  enlargeCenterPage: false,
                  padEnds: false,
                  scrollDirection: Axis.horizontal,
                ),
                items: widget.hotelData.donationImage
                    .map(
                      (image) => Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () => showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                    child: CachedNetworkImage(
                                      // color: primaryColor,
                                      key: UniqueKey(),
                                      cacheManager: hoteldata,
                                      imageUrl: image,
                                      // height: width / 2.5,
                                      // width: width,
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) => Container(
                                        height: width / 2.5,
                                        width: width,
                                        color: primaryColor,
                                      ),
                                    ),
                                  )),
                          child: CachedNetworkImage(
                            // color: primaryColor,
                            key: UniqueKey(),
                            cacheManager: hoteldata,
                            imageUrl: image,
                            height: width / 2.5,
                            width: width,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => Container(
                              height: width / 2.5,
                              width: width,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CarouselIndicator(
                  height: 10,
                  width: 10,
                  activeColor: primary2Color,
                  color: const Color.fromRGBO(196, 196, 196, 1),
                  count: widget.hotelData.donationImage.length,
                  index: donationImageIndex,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
