import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:user_task/models/Users.dart';
import 'package:user_task/ui/home_screen/home_controller.dart';

class UsersView extends StatelessWidget {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body:
      homeController.isLoading.value
          ? Center(child: SpinKitCircle(color: context.theme.primaryColor),) :
      Stack(
        children: [
          Container(
            child: Image.asset(
              Get.isDarkMode ? "assets/bg2.jpg" : "assets/bg3.jpg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fitHeight,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 250, sigmaY: 250),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Users",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: context.theme.primaryColor,
                                fontSize: 40.0),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          print(Get.isDarkMode);
                          Get.changeThemeMode(Get.isDarkMode
                              ? ThemeMode.light
                              : ThemeMode.dark);
                          // setState(() {});
                        },
                        child: CircleAvatar(
                          backgroundColor:
                          context.theme.primaryColor.withOpacity(0.2),
                          child: Icon(
                            Get.isDarkMode
                                ? Icons.nightlight_round
                                : Icons.sunny,
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: homeController.listOfUsers.length,
                        itemBuilder: (context, index) {
                          UserList user = homeController.listOfUsers[index];
                          return ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 5.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 25.0, horizontal: 15.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: context.theme.primaryColor
                                      .withOpacity(0.1),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor:
                                      context.theme.primaryColor,
                                      child: Text(
                                        user.name[0],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: context.theme.backgroundColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            user.name,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: context.theme.primaryColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        FittedBox(
                                          child: Text(
                                            '${user.address?.city}, ${user.address?.zipcode}',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: context.theme.primaryColor,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
