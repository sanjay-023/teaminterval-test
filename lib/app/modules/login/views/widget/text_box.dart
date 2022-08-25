import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamintervaltest/app/modules/login/controllers/login_controller.dart';

class LoginBox extends StatelessWidget {
  final String hText;
  final int boxIndex;
  final TextEditingController textController;
  LoginBox(
      {Key? key,
      required this.hText,
      required this.boxIndex,
      required this.textController})
      : super(key: key);

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return TextField(
        controller: textController,
        style: TextStyle(color: Colors.white),
        obscureText: boxIndex == 2 && loginController.isObscure ? true : false,
        decoration: InputDecoration(
            suffixIcon: boxIndex == 2
                ? IconButton(
                    onPressed: () {
                      loginController.changeVisibility();
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                    ))
                : null,

            // filled: true,
            // fillColor: Color.fromARGB(255, 3, 3, 12),
            hintText: hText,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 112, 111, 111))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 112, 111, 111))),
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 112, 111, 111)))),
      );
    });
  }
}
