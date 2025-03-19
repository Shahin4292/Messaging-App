import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

import '../../res/components/bottom_bar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNavScreen()),
      );
    });
  }
  // Route createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => CustomBottomNavScreen(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(1.0, 0.0);
  //       const end = Offset.zero;
  //       const curve = Curves.easeInOut;
  //
  //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //       var offsetAnimation = animation.drive(tween);
  //
  //       var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
  //
  //       return SlideTransition(
  //         position: offsetAnimation,
  //         child: FadeTransition(
  //           opacity: fadeAnimation,
  //           child: child,
  //         ),
  //       );
  //     },
  //     transitionDuration: Duration(milliseconds: 0)
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Lottie.asset(
          'assets/fonts/splash_animation.json',
          width: 350,
          height: 350,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
