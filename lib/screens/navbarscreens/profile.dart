import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/provider/phoneauth.dart';
import 'package:freemorsel/screens/editprofilescreen.dart';
import 'package:freemorsel/screens/hotelregister.dart';
import 'package:freemorsel/screens/mydonations.dart';
import 'package:freemorsel/screens/navbarscreens/settings.dart';
import 'package:freemorsel/screens/organizecamp.dart';
import 'package:freemorsel/screens/reward.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () async => setState(() {}),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Bg.svg',
                      width: width,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/profileavatar/avatar-$profilePicSelector.svg",
                            width: 150,
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35, bottom: 25),
                            child: Text(
                              username,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Level-$level',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
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
                Card(
                  margin: const EdgeInsets.only(top: 30),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(width: 0.4, color: Colors.grey)),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Reward())),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              minimumSize: Size(width, 60),
                              elevation: 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/reward.svg",
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Reward",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyDonations())),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              minimumSize: Size(width, 60),
                              elevation: 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/history.svg",
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "My Donations",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                        refresh: () {
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                      ))),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              minimumSize: Size(width, 60),
                              elevation: 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/edit.svg",
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Edit Profile",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterHotel())),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              minimumSize: Size(width, 60),
                              elevation: 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/hotel.svg",
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Register as Hotel/Restaurants",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OrganizeCamp())),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              minimumSize: Size(width, 60),
                              elevation: 0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/camp.svg",
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Organize your Campaign",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
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
      ),
    );
  }
}
