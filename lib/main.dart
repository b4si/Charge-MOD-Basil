import 'package:charge_mod_task/controller/location_details_priovider.dart';
import 'package:charge_mod_task/controller/log_out_proivder.dart';
import 'package:charge_mod_task/controller/login_otp_provider.dart';
import 'package:charge_mod_task/controller/register_user_details_provider.dart';
import 'package:charge_mod_task/core/local_user_data.dart';
import 'package:charge_mod_task/view/nav_bar_widget.dart';
import 'package:charge_mod_task/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool loggedIn = await UserPreferences.isLoggedIn();
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn;
  const MyApp({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginOtpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogOutProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationDetailsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
            loggedIn ? const BottomNavigationBarWidget() : const SplashScreen(),
      ),
    );
  }
}
