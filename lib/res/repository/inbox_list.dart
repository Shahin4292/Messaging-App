import 'package:flutter/material.dart';

final List<String> mainFilters = [
  'All',
  'Mine',
  'All inboxes',
  'Sort: Latest'
];

final Map<String, List<String>> subOptionsMap = {
  'Mine': ['All', 'Open', 'Pending', 'Snoozed', 'Resolved'],
  'All inboxes': [
    'Alpha',
    'Pbx.com.bd (Fb)',
    'Sms.net.bd (W)',
    'Eckhard Livechat',
    'Go Digital Bd Livechat',
    'Go Digital Bd (Fb)',
    'Alpha Pbx Livechat',
    'Alpha.net.bd Livechat',
    'Lambda Website',
    'Alpha Sms Livechat',
    'Alpha Sms (Fb)',
    'Eckhard.com.bd (Fb)',
    'Alpha Net - Online Shop (Fb)',
  ],
  'Sort: Latest': ['Latest', 'Created At', 'Priority'],
};

final Map<String, IconData> subOptionIcons = {
  'All': Icons.apps,
  'Open': Icons.cached_outlined,
  'Pending': Icons.light_mode_outlined,
  'Snoozed': Icons.snooze_outlined,
  'Resolved': Icons.task_alt_outlined,

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
