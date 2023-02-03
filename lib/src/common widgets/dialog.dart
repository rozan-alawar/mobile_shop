import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class MyDialog {
  static showDialog(BuildContext context, String message) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.RIGHSLIDE,
      title: 'error',
      desc: message,
      btnOkText: 'Close',
      btnOkOnPress: () {},
    ).show();
  }
}
