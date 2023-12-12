import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  
  /* This method is used for foucsNode as user input some data in one field and hit enter it will redirect him to next field when ever it is required for a form etc just call this method */
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
        current.unfocus();
        FocusScope.of(context).requestFocus(nextFocus);
      }


  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flashBarErrormessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP,
          message:
              message, //the second message is the paramater of the function while the fisrt message is the property of Flushbar
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }
}
