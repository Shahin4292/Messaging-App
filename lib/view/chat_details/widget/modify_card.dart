import 'package:flutter/material.dart';

class ModifyCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPress;
  final Color color;
  final Color colors;

  const ModifyCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onPress, required this.color, required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 120,
        width: 115,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Icon(icon, size: 35, color: colors),
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: "Inter",
              ),
            ),
          ],
        ),
      ),
    );
  }
}