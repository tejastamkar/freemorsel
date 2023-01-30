import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freemorsel/provider/phoneauth.dart';
import 'package:freemorsel/theme/deftheme.dart';
import 'package:pinput/pinput.dart';

class DeleteUserScreen extends StatefulWidget {
  const DeleteUserScreen({super.key});

  @override
  State<DeleteUserScreen> createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends State<DeleteUserScreen> {
  final TextEditingController _phoneNo = TextEditingController();
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColors,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: const Text(
          "Delete My Account",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontFamily: "Autour"),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
            'Your account will be deleted forever all the  data , bills , chats , records will be deleted.',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Enter your mobile number to cotinue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
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
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  controller: _phoneNo,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter you phone no."),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              loader
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        if (_phoneNo.text.length == 10) {
                          setState(() {
                            loader = true;
                          });
                          Future.delayed(const Duration(seconds: 30), () {
                            if (mounted) {
                              setState(() {
                                loader = false;
                              });
                            }
                          });
                          loader = await PhoneAuth()
                              .reAuth(phoneNo: _phoneNo.text, context: context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: primary2Color,
                          minimumSize: const Size(320, 50)),
                      child: const Text(
                        "Get Otp",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ))
            ],
          )),
    );
  }
}

class ReAuthPopup extends StatefulWidget {
  final String verificationId;
  const ReAuthPopup({super.key, required this.verificationId});

  @override
  State<ReAuthPopup> createState() => _ReAuthPopupState();
}

class _ReAuthPopupState extends State<ReAuthPopup> {
  final TextEditingController _smscode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Enter verification code we've sent you ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Pinput(
                defaultPinTheme: PinTheme(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 40,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10))),
                length: 6,
                controller: _smscode,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () => PhoneAuth().reAuthSubmitOtp(
                      verificationId: widget.verificationId,
                      smsCode: _smscode.text,
                      context: context),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: primary2Color,
                      minimumSize: const Size(320, 50)),
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  )),
            ],
          )),
    );
  }
}
