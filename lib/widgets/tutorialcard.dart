import 'package:flutter/material.dart';
import 'package:freemorsel/screens/tutorial.dart';
import 'package:freemorsel/theme/deftheme.dart';

class TutorialCard extends StatelessWidget {
  const TutorialCard({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Image.asset(
          "assets/first.png",
          width: width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const TutorialPage())));
            },
            child: Card(
              color: primaryColor,
              elevation: 1,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  "How to Donate ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
