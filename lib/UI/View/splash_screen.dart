import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled7/UI/View/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Splash splash = Splash();

  @override
  void initState() {
    super.initState();
    splash.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          'assets/images/imgLog.png',
          width: 430.w,
          height: 1000.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 150.h,
          child: Image.asset(
            'assets/icons/Group 33.png',
            alignment: Alignment.center,
            height: 175.h,
          ),
        ),
      ],
    );
  }
}
