import 'package:flutter/material.dart';
import 'package:freemorsel/screens/donationscreen.dart';

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
    return Padding(
      padding: const EdgeInsets.all(5.0),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 120,
                        width: 300,
                        child: Image.network(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 140,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const Spacer(),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800),
                ),
                // const Spacer(),
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
