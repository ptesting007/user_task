import 'package:get/get.dart';

import 'package:user_task/AppCommon/ApiService.dart';
import 'package:user_task/AppCommon/AppConstants.dart';
import 'package:user_task/AppCommon/CommonFunctions.dart';
import 'package:user_task/models/Users.dart';

class HomeController extends GetxController {

  var isLoading = false.obs;
  var listOfUsers = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserList();
  }

  getUserList() {
    isLoading(true);
    ApiService.get(API_USERLIST, params: null, success: (data) {
      listOfUsers(userListFromJson(data));
      isLoading(false);
      update();
    }, failed: (data) {
      isLoading(false);
      showGetxBar(APP_NAME, data["Message"]);
    }, error: (msg) {
      isLoading(false);
      showGetxBar(APP_NAME, msg.toString());
    });
  }
}
