import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/screens/friends.dart';
import 'package:freemorsel/widgets/graph.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Reward extends StatefulWidget {
  const Reward({Key? key}) : super(key: key);
  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
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
              SizedBox(
                width: width - 20,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
                        child: Text(
                          "Your Weekly Activity",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(25, 5, 0, 11),
                        child: Text(
                          "Last 5 weeks",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircularPercentIndicator(
                              radius: 25.0,
                              lineWidth: 7.0,
                              percent: 0.25,
                              progressColor:
                                  const Color.fromRGBO(117, 183, 158, 1),
                              footer: const Text(
                                "W1",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            CircularPercentIndicator(
                              radius: 25.0,
                              lineWidth: 7.0,
                              percent: 0.25,
                              progressColor:
                                  const Color.fromRGBO(117, 183, 158, 1),
                              footer: const Text(
                                "W2",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            CircularPercentIndicator(
                              radius: 25.0,
                              lineWidth: 7.0,
                              percent: 0.25,
                              progressColor:
                                  const Color.fromRGBO(117, 183, 158, 1),
                              footer: const Text(
                                "W3",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            CircularPercentIndicator(
                              radius: 25.0,
                              lineWidth: 7.0,
                              percent: 0.25,
                              progressColor:
                                  const Color.fromRGBO(117, 183, 158, 1),
                              footer: const Text(
                                "W4",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            CircularPercentIndicator(
                              radius: 25.0,
                              lineWidth: 7.0,
                              percent: 0.25,
                              progressColor:
                                  const Color.fromRGBO(117, 183, 158, 1),
                              footer: const Text(
                                "W5",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                height: 10,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FriendsRank())),
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/friends.svg',
                          height: 30,
                          width: 30,
                        ),
                        const Text(
                          "View My Rank",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
