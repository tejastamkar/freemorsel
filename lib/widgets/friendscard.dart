import 'package:flutter/material.dart';

class FriendsCard extends StatelessWidget {
  final String srno, subtitle, points, image;
  const FriendsCard({
    Key? key,
    required this.srno,
    required this.subtitle,
    required this.points,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                srno,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                      width: 70,
                      height: 70,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "$points Points",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
