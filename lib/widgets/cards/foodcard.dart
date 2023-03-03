import 'package:flutter/material.dart';
import 'package:freemorsel/widgets/cards/donationstatus.dart';

class FoodCard extends StatefulWidget {
  final String title, id, status, image, date;
  const FoodCard(
      {Key? key,
      required this.date,
      required this.image,
      required this.status,
      required this.id,
      required this.title})
      : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DonationStatusCard(
                        id: widget.id,
                      )));
        },
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(width: 0.2, color: Colors.grey)),
          child: Row(
            children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
              child: widget.image != ""
                  ? ClipOval(
                    child: Image.network(
                        widget.image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                  )
                  : const CircleAvatar(
                      radius: 40,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item Name: ${widget.title}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Status: ${widget.status}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "Date: ${widget.date}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
