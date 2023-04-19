import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/api/firebasehelper.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/models/hoteldatamodel.dart';
import 'package:freemorsel/widgets/cards/ngoinfo.dart';
import 'package:freemorsel/widgets/cards/restaurantinfo.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
import 'package:freemorsel/widgets/videocard.dart';

class CarouselCards extends StatelessWidget {
  final double width;
  final String image, title, id;
  const CarouselCards(
      {Key? key,
      required this.width,
      required this.image,
      required this.title,
      required this.id})
      : super(key: key);

  // openCampDetail({required contex}) async {
  //   await FirebaseHelper.getUserModelById(id: id)
  //       .then((campDetail) => Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //             builder: (context) => NgoInfo(
  //                   campDetail: campDetail,
  //                 )),
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await FirebaseHelper()
            .getCampDetailModel(id: id)
            .then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NgoInfo(campDetail: value!)),
                ));
      },
      child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(width: 0.4, color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    cacheManager: customCacheManager,
                    imageUrl: image,
                    height: width / 2.6,
                    width: width,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: width / 2.6,
                      width: width,
                      color: primary3Color,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: width,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class VideoCarosel extends StatelessWidget {
  final double width;
  final HotelDatamodel hotelData;
  const VideoCarosel({
    Key? key,
    required this.width,
    required this.hotelData,
  }) : super(key: key);

  // openCampDetail({required contex}) async {
  //   await FirebaseHelper.getUserModelById(id: id)
  //       .then((campDetail) => Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //             builder: (context) => NgoInfo(
  //                   campDetail: campDetail,
  //                 )),
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RestaurantInfo(
                    hotelData: hotelData,
                  )),
        );
      },
      child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(width: 0.4, color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: VideoCard(videoUrl: hotelData.cover)),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SizedBox(
                    width: width,
                    child: Text(
                      hotelData.hotelName,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SizedBox(
                    width: width,
                    child: Text(
                      "Owned by: ${hotelData.owner}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
