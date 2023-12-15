import 'dart:developer';

import 'package:charge_mod_task/controller/register_user_details_provider.dart';
import 'package:charge_mod_task/core/local_user_data.dart';
import 'package:charge_mod_task/model/refresh_token_model.dart';
import 'package:charge_mod_task/model/user_details_model.dart';
import 'package:charge_mod_task/view/nav_bar_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class UserDetailsServices {
  registerUser(int phoneNumber, String firstName, String lastName, String email,
      context) async {
    try {
      var response = await Dio().post(
        'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/register',
        data: {
          "mobile": phoneNumber,
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
        },
      );

      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            child: const BottomNavigationBarWidget(),
            type: PageTransitionType.fade,
          ),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Something went wrong'),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getUserDetails(context) async {
    log('1');
    final provider = Provider.of<RegisterUserProvider>(context, listen: false);
    try {
      log('2');
      Map<String, String?> userData = await UserPreferences.getUserData();
      log(userData[UserPreferences.keyAccessToken].toString());
      Response response = await Dio().get(
          'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/get-customer',
          options: Options(
            headers: {
              "Authorization":
                  "Bearer ${userData[UserPreferences.keyAccessToken].toString()}",
            },
          ));
      log('4');
      final userDetail = UserDetailModel.fromJson(response.data);
      provider.userdetailsList.add(userDetail);
      for (int i = 0; i < provider.userdetailsList[0].data.user.length; i++) {
        if (provider.userdetailsList[0].data.user[0].userId ==
            userData[UserPreferences.keyUserId]) {
          provider.userName =
              provider.userdetailsList[0].data.user[i].firstName;
        }
      }
      log(response.toString());
      if (response.statusCode == 401) {
        log('5');
        refreshToken();
        getUserDetails(context);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  refreshToken() async {
    try {
      Map<String, String?> userData = await UserPreferences.getUserData();
      Response response = await Dio().post(
          'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/refresh',
          data: {
            "refreshToken": userData[UserPreferences.keyRefreshToken],
          },
          options: Options(headers: {
            "Authorization":
                "bearer ${userData[UserPreferences.keyAccessToken]}"
          }));

      final refreshDetails = RefreshTokenModel.fromJson(response.data);

      await UserPreferences.updateTokens(
        accessToken: refreshDetails.data.accessToken,
        refreshToken: refreshDetails.data.refreshToken,
      );

      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
