import 'package:flutter/material.dart';
import 'package:messaging_app/view/chat/widget/sort_selectable_tile.dart';

import '../../../res/repository/inbox_list.dart';
import 'all_inbox_tile.dart';
import 'inbox_drop_down.dart';
import 'mine_selectable_tile.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  int? selectedTileIndex;
  String selectedInbox = "All Inboxes"; // Default selected inbox

  void _showAllInboxBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Filter by inbox",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontFamily: "Inter"
                ),
              ),
              // Divider(thickness: 0.7, height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: inboxes.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InboxTile(inbox: inboxes[index],
                          isSelected: selectedInbox == inboxes[index]["name"], onTap: () {
                            setState(() {
                              selectedInbox = inboxes[index]["name"];
                            });
                            Navigator.pop(context);
                          },),
                        if (index < inboxes.length - 1) Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Divider(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _mineShowBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Filter by status",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              MineSelectableTile(
                icon: Icons.apps,
                title: 'All',
                isSelected: selectedTileIndex == 0,
                onTap: () {
                  setState(() {
                    selectedTileIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              CustomDivider(),
              MineSelectableTile(
                icon: Icons.cached_outlined,
                title: 'Open',
                isSelected: selectedTileIndex == 1,
                onTap: () {
                  setState(() {
                    selectedTileIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              CustomDivider(),
              MineSelectableTile(
                icon: Icons.light_mode_outlined,
                title: 'Pending',
                isSelected: selectedTileIndex == 2,
                onTap: () {
                  setState(() {
                    selectedTileIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              CustomDivider(),
              MineSelectableTile(
                icon: Icons.snooze_outlined,
                title: 'Snoozed',
                isSelected: selectedTileIndex == 3,
                onTap: () {
                  setState(() {
                    selectedTileIndex = 3;
                  });
                  Navigator.pop(context);
                },
              ),
              CustomDivider(),
              MineSelectableTile(
                icon: Icons.task_alt_outlined,
                title: 'Resolved',
                isSelected: selectedTileIndex == 4,
                onTap: () {
                  setState(() {
                    selectedTileIndex = 4;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _sortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Sort by",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),

              SortSelectableTile(
                label: 'Latest',
                isSelect: selectedTileIndex == 0,
                onTap: () {
                  setState(() {
                    selectedTileIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              CustomDivider(),
              SortSelectableTile(
                label: 'Created At',
                isSelect: selectedTileIndex == 1,
                onTap: () {
                  setState(() {
                    selectedTileIndex = 1; // Set "All" as selected
                  });
                  Navigator.pop(context);
                },
              ),
              CustomDivider(),
              SortSelectableTile(
                label: 'Priority',
                isSelect: selectedTileIndex == 2,
                onTap: () {
                  setState(() {
                    selectedTileIndex = 2; // Set "All" as selected
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enables horizontal scrolling
        child: Padding(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Row(
            children: [
              InboxDropDown(
                  title: 'Mine',
                onTap: () => _mineShowBottomSheet(context),
              ),
              InboxDropDown(
                  title: 'All',
                  onTap: () {}
              ),
              AllInboxDropDown(
                title: 'All inboxes',
                icon: Icons.chat_outlined,
                onTap: () => _showAllInboxBottomSheet(context)
              ),

              InboxDropDown(
                  title: 'Sort: Latest',
                  onTap: () => _sortBottomSheet(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
