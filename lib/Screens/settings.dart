// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:freemorsel/theme/deftheme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    bool notification = false;
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Activate all Notification",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Switch(
                      // This bool value toggles the switch.
                      value: notification,
                      activeColor: primary3Color,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          notification = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Offers and coupons",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Switch(
                    // This bool value toggles the switch.
                    value: notification,
                    activeColor: primary3Color,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        notification = value;
                      });
                    },
                  )
                ],
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Drives and Campaingns",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Switch(
                    // This bool value toggles the switch.
                    value: notification,
                    activeColor: primary3Color,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        notification = value;
                      });
                    },
                  )
                ],
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Delete my account",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "About",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Icon(Icons.error_outline_rounded, size: 30,)
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
