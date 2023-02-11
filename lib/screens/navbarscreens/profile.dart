import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/provider/phoneauth.dart';
import 'package:freemorsel/screens/editprofilescreen.dart';
import 'package:freemorsel/screens/settings.dart';
import 'package:freemorsel/screens/reward.dart';
import 'package:freemorsel/screens/history.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: width < 440 ? 20 : 60),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/Bg.svg',
                    width: width - 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/profileavatar/avatar-$profilePicSelector.svg",
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Text(
                              username,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            Text('Level-$level',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                            const Spacer(),
                            Text('Points-$points',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Reward())),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/reward.svg',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            const Text(
                              "Reward",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            const RotatedBox(
                              quarterTurns: 2,
                              child: Icon(Icons.arrow_back_ios),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                          ),
                          width: width,
                          height: 2,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const History())),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/history.svg',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            const Text(
                              "History",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            const RotatedBox(
                              quarterTurns: 2,
                              child: Icon(Icons.arrow_back_ios),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                          ),
                          width: width,
                          height: 2,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile(
                                      refresh: () {
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                    ))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/edit.svg',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            const Text(
                              "Edit Profile",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            const RotatedBox(
                              quarterTurns: 2,
                              child: Icon(Icons.arrow_back_ios),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(117, 183, 158, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                icon: SvgPicture.asset('assets/icons/setting.svg'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()));
                },
                label: const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                )),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () async => PhoneAuth().logOut(context: context),
                icon: SvgPicture.asset('assets/icons/logout.svg'),
                label: const Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
