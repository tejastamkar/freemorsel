import 'package:flutter/material.dart';
import 'package:freemorsel/screens/navbarscreens/narbar.dart';
import 'package:freemorsel/theme/deftheme.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset("assets/tutorial1.png"),
            const Text(
              "Register and Login",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const Text(
              "yourself to get started",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 1,
                width: 150,
                color: Colors.black,
              ),
            ),
            Image.asset("assets/tutorial2.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Click on the ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                Icon(Icons.add_circle_outline_rounded)
              ],
            ),
            const Text(
              " icon at the bottom-center to",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const Text(
              " start donating",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 1,
                width: 150,
                color: Colors.black,
              ),
            ),
            Image.asset("assets/tutorial3.png"),
            const Text(
              "Add name of the item,",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const Text(
              "images of item and your",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const Text(
              "address",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 1,
                width: 150,
                color: Colors.black,
              ),
            ),
            Image.asset("assets/tutorial4.png"),
            const Text(
              "You will get a",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const Text(
              "confirmation of your",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const Text(
              "donation.",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 1,
                width: 150,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const Navbar())));
              },
              child: Card(
                color: primary3Color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Start Donating",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        )),
      ),
    );
  }
}
