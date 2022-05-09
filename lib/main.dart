import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:user_task/config/theme.dart';
import 'package:user_task/ui/home_screen/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: UsersView(),
    );
  }
}
