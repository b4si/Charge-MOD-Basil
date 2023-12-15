import 'dart:developer';
import 'package:charge_mod_task/controller/login_otp_provider.dart';
import 'package:charge_mod_task/core/local_user_data.dart';
import 'package:charge_mod_task/model/otp_response_model.dart';
import 'package:charge_mod_task/view/nav_bar_widget.dart';
import 'package:charge_mod_task/view/otp_screen.dart';
import 'package:charge_mod_task/view/update_profile_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginOtpServices {
  loginToHome(context, phoneNumber) async {
    final provider = Provider.of<LoginOtpProvider>(context, listen: false);
    try {
      var response = await Dio().post(
        'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/signIn',
        data: {"mobile": provider.phoneNumberController.text},
      );
      log(response.toString());
      log("--------------->>>${response.statusCode}");
      if (response.statusCode == 200) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OtpScreen(phoneNumber: phoneNumber),
          ),
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

  verifyOtp(context, String phoneNumber) async {
    final provider = Provider.of<LoginOtpProvider>(context, listen: false);

    log(provider.otpValue.toString());

    try {
      var response = await Dio().post(
        'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/verify',
        data: {
          "mobile": phoneNumber,
          "otp": provider.otpValue,
        },
      );
      final responseData = OtpResponseModel.fromJson(response.data);

      await UserPreferences.saveUserData(
          userId: responseData.data.userId,
          accessToken: responseData.data.accessToken,
          refreshToken: responseData.data.refreshToken);
      Map<String, String?> userData = await UserPreferences.getUserData();
      log(userData.toString());
      log(response.statusCode.toString());
      log(responseData.data.isNewUser.toString());
      if (response.statusCode == 201 && responseData.data.isNewUser == true) {
        await UserPreferences.setLoggedIn(true);
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: UpdateProfileScreen(
                phoneNumber: provider.phoneNumberController.text,
              ),
              type: PageTransitionType.fade,
            ),
            (route) => false);
      } else if (response.statusCode == 200 &&
          responseData.data.isNewUser == false) {
        await UserPreferences.setLoggedIn(true);
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const BottomNavigationBarWidget(),
              type: PageTransitionType.fade,
            ),
            (route) => false);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  resendOtp(phoneNumber) async {
    try {
      var response = Dio().post(
        'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/resend',
        data: {
          "mobile": int.parse(phoneNumber),
          "type": "text",
        },
      );
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
