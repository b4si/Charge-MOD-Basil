import 'package:charge_mod_task/services/login_otp_services.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';

class LoginOtpProvider with ChangeNotifier {
  final TextEditingController phoneNumberController = TextEditingController();
  final OtpFieldController otpNumberController = OtpFieldController();
  int otpValue = 0;
  loginWithPhoneNumber(context) {
    LoginOtpServices().loginToHome(context, phoneNumberController.text);
    notifyListeners();
  }

  verifyOtp(context) {
    LoginOtpServices().verifyOtp(context, phoneNumberController.text);
    notifyListeners();
  }

  resendOtp() {
    LoginOtpServices().resendOtp(phoneNumberController.text);
    notifyListeners();
  }
}
