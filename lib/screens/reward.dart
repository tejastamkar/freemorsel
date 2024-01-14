import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  int prograssPoints = points;
  List ranks = [];
  bool getrankloader = true;

  getmylevel() async {
    for (int i = 0; i <= 100; i++) {
      if (prograssPoints >= 100) {
        prograssPoints = prograssPoints - 100;
      } else {
        level = i;
        await FirebaseFirestore.instance
            .doc("Users/${FirebaseAuth.instance.currentUser!.uid}")
            .update({"level": level});
        break;
      }
    }
  }

  callApi() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .orderBy("Points", descending: true)
        .limit(3)
        .get()
        .then((value) => {
              for (var doc in value.docs) {ranks.add(doc)}
            });
    if (ranks.isNotEmpty) {
      setState(() {
        getrankloader = false;
      });
    }
  }

  @override
  void initState() {
    getmylevel();
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: getrankloader
            ? const SizedBox.shrink()
            : Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: CircularPercentIndicator(
                      radius: 82.5,
                      lineWidth: 8.0,
                      percent: prograssPoints / 100,
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
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rank",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "Last 4 weeks",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 12,
                                            color: Color.fromRGBO(
                                                117, 183, 158, 1),
                                          ),
                                          Text(
                                            " Food",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 12,
                                            color: Color.fromRGBO(
                                                106, 140, 175, 1),
                                          ),
                                          Text(
                                            " Good",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          SizedBox(height: 240, child: BarChart())
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Friends",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                getrankloader
                    ? const SizedBox.shrink()
                    : Row(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ranks[0]["username"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              "${ranks[0]["Points"]} points",
                                              style: const TextStyle(
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
                            child: SvgPicture.asset(
                              "assets/profileavatar/avatar-${ranks[0]["profilePic"]}.svg",
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 20,
                ),
                getrankloader
                    ? const SizedBox.shrink()
                    : Row(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ranks[1]["username"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              "${ranks[1]["Points"]} points",
                                              style: const TextStyle(
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
                            child: SvgPicture.asset(
                              "assets/profileavatar/avatar-${ranks[1]["profilePic"]}.svg",
                              width: 70,
                              height: 70,
                            ),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                children: [
                                  SizedBox(
                                    width: width - 335,
                                    child: Text(
                                      ranks[2]["username"],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${ranks[2]["Points"]} points",
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
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
                      child: SvgPicture.asset(
                        "assets/profileavatar/avatar-${ranks[2]["profilePic"]}.svg",
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
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
                    "2nd",
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
                      children: [
                        const Text(
                          "You",
                          style: TextStyle(
                            fontFamily: "overpass",
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "$points points",
                          style: const TextStyle(
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
