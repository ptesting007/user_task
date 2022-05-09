import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(fontFamily: "Montserrat")
      .copyWith(backgroundColor: Colors.white, primaryColor: Colors.black);

  static final dark = ThemeData.dark().copyWith(
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Montserrat',
          ),
      primaryTextTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Montserrat',
          ),
      backgroundColor: Colors.black,
      primaryColor: Colors.white);
}
