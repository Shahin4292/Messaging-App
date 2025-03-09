import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                leading: const Icon(
                  Icons.sync_alt,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  "Set availability",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.black38,
                ),
                onTap: () {
                  debugPrint('Set availability tapped');
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 55),
                child: Divider(height: 1, color: Colors.grey[300]),
              ),

              ListTile(
                leading: const Icon(
                  Icons.notifications_none,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.black38,
                ),
                onTap: () {
                  debugPrint('Notifications tapped');
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 55),
                child: Divider(height: 1, color: Colors.grey[300]),
              ),
              ListTile(
                leading: const Icon(
                  Icons.language,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  "Change Language",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "English",
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black38,
                    ),
                  ],
                ),
                onTap: () {
                  debugPrint('Change Language tapped');
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 55),
                child: Divider(height: 1, color: Colors.grey[300]),
              ),

              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                ),
                leading: const Icon(
                  Icons.switch_account,
                  color: Colors.black54,
                  size: 20,
                ),
                title: const Text(
                  "Switch Account",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Alpha Net",
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black38,
                    ),
                  ],
                ),
                onTap: () {
                  debugPrint('Switch Account tapped');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}