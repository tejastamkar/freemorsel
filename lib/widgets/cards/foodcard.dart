import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String title, status, image, date;
  const FoodCard(
      {Key? key,
      required this.date,
      required this.image,
      required this.status,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: image != ""
                    ? Image.network(
                        image,
                        width: 90,
                        height: 90,
                        fit: BoxFit.fill,
                      )
                    : const CircleAvatar(
                        radius: 90,
                      )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Status: $status",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Date: $date",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
