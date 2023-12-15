import 'dart:developer';

import 'package:charge_mod_task/controller/login_otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ChargeMOD',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 0.45,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Let's Start",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'From Login',
                  style: TextStyle(
                    fontSize: 42,
                    height: 0.45,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFE6740C),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<LoginOtpProvider>(
                builder: (context, value, child) => IntlPhoneField(
                  controller: value.phoneNumberController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  dropdownDecoration: const BoxDecoration(
                    border: Border(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Consumer<LoginOtpProvider>(
                builder: (context, value, child) => InkWell(
                  onTap: () {
                    log(value.phoneNumberController.toString());
                    value.loginWithPhoneNumber(context);
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
                      child: Text('Send OTP',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: const TextSpan(
                    text: 'By Continuing you agree to our ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Terms & Condition ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFE6740C),
                        ),
                      ),
                      TextSpan(
                        text: 'and',
                      ),
                      TextSpan(
                        text: ' Privacy Policy',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFE6740C),
                        ),
                      ),
                    ]),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
