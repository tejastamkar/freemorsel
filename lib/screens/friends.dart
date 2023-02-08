import 'package:flutter/material.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/theme/deftheme.dart';

class FriendsRank extends StatelessWidget {
  const FriendsRank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Friends",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SingleChildScrollView(
          //   child: ListView.builder(
          //       shrinkWrap: true,
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemCount: 5,
          //       itemBuilder: (context, index) => FriendsCard(
          //           srno: foodDataList[index]['srno'],
          //           subtitle: foodDataList[index]['subtitle'],
          //           points: foodDataList[index]['points'],
          //           image: foodDataList[index]['image'])),
          // ),
          Container(
            width: width - 10,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              color: primary2Color,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "7.",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          "assets/profile.jpg",
                          fit: BoxFit.fill,
                          width: 70,
                          height: 70,
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      // Text(
                      //   foodDataList[0]['points'] + " Points",
                      //   style: const TextStyle(
                      //       fontSize: 15, fontWeight: FontWeight.w400),
                      // )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


// FoodCards(
//                     title: foodDataList[index]['title'],
//                     subtitle: foodDataList[index]['subtitle'],
//                     image: foodDataList[index]['image'],
//                     distance: foodDataList[index]['distance'])