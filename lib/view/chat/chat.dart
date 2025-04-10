import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/view/chat/widget/chat_screen_widget.dart';
import '../../res/repository/inbox_list.dart';
import '../../viewModel/chat_controller/chat_controller.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ChatController chatController = Get.put(ChatController());
  void _handleFilterTap(String filter) {
    final subOptions = subOptionsMap[filter] ?? [];

    if (subOptions.isEmpty) {
      setState(() {
        chatController.selectedMainFilter = filter;
        chatController.selectedSubOptions.remove(filter);
        chatController.selectedSubOptionIcons.remove(filter);
      });
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.separated(
          itemCount: subOptions.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => Divider(height: 1),
          itemBuilder: (context, index) {
            final option = subOptions[index];
            final icon = subOptionIcons[option];
            final hasIcon = icon != null;
            final isSelected = chatController.selectedSubOptions[filter] == option;

            return InkWell(
              onTap: () {
                setState(() {
                  chatController.selectedMainFilter = filter;
                  chatController.selectedSubOptions[filter] = option;
                  if (hasIcon) {
                    chatController.selectedSubOptionIcons[filter] = icon;
                  } else {
                    chatController.selectedSubOptionIcons.remove(filter);
                  }
                });
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Row(
                  children: [
                    if (hasIcon) Icon(icon, size: 20),
                    if (hasIcon) const SizedBox(width: 10),
                    Expanded(child: Text(option)),
                    if (isSelected)
                      Icon(Icons.check, color: Colors.blue),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8,left: 14, right: 14),
              child: Row(
                spacing: 8,
                children: mainFilters.map((filter) {
                  final isSelected = chatController.selectedMainFilter == filter;
                  final showArrow = subOptionsMap.containsKey(filter);
                  final icon = chatController.getButtonIcon(filter);

                  return GestureDetector(
                    onTap: () => _handleFilterTap(filter),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          if (icon != null) ...[
                            Icon(icon, size: 16, color: isSelected ? Colors.white : Colors.black),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            chatController.getButtonLabel(filter),
                            style: TextStyle(color: isSelected ? Colors.white : Colors.black,fontFamily: 'Inter'),
                          ),
                          if (showArrow) ...[
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down,
                                size: 20, color: isSelected ? Colors.white : Colors.black),
                          ],
                        ],
                      ),
                    ),
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
