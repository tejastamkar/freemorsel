import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/data/carddata.dart';
import 'package:freemorsel/skeleton/skeleton_container.dart';
import 'package:freemorsel/widgets/carouselcards.dart';

class TrendingCampaigns extends StatefulWidget {
  const TrendingCampaigns({Key? key}) : super(key: key);

  @override
  State<TrendingCampaigns> createState() => _TrendingCampaignsState();
}

class _TrendingCampaignsState extends State<TrendingCampaigns> {
  List trendingData = [];
  bool loader = true;
  Future getData() async {
    await FirebaseFirestore.instance
        .collection('TrendingCampaigns')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        trendingData.add(doc.data());
      }
    }).whenComplete(() => setState(() => loader = false));
    print(trendingData);
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () => getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (loader) {
      return trandingskeleton(width: width);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Trending Campaigns",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 278,
              // height: width / 1.85,
              // aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 8),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: trendingData
                .map((data) => CarouselCards(
                      width: width,
                      image: data["image"],
                      title: data["title"],
                      id: data["id"],
                    ))
                .toList(),
          ),
        ],
      );
    }
  }
}

class UpComingEvents extends StatefulWidget {
  const UpComingEvents({Key? key}) : super(key: key);

  @override
  State<UpComingEvents> createState() => _UpComingEventsState();
}

class _UpComingEventsState extends State<UpComingEvents> {
  List upComingEventsData = [];
  bool loader = true;
  getData() {
    FirebaseFirestore.instance
        .collection('UpComing')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        upComingEventsData.add(doc.data());
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
    if (loader == true) getData();
    double width = MediaQuery.of(context).size.width;
    return loader
        ? trandingskeleton(width: width)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Upcoming Campaigns",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 278,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 8),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: carouselCardUpcomingEventsData
                    .map((data) => CarouselCards(
                          width: width,
                          image: data["image"],
                          title: data["title"],
                          id: data["id"].toString(),
                        ))
                    .toList(),
              ),
            ],
          );
  }
}

Widget trandingskeleton({required double width}) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SkeletonContainer(
            width: 150,
            height: 20,
            radius: 0,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          height: 275,
          width: 350,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SkeletonContainer(radius: 15, width: width - 60, height: 185),
                const SizedBox(
                  height: 10,
                ),
                const SkeletonContainer(radius: 0, width: 328, height: 30)
              ],
            ),
          ),
        ),

        // SkeletonContainer(radius: 15, width: 400, height: 278)
      ],
    );
// class CarouselSkeletonView extends StatelessWidget {
//   const CarouselSkeletonView({Key? key, required this.width}) : super(key: key);
//   final double width;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 20),
//           child: Skeleton(
//             width: 180,
//             height: 20,
//           ),
//         ),
//         Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Skeleton(
//                       height: 160,
//                       width: width - 60,
//                     )),
//                 Container(
//                     padding: const EdgeInsets.only(top: 5),
//                     width: width - 60,
//                     height: 20,
//                     child: const Skeleton()),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
