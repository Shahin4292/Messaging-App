import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the Home Page after a delay
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        _createRoute(),
      );
    });
  }

  // Custom route with left-to-right slide and fade effect
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Slide transition from left to right
        const begin = Offset(-1.0, 0.0); // Start position (off-screen to the left)
        const end = Offset.zero; // End position (center of the screen)
        const curve = Curves.easeInOut;

        // Apply the sliding effect with the animation
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // Fade transition effect
        var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);

        // Combine both slide and fade effects
        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Text("Welcome to the Home Page!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
