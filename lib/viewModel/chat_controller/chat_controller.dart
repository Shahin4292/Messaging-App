// import 'package:get/get.dart';
//
// class ChatController extends GetxController {
//
//   var selectedCategory = "Item".obs;
//   void selectCategory(String category) {
//     selectedCategory.value = category;
//   }
// }



import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedInbox = "All Inboxes"; // Default selected inbox

  void _showInboxBottomSheet(BuildContext context) {
    List<Map<String, dynamic>> inboxes = [
      {"name": "All Inboxes", "icon": Icons.all_inbox},
      {"name": "Alpha Pbx (W)", "icon": Icons.public},
      {"name": "Pbx.com.bd (Fb)", "icon": Icons.chat},
      {"name": "Sms.net.bd (W)", "icon": Icons.sms},
      {"name": "Ecard Livechat", "icon": Icons.support_agent},
      {"name": "Go Digital Bd Livechat", "icon": Icons.headset_mic},
      {"name": "Go Digital Bd (Fb)", "icon": Icons.facebook},
      {"name": "Alpha Pbx Livechat", "icon": Icons.phone},
      {"name": "Alpha.net.bd Livechat", "icon": Icons.web},
      {"name": "Lawbd Website", "icon": Icons.gavel},
      {"name": "Alpha Sms Livechat", "icon": Icons.message},
      {"name": "Alpha Sms (Fb)", "icon": Icons.facebook},
      {"name": "Ecard.com.bd (Fb)", "icon": Icons.facebook},
      {"name": "Alpha Net - Online Shop (Fb)", "icon": Icons.shopping_cart},
    ];

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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Divider(thickness: 0.7, height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: inboxes.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            inboxes[index]["name"],
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(inboxes[index]["icon"], size: 18, color: Colors.grey), // Custom icons
                              SizedBox(width: 10),
                              if (selectedInbox == inboxes[index]["name"])
                                Icon(Icons.check, color: Colors.blue, size: 18),
                            ],
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          onTap: () {
                            setState(() {
                              selectedInbox = inboxes[index]["name"];
                            });
                            Navigator.pop(context); // Close BottomSheet
                          },
                        ),
                        if (index < inboxes.length - 1) Divider(thickness: 0.5, height: 5),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inbox Filter")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showInboxBottomSheet(context),
          child: Text("Filter by Inbox"),
        ),
      ),
    );
  }
}


