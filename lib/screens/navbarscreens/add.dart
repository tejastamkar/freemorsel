import 'dart:developer';
import 'dart:io';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freemorsel/api/adddonation.dart';
import 'package:freemorsel/provider/imagecopper.dart';
import 'package:freemorsel/screens/splashscreens/donatesplash.dart';
import 'package:image_picker/image_picker.dart';

List<String> imageList = [];

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int? typeOfDonation = 0;
  int? sizeOfGood = 0;
  int current = 0, servesCount = 0;
  final TextEditingController _name = TextEditingController(),
      _donationaddress = TextEditingController();

  Future<dynamic> takeImages() async {
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 40,
      );
      // final File file = File(image!.path);
      String cropFile = await cropImage(pickedFile: image);
      setState(() {
        imageList.add(cropFile);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            imageList.isEmpty
                ? Container(
                    height: height * 0.41,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: IconButton(
                          icon: SvgPicture.asset('icons/Add.svg'),
                          iconSize: 45,
                          onPressed: () async => await takeImages()),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                current = index;
                              });
                            },
                            height: height * 0.41,
                            // aspectRatio: ,
                            scrollPhysics: imageList.length > 1
                                ? const ScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            enableInfiniteScroll: false,
                            viewportFraction: 1,
                            initialPage: 0,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: imageList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.file(File(i));
                              },
                            );
                          }).toList(),
                        ),
                        imageList.length < 5
                            ? Center(
                                child: IconButton(
                                  icon: SvgPicture.asset('icons/Add.svg'),
                                  iconSize: 45,
                                  onPressed: () async => await takeImages(),
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
            imageList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: CarouselIndicator(
                        height: 10,
                        width: 20,
                        cornerRadius: 10,
                        color: const Color.fromARGB(153, 76, 76, 76),
                        activeColor: Theme.of(context).secondaryHeaderColor,
                        count: imageList.length,
                        index: current,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Item Type : ",
                    style: TextStyle(
                        color: Color(0x59000000),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    child: CupertinoSlidingSegmentedControl<int>(
                        backgroundColor: CupertinoColors.white,
                        thumbColor: Theme.of(context).secondaryHeaderColor,
                        groupValue: typeOfDonation,
                        padding: const EdgeInsets.all(4),
                        children: {
                          0: buildSegment(
                              text: 'Food', fontWeight: FontWeight.w400),
                          1: buildSegment(
                              text: 'Goods', fontWeight: FontWeight.w400),
                        },
                        onValueChanged: (groupValue) =>
                            setState(() => typeOfDonation = groupValue)),
                  ),
                ],
              ),
            ),
            Container(
                child: typeOfDonation == 1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Size of Goods:",
                            style: TextStyle(
                                color: Color(0x59000000),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: CupertinoSlidingSegmentedControl<int>(
                                backgroundColor: CupertinoColors.white,
                                thumbColor:
                                    Theme.of(context).secondaryHeaderColor,
                                groupValue: sizeOfGood,
                                padding: const EdgeInsets.all(4),
                                children: {
                                  0: buildSegment(
                                      text: 'Small',
                                      fontWeight: FontWeight.w400),
                                  1: buildSegment(
                                      text: 'Medium',
                                      fontWeight: FontWeight.w400),
                                  2: buildSegment(
                                      text: 'Large',
                                      fontWeight: FontWeight.w400),
                                },
                                onValueChanged: (int? newValue) {
                                  setState(() {
                                    sizeOfGood = newValue;
                                  });
                                }),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Text(
                                "No of Serves:",
                                style: TextStyle(
                                    color: Color(0x59000000),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Center(
                            child: Card(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => setState(() {
                                      if (servesCount < 7) servesCount++;
                                    }),
                                    iconSize: 32,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      "$servesCount",
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  ),
                                  IconButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                    ),
                                    icon: const Icon(Icons.remove),
                                    onPressed: () => setState(() {
                                      if (servesCount > 0) servesCount--;
                                    }),
                                    iconSize: 32,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                elevation: 4,
                child: TextField(
                  controller: _name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      floatingLabelStyle: const TextStyle(fontSize: 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Item Name'),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.125,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                elevation: 4,
                child: TextField(
                  controller: _donationaddress,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    floatingLabelStyle: const TextStyle(fontSize: 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Address',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.red.shade500,
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 2 - 100, vertical: 10),
                  ),
                  child: const Text(
                    'Clear All',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () async => setState(() => {
                        imageList.clear(),
                        _name.text = "",
                        _donationaddress.text = "",
                        typeOfDonation = 0,
                        sizeOfGood = 0,
                        servesCount = 0
                      })),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            ),
            child: const Text(
              'Donate It',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            onPressed: () async => {
                  if (imageList.isNotEmpty &&
                      _name.text != "" &&
                      _donationaddress.text != "")
                    await createDonation(
                            foodName: _name.text,
                            serves: typeOfDonation == 0 ? servesCount : 0,
                            address: _donationaddress.text,
                            sizeOfGood:
                                typeOfDonation == 0 ? 0 : sizeOfGood!.toInt(),
                            type: typeOfDonation == 0 ? 'Food' : "Good")
                        .then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DonateSplash()),
                      ),
                    )
                  else
                    Fluttertoast.showToast(
                        msg: "Please Provide Proper Info",
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 20,
                        backgroundColor: Theme.of(context).primaryColor,
                        textColor: Colors.white)
                }),
      ),
    );
  }
}

Widget buildSegment({required String text, required FontWeight? fontWeight}) =>
    Container(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'overpass', fontSize: 18, fontWeight: fontWeight),
        ));
