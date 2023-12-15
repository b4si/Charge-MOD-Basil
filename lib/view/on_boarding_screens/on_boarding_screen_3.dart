import 'package:charge_mod_task/view/login_screen.dart';
import 'package:charge_mod_task/view/on_boarding_screens/on_boarding_screen_2.dart';
import 'package:charge_mod_task/view/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingScreenThree extends StatelessWidget {
  const OnBoardingScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Interaction With Grid',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500, height: 2.5),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Real Time',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    height: 0.45,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Monitoring',
                  style: TextStyle(
                    fontSize: 40,
                    height: size.height * 0.002,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFE6740C),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.1, top: size.height * 0.03),
              child: Image.asset(
                'asset\\Group 35406.png',
                fit: BoxFit.cover,
                height: size.height * 0.35,
              ),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            const Text(
              'Intelligent Sensible Devices',
              style: TextStyle(
                  fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Ambicharge Series',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                    size: size,
                    function: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: const OnBoardingScreenTwo(),
                          type: PageTransitionType.leftToRightJoined,
                          childCurrent: const OnBoardingScreenThree(),
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
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 18,
                      weight: 50,
                    ),
                    color: const Color(0xFFE6740C)),
                Row(
                  children: [
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
                      width: size.width * 0.02,
                    ),
                    const CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
                RoundedButton(
                    size: size,
                    function: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          child: const LoginScreen(),
                          type: PageTransitionType.rightToLeftJoined,
                          childCurrent: const OnBoardingScreenThree(),
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
