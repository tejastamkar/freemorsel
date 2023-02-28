import 'package:flutter/material.dart';

Widget processingPopup({
  required BuildContext context,
  required String msg,
}) =>
    AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            Text(msg),
          ],
        ),
      ),
    );
