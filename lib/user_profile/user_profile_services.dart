import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_oct/user_profile/response_user_profile.dart';

class UserProfileServices {
  final String postsURL = "https://jsonplaceholder.typicode.com/users";

  Future<List<ResponseUserProfile>?> getUsers() async {
    Response res = await get(Uri.parse(postsURL));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<ResponseUserProfile> responseUserProfile =
          body.map((e) => ResponseUserProfile.fromJson(e)).toList();

      return responseUserProfile;
    }
    return null;
  }
}
