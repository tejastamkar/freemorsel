import 'package:flutter/material.dart';
import 'package:freemorsel/screens/navbarscreens/donation.dart';
import 'package:freemorsel/skeleton/skeleton_container.dart';
import 'package:freemorsel/widgets/cards/cardgrid.dart';

class FoodDonationCardGrid extends StatefulWidget {
  final List foodDonationList;
  final bool loader;
  const FoodDonationCardGrid(
      {Key? key, required this.foodDonationList, this.loader = true})
      : super(key: key);

  @override
  State<FoodDonationCardGrid> createState() => _FoodDonationCardGridState();
}

class _FoodDonationCardGridState extends State<FoodDonationCardGrid> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        widget.loader
            ? headingskeleton()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Food Donations",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Donation(
                                    whichData: 'Food',
                                  )),
                        );
                      },
                      child: const Row(
                        children: [
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
        widget.loader
            ? donationcardskelton(width: width, length: width < 441 ? 6 : 4)
            : CardGridView(
                width: width,
                itemCount: width < 441
                    ? 6
                    : widget.foodDonationList.length < 4
                        ? widget.foodDonationList.length
                        : 4,
                donationDataList: widget.foodDonationList,
                // donationLimageList: foodDonationList,
              ),
      ],
    );
  }
}

Widget headingskeleton() => const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
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
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
  final List goodDonation;
  final bool loader;
  const GoodsDonationCardGrid(
      {Key? key, required this.goodDonation, this.loader = true})
      : super(key: key);

  @override
  State<GoodsDonationCardGrid> createState() => _GoodsDonationCardGridState();
}

class _GoodsDonationCardGridState extends State<GoodsDonationCardGrid> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        widget.loader
            ? headingskeleton()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Good Donations",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Donation(
                                    whichData: 'Good',
                                  )),
                        );
                      },
                      child: const Row(
                        children: [
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
        widget.loader
            ? donationcardskelton(width: width, length: width < 441 ? 6 : 4)
            : CardGridView(
                width: width,
                itemCount: width < 441
                    ? 6
                    : widget.goodDonation.length < 4
                        ? widget.goodDonation.length
                        : 4,
                donationDataList: widget.goodDonation,
                // donationLimageList: goodDonationImages,
              ),
      ],
    );
  }
}
