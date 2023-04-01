import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "About Us",
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: const [
              Text(
                  "People's living standards are continually rising, sophisticated technology makes life easier, and media information can spread quickly over the world. Wasting resources (food, goods, etc.) is a widespread issue in our community. Handling those extraneous items is critical since it can enhance our environmental and economic sustainability.In the form of this initiative called FreeMorsel we have chosen a pathway to implement our innovative ideas. The essential objective that emerged from our effort is to supply essentials to those in need. 'FreeMorsel' is a cross-platform application that facilitates the donation of helpful products (food, clothing, etc.) to the nearest Charity.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              Text(
                " Many people and organisations seek to donate items to deserving organisations. Also, different organizations seek to request various things. Yet, there is no supply accessible that can meet their demands. As a result, a web-based tool that allows individuals to give products based on their ability will be helpful in bridging the gap between Donors and those in need.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                "This application has a broad potential use in emerging countries with both privileged and poor people. Some people have many advantages, but others are unable to buy even the most basic of necessities. If this donation service is put online, individuals may donate their spare goods without feeling awkward, and those in need can get these products. ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                " Furthermore, in the event of a natural disaster, such as an epidemic outbreak, individuals will be able to contribute food and clothing to those in need. Hundreds of thousands of pounds of food are wasted at festivities such as weddings or parties because no one wants to spend their time looking for people to donate their food, therefore our application will make their job easier since they don't have to do anything except register for our application and someone will pick up the products they want to give from their doorway. This tool can be quite useful in resolving food and good crisis issues.We are also utilising Blockchain technology, which is a distributed ledger system that is immutable and securely connected together by cryptographic hashes.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
