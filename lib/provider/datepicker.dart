import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class DatePicker {
  getTime({
    required BuildContext context,
    required Function setDate,
  }) async {
    TimeOfDay todaysDate = TimeOfDay.now();
    await showTimePicker(
      context: context, initialTime: todaysDate,
      // initialDate: todaysDate,
      // firstDate: DateTime(1950),
      //DateTime.now() - not to allow to choose before today.
      // lastDate: DateTime(2100)
    ).then((value) => setDate("${value!.hour} : ${value.minute}"));

    // return pickedDate;
  }

  getDate(
      {required BuildContext context,
      required Function setDate,
      required bool before}) async {
    DateTime todaysDate = DateTime.now();
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
