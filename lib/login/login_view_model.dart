import 'package:flutter/cupertino.dart';
import 'package:test_oct/login/login_services.dart';

class LoginViewModel extends ChangeNotifier {
  var formKey = GlobalKey<FormState>();
  bool showPassword = false;
  var email = TextEditingController();
  var password = TextEditingController();
  final service = LoginServices();

  bool emailValidation(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  void toggleVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future<bool?> loginPassword() async {
    final response = await service.loginAuth(email.text, password.text);
    if (response != null) {
      if (response.token.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
