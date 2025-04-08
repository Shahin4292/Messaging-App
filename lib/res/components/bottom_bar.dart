import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/chat/chat.dart';
import '../../view/home_view/home_view.dart';
import '../../view/settings/settings_view.dart';

class CustomBottomNavScreen extends StatefulWidget {
  const CustomBottomNavScreen({super.key});

  @override
  CustomBottomNavScreenState createState() => CustomBottomNavScreenState();
}

class CustomBottomNavScreenState extends State<CustomBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    ChatView(),
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
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:  BorderRadius.circular(30),
                onTap: () => _onItemTapped(0),
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 24,
                    left: 30,
                    right: 30,
                    top: 10,
                  ),
                  child: Icon(
                    _selectedIndex == 0
                        ? Icons.inbox_rounded
                        : Icons.inbox_outlined,
                    color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                    size: 28,
                  ),
                ),
              ),
            ),
            // Chat Icon
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:  BorderRadius.circular(30),
                onTap: () => _onItemTapped(1),
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 24,
                    left: 30,
                    right: 30,
                    top: 10,
                  ),
                  child: Icon(
                    _selectedIndex == 1
                        ? CupertinoIcons.chat_bubble_fill
                        : CupertinoIcons.chat_bubble,
                    color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                    size: 28,
                  ),
                ),
              ),
            ),
            // Settings Icon
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:  BorderRadius.circular(30),
                onTap: () => _onItemTapped(2),
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 24,
                    left: 30,
                    right: 30,
                    top: 10,
                  ),
                  child: Icon(
                    _selectedIndex == 2
                        ? CupertinoIcons.gear_alt_fill
                        : CupertinoIcons.gear_alt,
                    color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

