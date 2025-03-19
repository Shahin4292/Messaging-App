import 'package:flutter/material.dart';

class SentTimeWidget extends StatelessWidget {
  final DateTime sentTime;

  const SentTimeWidget({super.key, required this.sentTime});

  @override
  Widget build(BuildContext context) {
    String formattedTime = "${sentTime.hour}:${sentTime.minute < 10 ? '0' : ''}${sentTime.minute} ${sentTime.hour >= 12 ? 'PM' : 'AM'}";

    return Text(
      textAlign: TextAlign.right,
      formattedTime,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'InterL',
        color: Colors.grey.shade300,
      ),
    );
  }
}
