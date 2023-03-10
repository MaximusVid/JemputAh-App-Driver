import 'dart:async';
import 'package:jemputah_app_driver/constants/color.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundGreen,
            ),
          ),
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Image.asset('assets/images/logo.png'),
            ),
          )
        ],
      ),
    );
  }
}
