import 'package:flutter/material.dart';

class CarouselCards extends StatelessWidget {
  const CarouselCards(
      {Key? key, required this.width, required this.image, required this.title})
      : super(key: key);
  final double width;
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  image,
                  height: 160,
                  width: width - 60,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                width: width - 60,
                height: 20,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ));
  }
}
