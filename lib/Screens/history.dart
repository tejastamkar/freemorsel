// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: const Text(
              "Your History",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // GridView.builder(
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: 4,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //     ),
            //     itemBuilder: (context, index) => FoodCards(
            //         title: foodDataList[index]['title'],
            //         subtitle: foodDataList[index]['subtitle'],
            //         image: foodDataList[index]['image'],
            //         distance: foodDataList[index]['distance'])),
          ],
        ));
  }
}
