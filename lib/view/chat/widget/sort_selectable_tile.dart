import 'package:flutter/material.dart';

class SortSelectableTile extends StatelessWidget {
  final String label;
  final bool isSelect;
  final VoidCallback onTap;

  const SortSelectableTile({
    super.key,
    required this.label,
    required this.isSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Spacer(),
            if (isSelect) Icon(Icons.check, size: 20, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
