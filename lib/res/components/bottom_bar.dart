import 'package:fl_chart/fl_chart.dart';
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
    PieChartWidget(),
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

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: _chartSections(),
        borderData: FlBorderData(show: false),
        centerSpaceRadius: 60,
        sectionsSpace: 0,
      ),
    );
  }

  List<PieChartSectionData> _chartSections() {
    return [
      PieChartSectionData(
        value: 40,
        color: Colors.blue,
        title: '40%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 30,
        color: Colors.red,
        title: '30%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 20,
        color: Colors.green,
        title: '20%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 10,
        color: Colors.orange,
        title: '10%',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ];
  }
}

