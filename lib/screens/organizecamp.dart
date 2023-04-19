import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/api/adddonation.dart';
import 'package:freemorsel/provider/datepicker.dart';
import 'package:freemorsel/provider/imagecopper.dart';
import 'package:freemorsel/provider/locationprovider.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
import 'package:image_picker/image_picker.dart';

enum VolunteerCharacter { yes, no }

enum DonationCharacter { donyes, donno }

class OrganizeCamp extends StatefulWidget {
  const OrganizeCamp({super.key});

  @override
  State<OrganizeCamp> createState() => _OrganizeCampState();
}

String camppic = "";

class _OrganizeCampState extends State<OrganizeCamp> {
  VolunteerCharacter? _character = VolunteerCharacter.no;
  DonationCharacter? _donation = DonationCharacter.donno;
  bool needvol = false;
  bool donationreq = false;
  int volunteerCount = 1;
  Timestamp camptimingStamp = Timestamp.now();
  final TextEditingController _campname = TextEditingController();
  final TextEditingController _campdetails = TextEditingController();
  final TextEditingController _campdate = TextEditingController();
  final TextEditingController _campaddress = TextEditingController();
  final TextEditingController _camptimings = TextEditingController();
  final TextEditingController _campphonenno = TextEditingController();
  final TextEditingController _volunteercount = TextEditingController();

  String firebascamppic = "";
  bool pickedimage = false;

  storecampdetail() async {
    var details = await FirebaseFirestore.instance.collection("Camps").add({
      "camp": _campname.text,
      "contactNo": _campphonenno.text,
      "dateOfDrive": _campdate.text,
      "venue": _campaddress.text,
      "time": _camptimings.text,
      "organizationName": _campdetails.text,
      "image": firebascamppic
    });
    if (details.id != "") {
      FirebaseFirestore.instance
          .collection("Camps")
          .doc(details.id)
          .update({"id": details.id});
    }
  }

  Future<dynamic> picimage({required source}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      String cropFile = await cropImage(pickedFile: image);

      // final File file = File(image!.path);
      setState(() {
        camppic = cropFile;
        pickedimage = true;
      });
      var link = await fireStoreFileUpload(
          camppic, "${FirebaseAuth.instance.currentUser!.uid}/Camps/photo.jpg");

      setState(() {
        firebascamppic = link;
      });
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }

  checkfunction({required VolunteerCharacter? check}) {
    if (check == VolunteerCharacter.yes) {
      setState(() {
        needvol = true;
      });
    } else {
      setState(() {
        needvol = false;
      });
    }
  }

  donationcheck({required DonationCharacter? check}) {
    if (check == DonationCharacter.donyes) {
      setState(() {
        donationreq = true;
      });
    } else {
      setState(() {
        donationreq = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Campaign Details",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: "Overpass"),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Campaign Name",
            style: TextStyle(
                color: primary2Color,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 1.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7)),
              ),
              controller: _campname,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Campaign Details",
            style: TextStyle(
                color: primary2Color,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 1.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7)),
              ),
              controller: _campdetails,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Contact",
            style: TextStyle(
                color: primary2Color,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 1.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7)),
              ),
              controller: _campname,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Organization Name",
            style: TextStyle(
                color: primary2Color,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 1.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7)),
              ),
              controller: _campname,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Venue",
            style: TextStyle(
                color: primary2Color,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 1.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              keyboardType: TextInputType.multiline,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: InkWell(
                  onTap: () async {
                    _campaddress.clear();
                    _campaddress.text = await getLoction(context: context);
                  },
                  child: Icon(
                    Icons.my_location,
                    color: primary3Color,
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7)),
              ),
              controller: _campaddress,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Date of Campaign",
            style: TextStyle(
                color: primary2Color,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 1.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              readOnly: false,
              // onTap: () => DatePicker().getDate(
              //     context: context,
              //     setDate: (date) => setState(
              //           () => _campdate.text = date,
              //         ),
              //     before: false),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(
                  Icons.calendar_today,
                  color: primary3Color,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7)),
              ),
              controller: _campdate,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Timing",
            style: TextStyle(
                color: primary2Color,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: width / 2.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(
                          0x3f000000,
                        ), //New
                        blurRadius: 1.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  readOnly: true,
                  onTap: () => DatePicker().getTime(
                    context: context,
                    setTime: (time) => setState(
                      () => camptimingStamp = time,
                    ),
                    showTime: (time) => setState(
                      () => _camptimings.text = time,
                    ),
                  ),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(
                        Icons.schedule,
                        color: primary3Color,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(7)),
                      hintText: "starts at"),
                  controller: _camptimings,
                ),
              ),
              const Spacer(),
              Container(
                width: width / 2.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(
                          0x3f000000,
                        ), //New
                        blurRadius: 1.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  readOnly: true,
                  onTap: () => DatePicker().getTime(
                    context: context,
                    setTime: (time) => setState(
                      () => camptimingStamp = time,
                    ),
                    showTime: (time) => setState(
                      () => _camptimings.text = time,
                    ),
                  ),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(
                        Icons.schedule,
                        color: primary3Color,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(7)),
                      hintText: "ends at"),
                  controller: _camptimings,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Images of venue",
            style: TextStyle(
                color: primary2Color,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "eg. locality of venue, detailed posters/banners regarding campaign ",
            style: TextStyle(
                color: Colors.black38,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () => picimage(
              source: ImageSource.gallery,
            ),
            child: pickedimage
                ? Image.file(File(camppic))
                : Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(
                              0x3f000000,
                            ), //New
                            blurRadius: 1.0,
                            offset: Offset(0, 0))
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 65),
                        child: Icon(
                          Icons.add_circle_outline,
                          color: primary3Color,
                          size: 42,
                        )),
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Need Volunteers ?",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: primary2Color),
          ),
          Row(
            children: [
              SizedBox(
                width: width / 3,
                child: ListTile(
                  title: const Text('Yes'),
                  leading: Radio<VolunteerCharacter>(
                    value: VolunteerCharacter.yes,
                    groupValue: _character,
                    onChanged: (VolunteerCharacter? value) {
                      setState(() {
                        _character = value;
                        checkfunction(check: _character);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: width / 3,
                child: ListTile(
                  title: const Text('No'),
                  leading: Radio<VolunteerCharacter>(
                    value: VolunteerCharacter.no,
                    groupValue: _character,
                    onChanged: (VolunteerCharacter? value) {
                      setState(() {
                        _character = value;
                        checkfunction(check: _character);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Volunteer Count ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () => setState(() {
                            if (volunteerCount > 1) {
                              volunteerCount--;
                            }
                          }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primary2Color,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          minimumSize: const Size(60, 30)),
                      child: const Icon(
                        Icons.remove,
                        size: 25,
                      )),
                  // Container(
                  //   alignment: Alignment.center,
                  //   color: Colors.grey.shade200,
                  //   padding: const EdgeInsets.symmetric(horizontal: 25),
                  //   child: Text(
                  //     "$volunteerCount",
                  //     style: const TextStyle(
                  //         fontSize: 18, fontWeight: FontWeight.w400),
                  //   ),
                  // ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 30,
                    color: Colors.grey.shade200,
                    height: 30,
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        hintText: "$volunteerCount",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      controller: _volunteercount,
                    ),
                  ),
                  // Container(
                  //   color: Colors.grey.shade200,

                  //   height: 30,
                  //   child: TextField(
                  //     style: const TextStyle(
                  //         fontSize: 18, fontWeight: FontWeight.w400),
                  //     decoration: InputDecoration(
                  //       hintText: "$volunteerCount",
                  //       contentPadding: const EdgeInsets.symmetric(
                  //           horizontal: 10, vertical: 5),
                  //       filled: true,
                  //       fillColor: Colors.grey.shade200,
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide.none,
                  //           borderRadius: BorderRadius.circular(7)),
                  //     ),
                  //   ),
                  //   // child: Text(
                  //   //   "$volunteerCount",
                  //   //   style: const TextStyle(
                  //   //       fontSize: 18, fontWeight: FontWeight.w400),
                  //   // ),
                  // ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      if (volunteerCount < 20) {
                        volunteerCount++;
                      }
                    }),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary3Color,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        minimumSize: const Size(60, 30)),
                    child: const Icon(
                      Icons.add,
                      size: 25,
                    ),
                  ),
                ],
              )
              // Row(
              //   children: [
              //     ElevatedButton(
              //         onPressed: () => setState(() {
              //               if (volunteerCount > 1) {
              //                 volunteerCount--;
              //               }
              //             }),
              //         style: ElevatedButton.styleFrom(
              //             backgroundColor: primary2Color,
              //             shape: const RoundedRectangleBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(5)),
              //             ),
              //             minimumSize: const Size(60, 30)),
              //         child: const Icon(
              //           Icons.remove,
              //           size: 25,
              //         )),
              //     Container(
              //       alignment: Alignment.center,
              //       color: Colors.grey.shade200,
              //       padding: const EdgeInsets.symmetric(horizontal: 25),
              //       height: 30,
              //       child: TextFormField(
              //         controller: _volunteercount,
              //         style: const TextStyle(
              //             fontSize: 18, fontWeight: FontWeight.w400),
              //       ),

              //       // child: Text(
              //       //   "$volunteerCount",
              //       //   style: const TextStyle(
              //       //       fontSize: 18, fontWeight: FontWeight.w400),
              //       // ),
              //     ),
              //     ElevatedButton(
              //       onPressed: () => setState(() {
              //         if (volunteerCount < 20) {
              //           volunteerCount++;
              //         }
              //       }),
              //       style: ElevatedButton.styleFrom(
              //           backgroundColor: primary3Color,
              //           shape: const RoundedRectangleBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(5)),
              //           ),
              //           minimumSize: const Size(60, 30)),
              //       child: const Icon(
              //         Icons.add,
              //         size: 25,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
          // Container(
          //   width: 20,
          //   color: Colors.grey.shade200,
          //   height: 30,
          //   child: TextField(
          //     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          //     decoration: InputDecoration(
          //       hintText: "$volunteerCount",
          //       contentPadding:
          //           const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //       filled: true,
          //       fillColor: Colors.grey.shade200,
          //       border: OutlineInputBorder(
          //           borderSide: BorderSide.none,
          //           borderRadius: BorderRadius.circular(7)),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Donation Required ?",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: primary2Color),
          ),
          Row(
            children: [
              SizedBox(
                width: width / 3,
                child: ListTile(
                  title: const Text('Yes'),
                  leading: Radio<DonationCharacter>(
                    value: DonationCharacter.donyes,
                    groupValue: _donation,
                    onChanged: (DonationCharacter? value) {
                      setState(() {
                        _donation = value;
                        donationcheck(check: _donation);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: width / 3,
                child: ListTile(
                  title: const Text('No'),
                  leading: Radio<DonationCharacter>(
                    value: DonationCharacter.donno,
                    groupValue: _donation,
                    onChanged: (DonationCharacter? value) {
                      setState(() {
                        _donation = value;
                        donationcheck(check: _donation);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Wallet Address",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 1.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7)),
              ),
            ),
          ),
        ]),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              backgroundColor: primary3Color,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            ),
            child: const Text(
              'Add Campaign',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            onPressed: () => storecampdetail()),
      ),
    );
  }
}
