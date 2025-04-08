// import 'package:flutter/material.dart';
//
// class MineSelectableTile extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const MineSelectableTile({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.isSelected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: Colors.black54, size: 20),
//             SizedBox(width: 10),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black,fontFamily: 'Inter'
//               ),
//             ),
//             Spacer(),
//             if (isSelected) Icon(Icons.check, size: 20, color: Colors.blue),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CustomDivider extends StatelessWidget {
//   const CustomDivider({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 15),
//       child: Divider(height: 1, color: Colors.grey[300]),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SelectableItem extends StatelessWidget {
  final String status;
  final String filterValue;
  final bool isSelected;
  final IconData icon;
  final ValueChanged<String> onTap;

  const SelectableItem({
    super.key,
    required this.status,
    required this.filterValue,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(status);
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          SizedBox(width: 10),

          // Text displaying the status
          Expanded(
            child: Text(
              status,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.black,
                fontFamily: 'Inter',
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),

          if (isSelected)
            Icon(
              Icons.check,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}

