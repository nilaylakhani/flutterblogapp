import 'package:blogappdemo/services/remoteServices.dart';
import 'package:blogappdemo/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LogInScreenController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  onLoginClick(BuildContext context) {
    if (emailController.text.length > 0 && passwordController.text.length > 0)
      RemoteServices.sendLoginRequest(
          emailController.text, passwordController.text, context);
    else
      Toast.show("Invalid Details.", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  buildTextField(
      String label, TextEditingController textController, bool isObscureText) {
    return TextField(
      cursorColor: kDarkColor,
      style: TextStyle(color: kPrimaryTextColor),
      decoration: InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: kDarkColor)),
        focusedBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: kDarkColor)),
        focusColor: kDarkColor,
        hoverColor: kDarkColor,
        labelStyle: TextStyle(color: kDarkColor),
        labelText: label,
      ),
      keyboardType:
          isObscureText ? TextInputType.text : TextInputType.emailAddress,
      obscureText: isObscureText,
      controller: textController,
    );
  }
}
