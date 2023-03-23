import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
import 'package:freemorsel/widgets/graph.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Reward extends StatefulWidget {
  const Reward({Key? key}) : super(key: key);
  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  int level = 0;

  getmylevel() {
    for (int i = 0; i <= 100; i++) {
      if (points >= 100) {
        points = points - 100;
      } else {
        level = i;
        break;
      }
    }
  }

  @override
  void initState() {
    getmylevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Rewards",
            style: TextStyle(
              fontSize: 25,
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
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: CircularPercentIndicator(
                    radius: 82.5,
                    lineWidth: 8.0,
                    percent: points / 100,
                    center: Column(
                      children: [
                        const SizedBox(height: 25),
                        Text(
                          "$level",
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          "Level",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "$points Points",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    progressColor: const Color.fromRGBO(117, 183, 158, 1),
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 15, 66, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: const [
                      Text(
                        "10",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "    No of\nDonations",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ]),
                    Column(children: const [
                      Text(
                        "15",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Rank\n(City)",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ]),
                    Column(children: const [
                      Text(
                        "9",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Rank\n(Area)",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ],
                ),
              ),
              // SizedBox(
              //   width: width - 20,
              //   child: Card(
              //     elevation: 3,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(18),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Padding(
              //           padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
              //           child: Text(
              //             "Your Weekly Activity",
              //             style: TextStyle(
              //                 fontSize: 18, fontWeight: FontWeight.w400),
              //           ),
              //         ),
              //         const Padding(
              //           padding: EdgeInsets.fromLTRB(25, 5, 0, 11),
              //           child: Text(
              //             "Last 5 weeks",
              //             style: TextStyle(
              //                 fontSize: 15, fontWeight: FontWeight.w400),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(
              //               vertical: 10, horizontal: 40),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               CircularPercentIndicator(
              //                 radius: 25.0,
              //                 lineWidth: 7.0,
              //                 percent: 0.25,
              //                 progressColor:
              //                     const Color.fromRGBO(117, 183, 158, 1),
              //                 footer: const Text(
              //                   "W1",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.w400,
              //                       fontSize: 16.0),
              //                 ),
              //                 circularStrokeCap: CircularStrokeCap.round,
              //               ),
              //               CircularPercentIndicator(
              //                 radius: 25.0,
              //                 lineWidth: 7.0,
              //                 percent: 0.25,
              //                 progressColor:
              //                     const Color.fromRGBO(117, 183, 158, 1),
              //                 footer: const Text(
              //                   "W2",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.w400,
              //                       fontSize: 16.0),
              //                 ),
              //                 circularStrokeCap: CircularStrokeCap.round,
              //               ),
              //               CircularPercentIndicator(
              //                 radius: 25.0,
              //                 lineWidth: 7.0,
              //                 percent: 0.25,
              //                 progressColor:
              //                     const Color.fromRGBO(117, 183, 158, 1),
              //                 footer: const Text(
              //                   "W3",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.w400,
              //                       fontSize: 16.0),
              //                 ),
              //                 circularStrokeCap: CircularStrokeCap.round,
              //               ),
              //               CircularPercentIndicator(
              //                 radius: 25.0,
              //                 lineWidth: 7.0,
              //                 percent: 0.25,
              //                 progressColor:
              //                     const Color.fromRGBO(117, 183, 158, 1),
              //                 footer: const Text(
              //                   "W4",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.w400,
              //                       fontSize: 16.0),
              //                 ),
              //                 circularStrokeCap: CircularStrokeCap.round,
              //               ),
              //               CircularPercentIndicator(
              //                 radius: 25.0,
              //                 lineWidth: 7.0,
              //                 percent: 0.25,
              //                 progressColor:
              //                     const Color.fromRGBO(117, 183, 158, 1),
              //                 footer: const Text(
              //                   "W5",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.w400,
              //                       fontSize: 16.0),
              //                 ),
              //                 circularStrokeCap: CircularStrokeCap.round,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width - 20,
                child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Rank(City & Area)",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Last 5 weeks",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.circle,
                                          size: 12,
                                          color:
                                              Color.fromRGBO(117, 183, 158, 1),
                                        ),
                                        Text(
                                          " City",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.circle,
                                          size: 12,
                                          color:
                                              Color.fromRGBO(106, 140, 175, 1),
                                        ),
                                        Text(
                                          "Area",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        SizedBox(height: height / 5, child: const BarChart())
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Friends",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width - 140,
                    child: Card(
                      color: primary3Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  "1st",
                                  style: TextStyle(
                                    fontFamily: "overpass",
                                    fontSize: 36,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Dhoni",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "170 points",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Image.asset("assets/profile1.png", height: 80),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width - 180,
                    child: Card(
                      color: primary2Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  "2nd",
                                  style: TextStyle(
                                    fontFamily: "overpass",
                                    fontSize: 36,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Virat",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "130 points",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Image.asset("assets/profile2.png", height: 80),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width - 220,
                    child: Card(
                      color: primary3Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  "3rd",
                                  style: TextStyle(
                                    fontFamily: "overpass",
                                    fontSize: 36,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Rohit",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "130 points",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Image.asset("assets/profile1.png", height: 80),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Card(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        color: primary2Color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                children: [
                  const Text(
                    "16",
                    style: TextStyle(
                      fontFamily: "overpass",
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "You",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "20 points",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/profileavatar/avatar-$profilePicSelector.svg",
                    width: 70,
                    height: 70,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
