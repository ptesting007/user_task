import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showGetxBar(String title, String message) {
  Get.snackbar("", "",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black54,
      titleText: Center(
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18.0))),
      messageText: Center(
          child: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      )));
}
