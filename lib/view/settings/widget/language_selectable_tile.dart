import 'package:flutter/material.dart';

class LanguageSelectableTile extends StatelessWidget {
  final Map<String, dynamic> inbox;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageSelectableTile({
    super.key,
    required this.inbox,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 14, right: 14, top: 4, bottom: 4),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              inbox["name"],
              style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
            ),
            Spacer(),
            if (isSelected) Icon(Icons.check, color: Colors.blue, size: 18),
          ],
        ),
      ),
    );
  }
}
