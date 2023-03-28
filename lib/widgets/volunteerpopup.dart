import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';

class Volunteer extends StatefulWidget {
  const Volunteer({super.key});

  @override
  State<Volunteer> createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  int? available = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Volunteer Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5, top: 30),
              child: Text(
                "Name",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
            SizedBox(
              width: width,
              child: TextField(
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5, top: 30),
              child: Text(
                "Email ID",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
            SizedBox(
              width: width,
              child: TextField(
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Will be available for full drive? ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: CupertinoSlidingSegmentedControl<int>(
                  backgroundColor: CupertinoColors.white,
                  thumbColor: Theme.of(context).secondaryHeaderColor,
                  groupValue: available,
                  padding: const EdgeInsets.all(4),
                  children: {
                    0: buildSegment(
                        text: 'Yes', fontWeight: FontWeight.w400, width: width),
                    1: buildSegment(
                        text: 'No', fontWeight: FontWeight.w400, width: width),
                  },
                  onValueChanged: (groupValue) =>
                      setState(() => available = groupValue)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: primary2Color,
                    minimumSize: Size(width, 50)),
                onPressed: () {},
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ))
          ]),
    );
  }
}

Widget buildSegment(
        {required String text,
        required FontWeight? fontWeight,
        required double width}) =>
    Container(
        width: width,
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'overpass', fontSize: 18, fontWeight: fontWeight),
          textAlign: TextAlign.center,
        ));
