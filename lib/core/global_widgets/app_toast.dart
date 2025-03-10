import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastEnum {
  error,
  warning,
  success,
}

class AppToast {
  AppToast._();
  static Future<void> toast({
    required final String msg,
    required final ToastEnum type,
    final Toast toastLength = Toast.LENGTH_SHORT,
  }) async {
    final Color color = switch (type) {
      ToastEnum.error => Colors.red,
      ToastEnum.warning => Colors.amber,
      _ => Colors.green,
    };
    await Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
