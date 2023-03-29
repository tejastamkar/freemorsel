import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/widgets/cards/donationstatus.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';

class FoodCard extends StatefulWidget {
  final String title, id, status, image, date;
  final Function getApi;
  const FoodCard(
      {Key? key,
      required this.date,
      required this.image,
      required this.status,
      required this.id,
      required this.title,
      required this.getApi})
      : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  Color cardColor = primary2Color;

  @override
  void initState() {
    switch (widget.status) {
      case "Active":
        cardColor = primary3Color;
        break;
      case "pending":
        cardColor = Colors.red.shade300;
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DonationStatusCard(
                        getAPi: widget.getApi,
                        status: widget.status,
                        id: widget.id,
                      )));
        },
        child: Card(
          elevation: 2,
          color: cardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(width: 0.2, color: Colors.grey)),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
              child: widget.image != ""
                  ? ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: widget.image,
                        key: UniqueKey(),
                        cacheManager: customCacheManager,
                        placeholder: (context, url) => Container(
                          width: 80,
                          height: 80,
                          color: primary2Color,
                        ),
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
                  SizedBox(
                    width: width - 240,
                    child: Text(
                      "Item Name: ${widget.title}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
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
