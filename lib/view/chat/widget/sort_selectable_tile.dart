import 'package:flutter/material.dart';

class FilterOptionTile extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showDivider;

  const FilterOptionTile({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label),
                if (isSelected) const Icon(Icons.check, color: Colors.blue),
              ],
            ),
          ),
          if (showDivider)
            Divider(height: 1, color: Colors.grey.shade300),
        ],
      ),
    );
  }
}
