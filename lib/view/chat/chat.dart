import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/view/chat/widget/chat_screen_widget.dart';
import 'package:messaging_app/view/chat/widget/custom_button.dart';
import 'package:messaging_app/view/chat/widget/items.dart';
import 'package:messaging_app/view/chat/widget/mine_selectable_tile.dart';

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
        return ListView.separated(
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
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(8),
                // ),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      size: 20,
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        status,
                        style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.black,
                          fontFamily: 'Inter',
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),

                    if (isSelected) Icon(Icons.check, color: Colors.blue),
                  ],
                ),
              ),
            );
            // return SelectableItem(
            //   status: '',
            //   filterValue: '',
            //   isSelected: null,
            //   icon: null,
            //   onTap: (String value) {},
            // );
          },
        );
      },
    );
  }

  void _showFruitSelectionBottomSheet(String filterValue) {
    final List<String> fruits = ['apple', 'banana', 'mango'];

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            final fruit = fruits[index];
            final isSelected = selectedFilters[filterValue] == fruit;

            return ListTile(
              title: Text(fruit),
              trailing:
                  isSelected ? Icon(Icons.check, color: Colors.blue) : null,
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
        return ListView.separated(
          shrinkWrap: true,
          itemCount: inboxes.length,
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
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(8),
                // ),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      size: 20,
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        inbox,
                        style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.black,
                          fontFamily: 'Inter',
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),

                    if (isSelected) Icon(Icons.check, color: Colors.blue),
                  ],
                ),
              ),
            );
          },
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
                        statusIcons: statusIcons,
                        onTap:
                            filter['value'] == 'All'
                                ? () => _showFruitSelectionBottomSheet(
                                  filter['value']!,
                                ) // Show fruit options for 'All'
                                : filter['value'] == 'All inboxes'
                                ? () => _showAllInboxSelectionBottomSheet(
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
      // body: Column(
      //   children: [
      //     Expanded(child: ConversationScreen()),
      //     // CustomButton(),
      //     Divider(height: 1, color: Colors.grey.shade300),
      //     Expanded(child: ChatWidget()),
      //   ],
      // ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String filterValue;
  final String? selectedValue;
  final Map<String, IconData> statusIcons;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.filterValue,
    required this.selectedValue,
    required this.statusIcons,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = selectedValue ?? filterValue;
    final icon = selectedValue != null ? statusIcons[selectedValue] : null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.blue.shade100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: Colors.grey),
              SizedBox(width: 6),
            ],
            Text(
              displayText,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
