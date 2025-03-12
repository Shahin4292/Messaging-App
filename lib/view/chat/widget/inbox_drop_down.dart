import 'package:flutter/material.dart';

class InboxDropdownButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;

  const InboxDropdownButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.padding,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: padding, // Custom padding
          child: Row(
            children: [
              Icon(icon, color: Colors.black54, size: 18),
              SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(color: Colors.black87, fontSize: 14),
              ),
              Spacer(),
              Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}
