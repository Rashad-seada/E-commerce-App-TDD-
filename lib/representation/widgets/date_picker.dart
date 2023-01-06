import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

datePicker(context,TextEditingController controller){
  return  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1970),
    lastDate: DateTime.now(),

  ).then((value) {
     controller.text = DateFormat("yyyy-mm-dd").format(value!);
    print(controller.text);
  });
}