import 'package:flutter/material.dart';
import 'package:freemorsel/provider/phoneauth.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
// import 'package:freemorsel/screens/registration.dart';
import 'package:pinput/pinput.dart';

class OtpPopup extends StatefulWidget {
  final String? phoneNumber, verificationId;

  const OtpPopup({
    Key? key,
    this.phoneNumber,
    this.verificationId,
  }) : super(key: key);
  @override
  State<OtpPopup> createState() => _OtpPopupState();
}

class _OtpPopupState extends State<OtpPopup> {
  String smsCode = "";
  String status = "None";
  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Verify Phone",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: primary3Color,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 30),
              child: Text(
                  "You’ll receive a 6 digit code for verification on ${widget.phoneNumber}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade500)),
            ),
            Pinput(
              length: 6,
              onChanged: ((value) => smsCode = value),
              onCompleted: (pin) async {
                setState(() {
                  status = "Getting Otp";
                });
                String temp = await PhoneAuth().submitOpt(
                    verificationId: "${widget.verificationId}",
                    smsCode: smsCode,
                    context: context);
                if (mounted) {
                  setState(() {
                    status = temp;
                  });
                  Future.delayed(const Duration(seconds: 3),
                      () => mounted ? setState(() => status = "None") : null);
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            status == "None"
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      elevation: 0,
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      setState(() {
                        status = "Verifing Otp";
                      });
                      String temp = await PhoneAuth().submitOpt(
                          verificationId: "${widget.verificationId}",
                          smsCode: smsCode,
                          context: context);
                      if (mounted) {
                        setState(() {
                          status = temp;
                        });
                        Future.delayed(
                            const Duration(seconds: 3),
                            () => mounted
                                ? setState(() => status = "None")
                                : null);
                      }
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                    ),
                  )
                : Text(
                    status,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  )
          ],
        ),
      ),
    );
  }
}
