import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teamintervaltest/app/modules/home/views/home_view.dart';

class LoginController extends GetxController {
  // //TODO: Implement LoginController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login(String userName, String password) {
    if (usernameController.text.isNotEmpty ||
        passwordController.text.isNotEmpty) {
      if (usernameController.text == passwordController.text) {
        Get.offAll(HomeView());
      } else {
        Get.snackbar("Login Failed", "Incorrect username or password");
      }
    } else {
      Get.snackbar("Login Failed", "Enter Valid username and password");
    }
  }
}
