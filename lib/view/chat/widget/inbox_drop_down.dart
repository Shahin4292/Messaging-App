import 'package:flutter/material.dart';
import 'package:messaging_app/utils/color_path.dart';

class InboxDropDown extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const InboxDropDown({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          decoration: BoxDecoration(
            color: ColorPath.greenShade,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.black87, fontSize: 14,fontFamily: 'Inter'),
              ),
              Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}

class AllInboxDropDown extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onTap;

  const AllInboxDropDown({
    super.key,
    required this.title,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          decoration: BoxDecoration(
            color: ColorPath.greenShade,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              Icon(icon, color: Colors.black54, size: 18),
              SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(color: Colors.black87, fontSize: 14,fontFamily: 'Inter'),
              ),
              Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}
