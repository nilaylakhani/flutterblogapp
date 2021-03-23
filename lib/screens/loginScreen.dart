import 'package:blogappdemo/controllers/loginScreenController.dart';
import 'package:blogappdemo/utilities/constants.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  final LogInScreenController logInScreenController = LogInScreenController();
  final double gapValue = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: kLightColor,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'BLOG\nAPP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kDarkColor,
                      fontSize: 40),
                ),
                SizedBox(height: gapValue * 2),
                logInScreenController.buildTextField(
                    'Email-Id', logInScreenController.emailController, false),
                SizedBox(height: gapValue),
                logInScreenController.buildTextField(
                    'Password', logInScreenController.passwordController, true),
                SizedBox(height: gapValue),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kDarkColor,
                    ),
                    onPressed: () {
                      logInScreenController.onLoginClick(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('LogIn'),
                    )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
