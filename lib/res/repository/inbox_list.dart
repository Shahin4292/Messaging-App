import 'package:flutter/material.dart';

final Map<String, IconData> inboxes = {
  'All Inboxes': Icons.all_inbox,
  'Alpha': Icons.public,
  'Pbx.com.bd (Fb)': Icons.chat,
  'Sms.net.bd (W)': Icons.sms,
  'Eckhard Livechat': Icons.support_agent,
  'Go Digital Bd Livechat': Icons.headset_mic,
  'Go Digital Bd (Fb)': Icons.facebook,
  'Alpha Pbx Livechat': Icons.phone,
  'Alpha.net.bd Livechat': Icons.web,
  'Lambda Website': Icons.gavel,
  'Alpha Sms Livechat': Icons.message,
  'Alpha Sms (Fb)': Icons.facebook,
  'Eckhard.com.bd (Fb)': Icons.facebook,
  'Alpha Net - Online Shop (Fb)': Icons.shopping_cart,
};
final List<Map<String, String>> filters = [
  {'label': 'All', 'value': 'All'},
  {'label': 'Mine', 'value': 'Mine'},
  {'label': 'All inboxes', 'value': 'All inboxes'},
  {'label': 'Sort: Latest', 'value': 'Sort: Latest'},
];
final Map<String, IconData> statusIcons = {
  'All': Icons.apps,
  'Open': Icons.cached_outlined,
  'Pending': Icons.light_mode_outlined,
  'Snoozed': Icons.snooze_outlined,
  'Resolved': Icons.task_alt_outlined,
};