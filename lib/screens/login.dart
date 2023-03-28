import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemorsel/provider/phoneauth.dart';
// import 'package:freemorsel/Screens/registration.dart';
import 'package:freemorsel/data/userdata.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // String phoneNo = "";
  final TextEditingController _phoneNo = TextEditingController();
  bool loader = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(
                width: width - 100,
                'assets/icons/logo.svg',
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width <= 450 ? 20 : 60, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(106, 140, 175, 1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 20, 40),
                        child: SizedBox(
                          width: width,
                          child: const Text(
                            'Please Enter 10 digit mobile number',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: IntlPhoneField(
                          dropdownTextStyle: const TextStyle(fontSize: 14),
                          style: const TextStyle(fontSize: 18),
                          initialCountryCode: "IN",
                          showDropdownIcon: false,
                          showCountryFlag: false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          controller: _phoneNo,
                          onCountryChanged: (country) {},
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                          child: loader
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80, vertical: 20),
                                    backgroundColor:
                                        const Color.fromRGBO(117, 183, 158, 1),
                                    textStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Get OTP',
                                  ),
                                  onPressed: () async {
                                    if (_phoneNo.text.length == 10) {
                                      setState(() {
                                        loader = true;
                                        phoneNum = _phoneNo.text.toString();
                                      });
                                      Future.delayed(
                                          const Duration(seconds: 30), () {
                                        if (mounted) {
                                          setState(() {
                                            loader = false;
                                          });
                                        }
                                      });
                                      loader = await PhoneAuth().sendOtp(
                                        phoneNo: _phoneNo.text,
                                        context: context,
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Enter your number Properly')));
                                    }

                                    // print(phoneNo.text);
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
