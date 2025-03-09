import 'package:flutter/material.dart';

import '../../view/chat/chat.dart';
import '../../view/index/index.dart';
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
    ChatInboxScreen(),
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 30,
            left: 30,
            right: 30,
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home Icon
              GestureDetector(
                onTap: () => _onItemTapped(0),
                child: Icon(
                  _selectedIndex == 0
                      ? Icons.inbox_rounded
                      : Icons.inbox_outlined,
                  color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                  size: 25,
                ),
              ),
              // Chat Icon
              GestureDetector(
                onTap: () => _onItemTapped(1),
                child: Icon(
                  _selectedIndex == 0
                      ? Icons.chat_bubble_outline
                      : Icons.chat_bubble,
                  color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                  size: 25,
                ),
              ),
              // Settings Icon
              GestureDetector(
                onTap: () => _onItemTapped(2),
                child: Icon(
                  Icons.settings,
                  color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy Pages
class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Index', style: TextStyle(fontSize: 24)));
  }
}


