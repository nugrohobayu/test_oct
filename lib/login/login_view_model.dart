import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  var formKey = GlobalKey<FormState>();
  bool showPassword = false;

  bool emailValidation(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  void toggleVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
