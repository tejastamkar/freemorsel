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
import 'package:freemorsel/provider/locationprovider.dart';
import 'package:freemorsel/screens/splashscreens/donatesplash.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
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

  Future submitPost() async {
    if (imageList.isNotEmpty &&
        _name.text != "" &&
        _donationaddress.text != "") {
      // processingPopup(context: context, msg: "Donating....");
      await createDonation(
              foodName: _name.text,
              serves: typeOfDonation == 0 ? servesCount : 0,
              address: _donationaddress.text,
              sizeOfGood: typeOfDonation == 0 ? 0 : sizeOfGood!.toInt(),
              type: typeOfDonation == 0 ? 'Food' : "Good")
          .then((value) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DonateSplash()),
        );
      });
    } else {
      Fluttertoast.showToast(
          msg: "Please Provide Proper Info",
          toastLength: Toast.LENGTH_LONG,
          fontSize: 20,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            imageList.isEmpty
                ? Container(
                    height: 390,
                    width: width,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: IconButton(
                          icon: SvgPicture.asset('assets/icons/Add.svg'),
                          iconSize: 45,
                          onPressed: () async => await takeImages()),
                    ),
                  )
                : Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              current = index;
                            });
                          },
                          aspectRatio: 1 / 1,
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
                                icon: SvgPicture.asset('assets/icons/Add.svg'),
                                iconSize: 45,
                                onPressed: () async => await takeImages(),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
            imageList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: CarouselIndicator(
                        height: 10,
                        width: 20,
                        cornerRadius: 10,
                        color: Colors.grey.shade400,
                        activeColor: primary2Color,
                        count: imageList.length,
                        index: current,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            imageList.isNotEmpty
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Item Type : ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(top: 3, bottom: 13),
                          alignment: Alignment.center,
                          child: CupertinoSlidingSegmentedControl<int>(
                              backgroundColor: CupertinoColors.white,
                              thumbColor: primary2Color,
                              groupValue: typeOfDonation,
                              padding: const EdgeInsets.all(4),
                              children: {
                                0: Container(
                                  alignment: Alignment.center,
                                  width: width,
                                  height: 40,
                                  child: Text(
                                    "Food",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: typeOfDonation == 0
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                                1: Text(
                                  "Goods",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: typeOfDonation == 1
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              },
                              onValueChanged: (groupValue) =>
                                  setState(() => typeOfDonation = groupValue)),
                        ),
                        Text(
                          typeOfDonation == 1
                              ? "Size of Goods:"
                              : "No of Serves:",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 5, bottom: 15),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: typeOfDonation == 1
                                ? CupertinoSlidingSegmentedControl<int>(
                                    backgroundColor: CupertinoColors.white,
                                    thumbColor: primary2Color,
                                    groupValue: sizeOfGood,
                                    padding: const EdgeInsets.all(4),
                                    children: {
                                      0: Container(
                                        alignment: Alignment.center,
                                        width: width,
                                        height: 40,
                                        child: Text(
                                          "Small",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: sizeOfGood == 0
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                      1: Text(
                                        "Medium",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: sizeOfGood == 1
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      2: Text(
                                        "Large",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: sizeOfGood == 2
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    },
                                    onValueChanged: (int? newValue) {
                                      setState(() {
                                        sizeOfGood = newValue;
                                      });
                                    })
                                : Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () => setState(() {
                                                  if (servesCount > 0) {
                                                    servesCount--;
                                                  }
                                                }),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.red[300],
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12)),
                                                ),
                                                minimumSize:
                                                    const Size(120, 40)),
                                            child: const Icon(
                                              Icons.remove,
                                              size: 30,
                                            )),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.grey.shade200,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 35),
                                          height: 42,
                                          child: Text(
                                            "$servesCount",
                                            style:
                                                const TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        ElevatedButton(
                                            onPressed: () => setState(() {
                                                  if (servesCount < 7) {
                                                    servesCount++;
                                                  }
                                                }),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: primary2Color,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12)),
                                                ),
                                                minimumSize:
                                                    const Size(120, 40)),
                                            child: const Icon(
                                              Icons.add,
                                              size: 30,
                                            )),
                                      ],
                                    ),
                                  )),
                        Card(
                          margin: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                  width: 0.4, color: Colors.grey)),
                          elevation: 2,
                          child: TextField(
                            controller: _name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Item Name',
                                labelStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.only(top: 20, bottom: 24),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                  width: 0.4, color: Colors.grey)),
                          elevation: 2,
                          child: TextField(
                            // maxLines: 2,
                            keyboardType: TextInputType.multiline,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                            controller: _donationaddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                              suffixIcon: InkWell(
                                onTap: () async {
                                  _donationaddress.clear();
                                  _donationaddress.text =
                                      await getLoction(context: context);
                                },
                                child: Icon(
                                  CupertinoIcons.location_fill,
                                  color: _donationaddress.text == ""
                                      ? Colors.grey
                                      : primaryColor,
                                ),
                              ),
                              labelText: 'Address',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Colors.red.shade400,
                                minimumSize: Size(width, 40)),
                            child: const Text(
                              'Clear All',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w400),
                            ),
                            onPressed: () async => setState(() => {
                                  imageList.clear(),
                                  _name.text = "",
                                  _donationaddress.text = "",
                                  typeOfDonation = 0,
                                  sizeOfGood = 0,
                                  servesCount = 0
                                })),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: primary2Color,
              minimumSize: Size(width, 50),
            ),
            child: Text(
              imageList.isEmpty ? "Add Donation" : 'Donate It',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            onPressed: () async =>
                imageList.isEmpty ? await takeImages() : await submitPost()),
      ),
    );
  }
}
