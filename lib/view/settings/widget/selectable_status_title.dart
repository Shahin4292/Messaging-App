import 'package:flutter/material.dart';

class SelectableStatusTile extends StatelessWidget {
  final String label;
  final int selectedTileIndex;
  final int index;
  final Color color;
  final ValueChanged<int> onTap;

  const SelectableStatusTile({
    super.key,
    required this.label,
    required this.selectedTileIndex,
    required this.index,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index); // Trigger onTap with the current index
        Navigator.pop(context); // Close the bottom sheet
      },
      child: Container(
        padding: EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 8),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 6,
            ),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'Inter'
              ),
            ),
            Spacer(),
            if (selectedTileIndex == index)
              Icon(Icons.check, size: 20, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

