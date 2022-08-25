import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teamintervaltest/app/modules/common/colors.dart';
import 'package:teamintervaltest/app/modules/login/views/widget/login_button.dart';
import 'package:teamintervaltest/app/modules/login/views/widget/text_box.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CommonColors.bgColor,
        bottomNavigationBar: LoginButton(),
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
                  textController: loginController.usernameController),
              SizedBox(
                height: 26,
              ),
              LoginBox(
                hText: "Password",
                boxIndex: 2,
                textController: loginController.passwordController,
              ),
            ],
          ),
        )));
  }
}
