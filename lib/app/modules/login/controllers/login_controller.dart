import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamintervaltest/app/modules/home/views/home_view.dart';
import 'package:teamintervaltest/main.dart';

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

  bool isObscure = true;

  void login(String userName, String password) async {
    if (userName.isNotEmpty || password.isNotEmpty) {
      if (userName == password) {
        final sharedprfns = await SharedPreferences.getInstance();
        await sharedprfns.setBool(SAVE_KEY, true);
        Get.offAll(HomeView());
      } else {
        Get.snackbar("Login Failed", "Incorrect username or password");
      }
    } else {
      Get.snackbar("Login Failed", "Enter Valid username and password");
    }
  }

  changeVisibility() {
    isObscure = !isObscure;
    update();
  }
}
