import 'package:flutter/material.dart';

class SentTimeWidget extends StatelessWidget {
  final DateTime sentTime;
  final Color color;
  final double fontSize;

  const SentTimeWidget({
    super.key,
    required this.sentTime,
    required this.color,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        "${sentTime.hour}:${sentTime.minute < 10 ? '0' : ''}${sentTime.minute} ${sentTime.hour >= 12 ? 'PM' : 'AM'}";

    return Text(
      textAlign: TextAlign.start,
      formattedTime,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'InterL',
        color: color,
      ),
    );
  }
}
