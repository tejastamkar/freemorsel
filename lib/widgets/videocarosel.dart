import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/widgets/carouselcards.dart';
import 'package:freemorsel/widgets/carouselviews.dart';

class HotelVideoCarosel extends StatefulWidget {
  final List hotelvideodata;
  final bool loader;
  const HotelVideoCarosel(
      {Key? key, required this.hotelvideodata, this.loader = true})
      : super(key: key);

  @override
  State<HotelVideoCarosel> createState() => _HotelVideoCaroselState();
}

class _HotelVideoCaroselState extends State<HotelVideoCarosel> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (widget.loader) {
      return trandingskeleton(width: width);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Text(
              "Hotels associated with FreeMorsel",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              // height: 250,
              // height: width / 1.8,
              aspectRatio: 14 / 9,
              viewportFraction: 1,
              initialPage: 0,
              autoPlay: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: widget.hotelvideodata
                .map((data) => VideoCarosel(
                      width: width,
                      image: data["image"],
                      title: data["title"],
                      id: data["id"],
                    ))
                .toList(),
          ),
        ],
      );
    }
  }
}
