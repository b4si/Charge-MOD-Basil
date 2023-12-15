import 'package:charge_mod_task/core/local_user_data.dart';
import 'package:charge_mod_task/services/logout_servies.dart';
import 'package:charge_mod_task/view/login_screen.dart';
import 'package:flutter/material.dart';

class LogOutProvider with ChangeNotifier {
  logOut(context) {
    LogoutServices().logOut();
    UserPreferences.clearUserData()
        .whenComplete(() => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false));
    notifyListeners();
  }
}
