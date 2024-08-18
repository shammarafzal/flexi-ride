import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AppDateTimePicker {
  static getTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    TimeOfDay _getTime = TimeOfDay.now();
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay == null) {
      return;
    } else {
      selectedTime = timeOfDay;
      _getTime = selectedTime;
      return _getTime;
    }
  }

  static Future getDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    var _getDate = "";

    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, initialDatePickerMode: DatePickerMode.day, firstDate: DateTime(2015), lastDate: selectedDate);

    if (picked != null) {
      selectedDate = picked;
      _getDate = DateFormat.yMd().format(selectedDate);
    }

    return _getDate;
  }
}
