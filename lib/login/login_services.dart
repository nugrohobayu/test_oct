import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_oct/login/response_login.dart';

class LoginServices {
  Future<ResponseLogin?> loginAuth(String email, String password) async {
    const String postsURL = "https://dummyjson.com/auth/login";

    final response = await post(Uri.parse(postsURL), body: {
      "username": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ResponseLogin responseLogin = ResponseLogin.fromJson(body);
      return responseLogin;
    }
    return null;
  }
}
