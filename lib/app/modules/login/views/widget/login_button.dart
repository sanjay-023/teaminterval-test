import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamintervaltest/app/modules/login/controllers/login_controller.dart';

class LoginButton extends StatelessWidget {
  LoginButton({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
          onPressed: () {
            loginController.login(loginController.usernameController.text,
                loginController.passwordController.text);
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
    );
  }
}
