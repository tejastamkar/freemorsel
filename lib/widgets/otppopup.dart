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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Verify Phone",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: primary3Color,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 30),
              child: Text("You’ll receive a 6 digit code for verification",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade500)),
            ),
            Pinput(
                length: 6,
                onChanged: ((value) => smsCode = value),
                onCompleted: (pin) => PhoneAuth().submitOpt(
                    verificationId: "${widget.verificationId}",
                    smsCode: smsCode,
                    context: context)),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 0,
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => PhoneAuth().submitOpt(
                  verificationId: "${widget.verificationId}",
                  smsCode: smsCode,
                  context: context),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Proceed',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
