import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  int? selectedTileIndex;
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.only(top: 10,bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Filter by status",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTileIndex = 0; // Set "All" as selected
                  });
                  Navigator.pop(context); // Close bottom sheet after selection
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.apps,
                        color: Colors.black54,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "All",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                      Spacer(),
                      if (selectedTileIndex == 0)
                        Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 47),
                child: Divider(height: 1, color: Colors.grey[300]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTileIndex = 1; // Set "Chat with us" as selected
                  });
                  Navigator.pop(context); // Close bottom sheet after selection
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.cached_outlined,
                        color: Colors.black54,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Open",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                      Spacer(),
                      if (selectedTileIndex == 1)
                        Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 47),
                child: Divider(height: 1, color: Colors.grey[300]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTileIndex = 2; // Set "Chat with us" as selected
                  });
                  Navigator.pop(context); // Close bottom sheet after selection
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.light_mode_outlined,
                        color: Colors.black54,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Pending",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                      Spacer(),
                      if (selectedTileIndex == 2)
                        Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 47),
                child: Divider(height: 1, color: Colors.grey[300]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTileIndex = 3; // Set "Chat with us" as selected
                  });
                  Navigator.pop(context); // Close bottom sheet after selection
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.snooze_outlined,
                        color: Colors.black54,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Snoozed",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                      Spacer(),
                      if (selectedTileIndex == 3)
                        Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 47),
                child: Divider(height: 1, color: Colors.grey[300]),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTileIndex = 4; // Set "Chat with us" as selected
                  });
                  Navigator.pop(context); // Close bottom sheet after selection
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.task_alt_outlined,
                        color: Colors.black54,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Resolved",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                      Spacer(),
                      if (selectedTileIndex == 4)
                        Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
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
          padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: Colors.black54,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // "Mine" Button with Dropdown
              GestureDetector(
                onTap: () => _showBottomSheet(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Mine",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black54),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "All",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black54),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chat_outlined,
                        color: Colors.black54,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "All inboxes",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black54),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Sort: Latest",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black54),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}