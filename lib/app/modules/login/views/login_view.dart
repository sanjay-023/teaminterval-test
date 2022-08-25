import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamintervaltest/app/modules/common/colors.dart';
import 'package:teamintervaltest/app/modules/login/views/widget/text_box.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final loginController = Get.put(LoginController());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CommonColors.bgColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 58),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Sign you in",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w500)),
              ),
              Text(
                "Welcome back.",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 96,
              ),
              LoginBox(
                  hText: "Username",
                  boxIndex: 1,
                  textController: usernameController),
              SizedBox(
                height: 26,
              ),
              LoginBox(
                hText: "Password",
                boxIndex: 2,
                textController: passwordController,
              ),
            ],
          ),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () {
                loginController.login(
                    usernameController.text, passwordController.text);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check, color: Colors.white),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Log in",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(180, 50))),
        ));
  }
}
