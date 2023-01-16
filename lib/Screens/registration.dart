import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freemorsel/api/checkuser.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/screens/navbarscreens/narbar.dart';
import 'package:freemorsel/theme/deftheme.dart';
import 'package:freemorsel/widgets/profileselector.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstName = TextEditingController(),
      _lastname = TextEditingController(),
      _phoneNo = TextEditingController(),
      _email = TextEditingController();

  void check() async {
    if (_firstName.text != "" && _lastname.text != "" && _phoneNo.text != "") {
      setState(() {
        username = "${_firstName.text} ${_lastname.text}";
        phoneNum = _phoneNo.text;
        email = _email.text;
      });
      await newUserLogin();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Navbar()),
          (route) => false);
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
  void initState() {
    _phoneNo.text = phoneNum;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Welcome\nNew User',
                      style: TextStyle(
                          color: Color.fromRGBO(106, 140, 175, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 45),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                  child: Card(
                    color: primary3Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 2,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) => ProfileSelector(
                                    goback: () {
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                  )),
                          child: SvgPicture.asset(
                            "assets/profileavatar/avatar-$profilePicSelector.svg",
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          child: TextField(
                            decoration: const InputDecoration(
                                hintText: 'First Name',
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            controller: _firstName,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          child: TextField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Last Name',
                            ),
                            controller: _lastname,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Phone No',
                            ),
                            readOnly: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            controller: _phoneNo,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          child: TextField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Email Id (optional)',
                            ),
                            controller: _email,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(100, 20, 100, 20),
                                backgroundColor:
                                    const Color.fromRGBO(117, 183, 158, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                'Register',
                              ),
                              onPressed: () => check()),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
