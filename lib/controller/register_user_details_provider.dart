import 'package:charge_mod_task/model/user_details_model.dart';
import 'package:charge_mod_task/services/user_details_services.dart';
import 'package:flutter/material.dart';

class RegisterUserProvider with ChangeNotifier {
  List<UserDetailModel> userdetailsList = [];
  String userName = "";

  registerUser(int phoneNumber, String firstName, String lastName, String email,
      context) {
    UserDetailsServices()
        .registerUser(phoneNumber, firstName, lastName, email, context);
    notifyListeners();
  }

  getUserDetails(context) async {
    await UserDetailsServices().getUserDetails(context);
    notifyListeners();
  }
}
