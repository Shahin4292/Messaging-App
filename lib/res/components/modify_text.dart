import 'package:flutter/material.dart';

class ModifyText extends StatelessWidget {
  final String title;

  const ModifyText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
    );
  }
}