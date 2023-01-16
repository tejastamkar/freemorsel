import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/theme/deftheme.dart';

class ProfileSelector extends StatefulWidget {
  final Function goback;
  const ProfileSelector({Key? key, required this.goback}) : super(key: key);

  @override
  State<ProfileSelector> createState() => _ProfileSelectorState();
}

class _ProfileSelectorState extends State<ProfileSelector> {
  setProfile({required int index}) {
    setState(() => profilePicSelector = index);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "CHOOSE YOUR AVATAR",
                    style: TextStyle(
                        color: primary3Color,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 3),
                    itemBuilder: (context, index) =>
                        profilePicSelector == index + 1
                            ? Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: primary2Color, // border color
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  "assets/profileavatar/avatar-${index + 1}.svg",
                                  width: 80,
                                  height: 80,
                                ))
                            : InkWell(
                                onTap: (() => setProfile(index: index + 1)),
                                child: SvgPicture.asset(
                                  "assets/profileavatar/avatar-${index + 1}.svg",
                                  width: 80,
                                  height: 80,
                                ),
                              )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TextButton(
                      onPressed: () => widget.goback(),
                      child: Text(
                        "DONE",
                        style: TextStyle(
                            color: primary2Color,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      )),
                )
              ],
            )));
  }
}
