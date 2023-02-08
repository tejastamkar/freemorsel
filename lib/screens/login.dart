import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              SizedBox(
                  width: width / 2,
                  height: width <= 440 ? width / 2 : width / 3,
                  child: SvgPicture.asset('icons/logo.svg')),
              const SizedBox(
                height: 100,
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
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 20, 40),
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            'Please Enter 10 digit mobile number',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          controller: _phoneNo,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter you phone no."),
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 40, 20, 20),
                              child: SizedBox(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 25),
                                    backgroundColor:
                                        const Color.fromRGBO(117, 183, 158, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Get OTP',
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      phoneNum = _phoneNo.text;
                                    });
                                    PhoneAuth().sendOtp(
                                        phoneNo: _phoneNo.text,
                                        context: context);
                                    // print(phoneNo.text);
                                  },
                                ),
                              ),
                            ),
                          ],
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
