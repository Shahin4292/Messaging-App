import 'package:flutter/material.dart';

class SelectableTile extends StatelessWidget {
  final String name;
  final String role;
  final int selectedTileIndex;
  final int index;
  final ValueChanged<int> onTap;

  const SelectableTile({
    super.key,
    required this.name,
    required this.role,
    required this.selectedTileIndex,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index); // Trigger onTap with the current index
        Navigator.pop(context); // Close bottom sheet after selection
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
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

class CustomPadding extends StatelessWidget {
  const CustomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18),
      child: Divider(height: 1, color: Colors.grey[300]),
    );
  }
}
