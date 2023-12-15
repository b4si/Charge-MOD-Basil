import 'package:charge_mod_task/view/login_screen.dart';
import 'package:charge_mod_task/view/on_boarding_screens/on_boarding_screen_2.dart';
import 'package:charge_mod_task/view/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingScreenOne extends StatelessWidget {
  const OnBoardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        child: const LoginScreen(),
                        type: PageTransitionType.rightToLeftJoined,
                        childCurrent: const OnBoardingScreenOne(),
                        reverseDuration: const Duration(
                          milliseconds: 600,
                        ),
                        duration: const Duration(
                          milliseconds: 1000,
                        ),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'SKIP',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Stack(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Charge your EV',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.015),
                      child: const Text(
                        'At your ',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: const Text(
                        'Fingertips',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            fontSize: 40,
                            color: Color(0xFFE6740C)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset(
                'asset\\Group 35403.png',
                height: size.height * 0.45,
                width: size.width * 1.5,
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              'Scan Charge and Go',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Effortless Charging Schemas",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.41,
                ),
                const CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.black,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: size.width * 0.17,
                ),
                RoundedButton(
                    size: size,
                    function: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const OnBoardingScreenTwo(),
                          type: PageTransitionType.rightToLeftJoined,
                          childCurrent: const OnBoardingScreenOne(),
                          reverseDuration: const Duration(
                            milliseconds: 600,
                          ),
                          duration: const Duration(
                            milliseconds: 1000,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 18,
                      weight: 50,
                    ),
                    color: const Color(0xFFE6740C))
              ],
            )
          ],
        ),
      ),
    );
  }
}
