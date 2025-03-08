import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0), // Add padding around the list
      child: Column(
        children: <Widget>[
          _buildListItem(context, Icons.swap_horiz, 'Set availability', '>', () {
            // Handle Set availability tap
          }),
          _buildListItem(context, Icons.notifications_none, 'Notifications', '>', () {
            // Handle Notifications tap
          }),
          _buildListItem(context, Icons.translate, 'Change Language', 'English >', () {
            // Handle Change Language tap
          }),
          _buildListItem(context, Icons.swap_horiz, 'Switch Account', 'Alpha Net >', () {
            // Handle Switch Account tap
          }),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, IconData icon, String title, String trailing, VoidCallback onTap) {
    return InkWell( // Make the list item tappable
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0), // Add vertical padding to list items
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!, // Light grey border
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.grey[600]), // Grey icon
            SizedBox(width: 16.0), // Add spacing between icon and title
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16.0), // Adjust font size as needed
              ),
            ),
            Text(
              trailing,
              style: TextStyle(color: Colors.grey[600]), // Grey trailing text
            ),
          ],
        ),
      ),
    );
  }
}

// Example usage in a Scaffold:
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: SettingsList(), // Add the settings list
    );
  }
}