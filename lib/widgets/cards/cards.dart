import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/screens/donationscreen.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';

class DonationCards extends StatelessWidget {
  final String title, subtitle, image, id;

  const DonationCards({
    Key? key,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DonationScreen(
                        id: id,
                      )));
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(width: 0.4, color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          color: primary2Color,
                          height: 120,
                          width: width,
                        ),
                        key: UniqueKey(),
                        cacheManager: customCacheManager,
                        height: 120,
                        width: width,
                        imageUrl: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width,
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Text(
                    title,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // ),
        ),
      ),
    );
  }
}



// class SkeletonDonationCards extends StatelessWidget {
//   const SkeletonDonationCards({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 child: Center(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: const Skeleton(
//                       width: 300,
//                       height: 120,
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               const Skeleton(
//                   // width: 20,
//                   ),
//               const Spacer(),
//               const Skeleton(
//                   // width: 20,
//                   ),
//               const Spacer(),
//             ],
//           ),
//         ),
//         // ),
//       ),
//     );
//   }
// }
