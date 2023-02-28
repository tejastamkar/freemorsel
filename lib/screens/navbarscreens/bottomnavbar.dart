import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/api/getuserdetails_api.dart';
import 'package:freemorsel/screens/navbarscreens/add.dart';
import 'package:freemorsel/screens/navbarscreens/homescreen.dart';
import 'package:freemorsel/screens/navbarscreens/profile.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  String appBarTitle = 'Free Morsel';
  FirebaseAuth auth = FirebaseAuth.instance;
  final screens = [
    const Home(),
    const AddPage(),
    const ProfilePage(),
  ];

  // ignore: non_constant_identifier_names
  ChangeAppBarTitle({required int inDexNumber}) {
    switch (inDexNumber) {
      case 0:
        appBarTitle = 'Free Morsel';
        break;
      case 1:
        appBarTitle = 'Donate';
        const TextStyle(fontWeight: FontWeight.w700);
        break;
      case 2:
        appBarTitle = 'Profile';
        break;
      default:
        appBarTitle = 'FreeMorsel';
    }
  }

  @override
  void initState() {
    getUserDeatilsApi(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 26.0),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(index: _selectedIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_outlined,
              size: 30,
            ),
            label: 'AddCart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
        selectedFontSize: 20,
        unselectedFontSize: 20,
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
          }),
          ChangeAppBarTitle(inDexNumber: _selectedIndex)
        },
      ),
    );
  }
}
