import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final IconData trailingIcon;
  final VoidCallback onTap;
  final BorderRadiusGeometry? borderRadius; // Custom border radius parameter

  const CustomListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.trailingIcon,
    required this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: borderRadius!),
      leading: Icon(leadingIcon, color: Colors.black54, size: 18),
      title: Text(
        title,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      ),
      trailing: Icon(trailingIcon, size: 13, color: Colors.black38),
      onTap: onTap,
    );
  }
}
