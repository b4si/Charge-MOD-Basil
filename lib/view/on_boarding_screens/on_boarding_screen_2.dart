import 'package:charge_mod_task/view/login_screen.dart';
import 'package:charge_mod_task/view/on_boarding_screens/on_boarding_screen_1.dart';
import 'package:charge_mod_task/view/on_boarding_screens/on_boarding_screen_3.dart';
import 'package:charge_mod_task/view/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingScreenTwo extends StatelessWidget {
  const OnBoardingScreenTwo({super.key});

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
                        childCurrent: const OnBoardingScreenTwo(),
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
                    style: TextStyle(color: Colors.black),
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
                      'Easy EV Navigation',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Travel Route',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.07),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'For Electrics',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFE6740C),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.1, top: size.height * 0.03),
              child: Image.asset(
                'asset\\Group 35405.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            const Text(
              'Grab The Best in Class',
              style: TextStyle(
                  fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Digital Experience Crafted For',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'EV Drivers',
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
                          child: const OnBoardingScreenOne(),
                          type: PageTransitionType.leftToRightJoined,
                          childCurrent: const OnBoardingScreenTwo(),
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
                  ],
                ),
                RoundedButton(
                    size: size,
                    function: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const OnBoardingScreenThree(),
                          type: PageTransitionType.rightToLeftJoined,
                          childCurrent: const OnBoardingScreenTwo(),
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
