import 'package:flutter/material.dart';


class SlideScreen extends StatefulWidget {
  const SlideScreen({super.key});

  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  int _currentIndex = 0; // 0 for First Page, 1 for Second Page

  void _goNext() {
    if (_currentIndex == 0) {
      setState(() {
        _currentIndex = 1;
      });
    }
  }

  void _goPrevious() {
    if (_currentIndex == 1) {
      setState(() {
        _currentIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Button for Swipe"),
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (value) {
            if (value == "left") {
              _goPrevious(); // Swipe Right to Left (Previous Page)
            } else if (value == "right") {
              _goNext(); // Swipe Left to Right (Next Page)
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: "left",
              child: ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text("Swipe Left (Back)"),
              ),
            ),
            const PopupMenuItem(
              value: "right",
              child: ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text("Swipe Right (Next)"),
              ),
            ),
          ],
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final slideAnimation = Tween<Offset>(
            begin: _currentIndex == 1 ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation);

          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
        child: _currentIndex == 0 ? const FirstPage() : const SecondPage(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey(1), // Unique key for AnimatedSwitcher
      color: Colors.blue[100],
      alignment: Alignment.center,
      child: const Text("Tap Menu > Click Right to go to Second Page", style: TextStyle(fontSize: 18)),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey(2), // Unique key for AnimatedSwitcher
      color: Colors.green[100],
      alignment: Alignment.center,
      child: const Text("Tap Menu > Click Left to go back to First Page", style: TextStyle(fontSize: 18)),
    );
  }
}
