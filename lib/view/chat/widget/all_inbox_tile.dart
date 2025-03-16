import 'package:flutter/material.dart';

class InboxTile extends StatelessWidget {
  final Map<String, dynamic> inbox;
  final bool isSelected;
  final VoidCallback onTap;

  const InboxTile({super.key,
    required this.inbox,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 14,right: 14,top: 6,bottom: 6),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              inbox["icon"],
              size: 18,
              color: Colors.grey,
            ),
            SizedBox(width: 10),
            Text(
              inbox["name"], // Display the name
              style: TextStyle(fontSize: 14,fontFamily: 'Inter'),
            ),
            Spacer(),
            if (isSelected)
              Icon(Icons.check, color: Colors.blue, size: 18),
          ],
        ),
      ),
    );
  }
}
