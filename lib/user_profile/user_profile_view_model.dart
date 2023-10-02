import 'package:flutter/material.dart';
import 'package:test_oct/user_profile/response_user_profile.dart';
import 'package:test_oct/user_profile/user_profile_services.dart';

class UserProfileViewModel extends ChangeNotifier {
  UserProfileViewModel() {
    getUser();
  }

  List<ResponseUserProfile> listUser = [];
  String urlPhoto = "";
  String name = "";
  String email = "";
  String address = "";
  String noTelp = "";
  String company = "";

  getUser() async {
    final service = UserProfileServices();
    final response = await service.getUsers();
    if (response != null) {
      final street = response.first.address.street;
      final suite = response.first.address.suite;
      final city = response.first.address.city;
      listUser = response;
      name = response.first.name;
      email = response.first.email;
      company = response.first.company.name;
      noTelp = response.first.phone;
      address = "$street, $suite, $city";
    }
    notifyListeners();
  }
}
