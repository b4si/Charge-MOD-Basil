// ignore_for_file: must_be_immutable

import 'package:charge_mod_task/view/on_boarding_screens/on_boarding_screen_1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double progressValue = 0.4;

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingScreenOne(),
        ),
      );
    });
  }

  void _initAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  void _startAnimation() {
    _animationController.forward();
  }

  @override
  void initState() {
    _initAnimation();
    _startAnimation();
    navigateToNextScreen();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 90,
          ),
          const Image(
            image: AssetImage(
              'asset\\charge_mode_logo.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 35,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.orange, width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  height: size.height * 0.01,
                  child: InkWell(
                    child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return LinearProgressIndicator(
                            value: _animation.value,
                            color: const Color(0xFFE6740C),
                            backgroundColor: Colors.grey.shade300,
                          );
                        }),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnBoardingScreenOne(),
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Connecting to ChargeMOD',
                    style: TextStyle(letterSpacing: 1),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
