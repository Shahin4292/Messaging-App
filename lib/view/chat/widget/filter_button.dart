import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String filterValue;
  final String? selectedValue;
  final Map<String, IconData> statusIcons;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.filterValue,
    required this.selectedValue,
    required this.statusIcons,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = selectedValue ?? filterValue;
    final icon = selectedValue != null ? statusIcons[selectedValue] : null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.blue.shade100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: Colors.grey),
              SizedBox(width: 6),
            ],
            Text(
              displayText,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}