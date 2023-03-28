import 'package:flutter/material.dart';
import 'package:freemorsel/screens/tutorial.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';

class TutorialCard extends StatefulWidget {
  const TutorialCard({
    Key? key,
  }) : super(key: key);

  @override
  State<TutorialCard> createState() => _TutorialCardState();
}

class _TutorialCardState extends State<TutorialCard> {
  double height = 200;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Future.delayed(const Duration(seconds: 5),
        () => mounted ? setState(() => height = 80) : null);
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const TutorialPage())));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          AnimatedContainer(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    "assets/first.png",
                  )),
            ),
            duration: const Duration(seconds: 1),
          ),
          // Image.asset(
          //   "assets/first.png",
          //   width: width,
          //   fit: BoxFit.fitWidth,
          // ),
          Padding(
            padding: const EdgeInsets.all(15),
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
        ],
      ),
    );
  }
}
