import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String? texst;
  final IconData icon;
  final IconData icons;
  final IconData? icone;
  final VoidCallback onPressed;

  const CustomCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.icons, this.icone, this.texst,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      leading: Icon(icon, color: Colors.black54, size: 18),
      title: Text(
        text,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      ),
      trailing: Icon(icons, size: 13, color: Colors.black38),
      onTap: onPressed,
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 55),
      child: Divider(height: 1, color: Colors.grey[300]),
    );
  }
}

// class SwitchCard extends StatelessWidget {
//   final String text;
//   final IconData icon;
//   final IconData icons;
//   final IconData? icone;
//   final VoidCallback onPressed;
//
//   const SwitchCard({
//     super.key,
//     required this.text,
//     required this.icon,
//     required this.icons,
//     required this.onPressed,
//     this.icone,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(14),
//           bottomRight: Radius.circular(14),
//         ),
//       ),
//       leading: Icon(icon, color: Colors.black54, size: 18),
//       title: const Text(
//         "Switch Account",
//         style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
//       ),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(text, style: TextStyle(color: Colors.black54, fontSize: 11)),
//           const Icon(Icons.arrow_forward_ios, size: 13, color: Colors.black38),
//         ],
//       ),
//       onTap: onPressed,
//     );
//   }
// }
