import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' show DateFormat;

class DatePicker {
  final Timestamp now = Timestamp.fromDate(DateTime.now());
  DateTime todaysDate = DateTime.now();
  getTime({
    required BuildContext context,
    required Function setTime,
    required Function showTime,
  }) async {
    TimeOfDay currentTime = TimeOfDay.now();
    await showTimePicker(
      context: context, initialTime: currentTime,
      // initialDate: todaysDate,
      // firstDate: DateTime(1950),
      //DateTime.now() - not to allow to choose before today.
      // lastDate: DateTime(2100)
    ).then((value) {
      DateTime dateTime = DateTime(todaysDate.year, todaysDate.month,
          todaysDate.day, value!.hour, value.minute);

      // Convert the DateTime object to a Timestamp object
      Timestamp timestamp = Timestamp.fromDate(dateTime);

      setTime(timestamp);
      showTime("${value.hour} : ${value.minute}");
    });

    // return pickedDate;
  }

  getDate(
      {required BuildContext context,
      required Function setDate,
      required bool before}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: todaysDate,
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));
    if (before) {
      if (pickedDate != null && pickedDate.compareTo(todaysDate) < 0) {
        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
        //formatted date output using intl package =>  2022-11-10
        setDate(formattedDate);
      } else {
        Fluttertoast.showToast(msg: "Cant't Select this Date");
        setDate(null);
      }
    } else {
      if (pickedDate != null && pickedDate.compareTo(todaysDate) > 0) {
        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
        //formatted date output using intl package =>  2022-11-10
        setDate(formattedDate);
      } else {
        Fluttertoast.showToast(msg: "Cant't Select this Date");
        setDate(null);
      }
    }
  }
}
