import 'dart:developer';

import 'package:charge_mod_task/core/local_user_data.dart';
import 'package:dio/dio.dart';

class LogoutServices {
  logOut() async {
    try {
      Map<String, String?> userData = await UserPreferences.getUserData();
      var response = await Dio().post(
          'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/logout',
          data: {
            "refreshToken": "${userData[UserPreferences.keyRefreshToken]}",
          },
          options: Options(headers: {
            "Authorization":
                "Bearer ${userData[UserPreferences.keyAccessToken].toString()}"
          }));
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
