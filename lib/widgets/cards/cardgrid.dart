import 'package:flutter/material.dart';
import 'package:freemorsel/widgets/cards/cards.dart';

class CardGridView extends StatelessWidget {
  const CardGridView({
    Key? key,
    required this.width,
    required this.itemCount,
    required this.donationDataList,
    // required this.donationLimageList,
  }) : super(key: key);

  final double width;
  final int itemCount;
  final List donationDataList;
  // final List donationLimageList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width < 441 ? 3 : 2,
        ),
        itemBuilder: (context, index) => DonationCards(
              title: donationDataList[index]['foodName'],
              subtitle: donationDataList[index]['name'],
              image: donationDataList[index]["images"][0],
              id: donationDataList[index]['donationId'],
            ));
  }
}

// class SkeletonCardGridView extends StatelessWidget {
//   const SkeletonCardGridView({
//     Key? key,
//     required this.width,
//     required this.itemCount,
//   }) : super(key: key);

//   final double width;
//   final int itemCount;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: itemCount,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: width < 441 ? 3 : 2,
//         ),
//         itemBuilder: (context, index) => const SkeletonDonationCards());
//   }
// }
