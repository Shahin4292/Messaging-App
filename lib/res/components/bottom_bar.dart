import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/chat/chat.dart';
import '../../view/settings/settings_view.dart';

class CustomBottomNavScreen extends StatefulWidget {
  const CustomBottomNavScreen({super.key});

  @override
  CustomBottomNavScreenState createState() => CustomBottomNavScreenState();
}

class CustomBottomNavScreenState extends State<CustomBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    IndexScreen(),
    ChatScreen(),
    SettingsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          bottom: 25,
          left: 40,
          right: 40,
          top: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onItemTapped(0),
              child: Icon(
                _selectedIndex == 0
                    ? Icons.inbox_rounded
                    : Icons.inbox_outlined,
                color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                size: 30,
              ),
            ),
            // Chat Icon
            GestureDetector(
              onTap: () => _onItemTapped(1),
              child: Icon(
                _selectedIndex == 1
                    ? CupertinoIcons.chat_bubble_fill
                    : CupertinoIcons.chat_bubble,
                color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                size: 30,
              ),
            ),
            // Settings Icon
            GestureDetector(
              onTap: () => _onItemTapped(2),
              child: Icon(
                _selectedIndex == 2
                    ? CupertinoIcons.gear_alt_fill
                    : CupertinoIcons.gear_alt,
                color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Index', style: TextStyle(fontSize: 24,fontFamily: 'InterL')));
  }
}


