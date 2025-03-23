import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Swipe Screen Demo")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Custom swipe transition from left to right
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return SecondScreen();
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  // Define the slide transition
                  const begin = Offset(1.0, 0.0); // Slide from right
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(position: offsetAnimation, child: child);
                },
              ),
            );
          },
          child: Text("Go to Second Screen"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Custom swipe transition from right to left
            Navigator.pop(context);
          },
          child: Text("Go Back"),
        ),
      ),
    );
  }
}
