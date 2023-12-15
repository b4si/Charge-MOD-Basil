import 'package:charge_mod_task/controller/login_otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Verfication',
        style: TextStyle(letterSpacing: 1),
      )),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Text(
              'We’ve send you the verification code on +91 $phoneNumber',
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: SizedBox(
                // height: 150,
                width: size.width,
                child: Consumer<LoginOtpProvider>(
                  builder: (context, value, child) => OTPTextField(
                    onChanged: (pin) {
                      value.otpValue = int.parse(pin);
                    },
                    controller: value.otpNumberController,
                    contentPadding: const EdgeInsets.all(25),
                    fieldWidth: 70,
                    fieldStyle: FieldStyle.box,
                  ),
                )),
          ),
          Consumer<LoginOtpProvider>(
            builder: (context, value, child) => TextButton(
              onPressed: () {
                value.resendOtp();
              },
              child: const Text(
                'Resend OTP',
                style: TextStyle(color: Color(0xFFE6740C)),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<LoginOtpProvider>(
              builder: (context, value, child) => InkWell(
                onTap: () {
                  value.verifyOtp(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: const Color(0xFFE6740C)),
                  width: size.width,
                  height: size.height * 0.06,
                  child: const Center(
                    child: Text('Continue',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
