import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamintervaltest/app/modules/login/controllers/login_controller.dart';

class LoginButton extends StatelessWidget {
  LoginButton({Key? key, required this.userName, required this.password})
      : super(key: key);
  final String userName;
  final String password;

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
          onPressed: () {
            loginController.login(userName, password);
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
