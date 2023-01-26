// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:freemorsel/theme/deftheme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  checkfun() {
    if (offers && drivecamp) {
      setState(() {
        notification = true;
      });
    } else {
      setState(() {
        notification = false;
      });
    }
  }

  update() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .update({
      "notification": notification,
      "offernotification": offers,
      "drivecampnotification": drivecamp,
    });
  }

  bool notification = true;
  bool offers = true;
  bool drivecamp = true;
  @override
  Widget build(BuildContext context) {
    checkfun();
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Settings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activate all Notification",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  FlutterSwitch(
                    value: notification,
                    padding: 0,
                    height: 24,
                    width: 40,
                    activeColor: Color(
                      0x996a8caf,
                    ),
                    activeToggleColor: primary3Color,
                    inactiveColor: Colors.grey,
                    onToggle: ((value) {
                      if (value) {
                        setState(() {
                          offers = true;
                          drivecamp = true;
                          notification = value;
                        });
                      } else {
                        setState(() {
                          offers = false;
                          drivecamp = false;
                          notification = value;
                        });
                      }
                    }),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Offers and coupons",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                FlutterSwitch(
                  value: offers,
                  padding: 0,
                  height: 24,
                  width: 40,
                  activeColor: Color(
                    0x996a8caf,
                  ),
                  activeToggleColor: primary3Color,
                  inactiveColor: Colors.grey,
                  onToggle: ((value) {
                    setState(() {
                      offers = value;
                    });
                  }),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Drives and Campaingns",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                FlutterSwitch(
                  value: drivecamp,
                  padding: 0,
                  height: 24,
                  width: 40,
                  activeColor: Color(
                    0x996a8caf,
                  ),
                  activeToggleColor: primary3Color,
                  inactiveColor: Colors.grey,
                  onToggle: ((value) {
                    setState(() {
                      drivecamp = value;
                    });
                  }),
                )
              ],
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Delete my account",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "About",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.error_outline_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SizedBox(
          height: 48,
          child: ElevatedButton(
              onPressed: () => update(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: primary2Color,
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              )),
        ),
      ),
    );
  }
}
