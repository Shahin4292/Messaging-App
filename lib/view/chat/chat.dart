import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/view/chat/widget/chat_screen_widget.dart';
import 'package:messaging_app/view/chat/widget/filter_button.dart';
import 'package:messaging_app/view/chat/widget/sort_selectable_tile.dart';
import '../../res/repository/inbox_list.dart';
import '../../viewModel/chat_controller/chat_controller.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ChatController chatController = Get.put(ChatController());
  final Map<String, String> selectedFilters = {};

  void _showStatusSelectionBottomSheet(String filterValue) {
    final currentSelected = selectedFilters[filterValue] ?? 'All';
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Filter by Status",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: statusIcons.length,
              separatorBuilder:
                  (_, __) => Divider(height: 1, color: Colors.grey.shade300),
              itemBuilder: (context, index) {
                final status = statusIcons.keys.elementAt(index);
                final icon = statusIcons[status];
                final isSelected = currentSelected == status;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilters[filterValue] = status;
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 14,
                      right: 14,
                      top: 10,
                      bottom: 10,
                    ),

                    child: Row(
                      children: [
                        Icon(icon, size: 20, color: Colors.grey),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            status,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),

                        if (isSelected) Icon(Icons.check, color: Colors.blue),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showFruitSelectionBottomSheet(String filterValue) {
    final List<String> fruits = ['All Item', 'Created Page'];
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            final fruit = fruits[index];
            final isSelected = selectedFilters[filterValue] == fruit;
            return FilterOptionTile(
              label: fruit,
              isSelected: isSelected,
              showDivider: index < fruits.length - 1,
              onTap: () {
                setState(() {
                  selectedFilters[filterValue] = fruit;
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  void _showAllInboxSelectionBottomSheet(String indexValue) {
    final currentSelected = selectedFilters[indexValue] ?? 'All';
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Filter by Inbox",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: inboxes.length,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder:
                    (_, __) => Divider(height: 1, color: Colors.grey.shade300),
                itemBuilder: (context, index) {
                  final inbox = inboxes.keys.elementAt(index);
                  final icon = inboxes[inbox];
                  final isSelected = currentSelected == inbox;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilters[indexValue] = inbox;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 14,
                        right: 14,
                        top: 10,
                        bottom: 10,
                      ),

                      child: Row(
                        children: [
                          Icon(icon, size: 20, color: Colors.grey),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              inbox,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          if (isSelected) Icon(Icons.check, color: Colors.blue),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLatestSelectionBottomSheet(String filterValue) {
    final List<String> latest = ['Latest', 'Created At', 'Priority'];
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Sort By",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: latest.length,
              itemBuilder: (context, index) {
                final late = latest[index];
                final isSelected = selectedFilters[filterValue] == late;
                return FilterOptionTile(
                  label: late,
                  isSelected: isSelected,
                  showDivider: index < latest.length - 1,
                  onTap: () {
                    setState(() {
                      selectedFilters[filterValue] = late;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        actions: [
          SizedBox(width: 20),
          Text(
            "Conversation",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "InterB",
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  chatController.messages.isNotEmpty
                      ? [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "(${chatController.messages.last.id.toString()})",
                            style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                          ), // Show only the last item
                        ),
                      ]
                      : [],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    filters.map((filter) {
                      final selectedValue = selectedFilters[filter['value']];

                      return FilterButton(
                        filterValue: filter['value']!,
                        selectedValue: selectedValue,
                        statusIcons:
                            filter['value'] == 'All inboxes'
                                ? inboxes
                                : statusIcons,
                        // statusIcons: filter['value'] == 'All inboxes' || filter['value'] == 'Sort: Latest' ? inboxes : statusIcons,
                        onTap:
                            filter['value'] == 'All'
                                ? () => _showFruitSelectionBottomSheet(
                                  filter['value']!,
                                ) // Show fruit options for 'All'
                                : filter['value'] == 'All inboxes'
                                ? () => _showAllInboxSelectionBottomSheet(
                                  filter['value']!,
                                )
                                : filter['value'] == 'Sort: Latest'
                                ? () => _showLatestSelectionBottomSheet(
                                  filter['value']!,
                                ) // Show all inboxes options
                                : () => _showStatusSelectionBottomSheet(
                                  filter['value']!,
                                ), // Show status options for others
                      );
                    }).toList(),
              ),
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade300),
          Expanded(child: ChatWidget()),
        ],
      ),
    );
  }
}
