import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String texst;
  final IconData icon;
  final IconData icons;
  final IconData? icone;

  const CustomCard({
    super.key,
    required this.text,
    required this.icon,
    required this.icons,
    this.icone,
    required this.texst,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 18),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,fontFamily: 'Inter'),
          ),
          Spacer(),
          Text(texst, style: TextStyle(color: Colors.black54, fontSize: 11,fontFamily: 'Inter')),
          SizedBox(width: 3),
          Icon(icons, size: 13, color: Colors.black38),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40),
      child: Divider(height: 1, color: Colors.grey[300]),
    );
  }
}
