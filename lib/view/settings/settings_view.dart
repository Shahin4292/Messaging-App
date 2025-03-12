import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messaging_app/view/settings/widget/customCard.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int? selectedTileIndex;
  String selectedLanguage = "English";
  void _showLanguageBottomSheet(BuildContext context) {
    List<String> languages = [
      "Afrikaans",
      "Arabic",
      "Bahasa Indonesia",
      "Catalan",
      "Czech",
      "Danish",
      "German",
      "English",
      "Greek",
      "Spanish",
      "Farsi"
    ];

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Set Language",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.grey),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            languages[index],
                            style: TextStyle(fontSize: 14),
                          ),
                          trailing: selectedLanguage == languages[index]
                              ? Icon(Icons.check, color: Colors.blue, size: 18)
                              : null,
                          onTap: () {
                            setState(() {
                              selectedLanguage = languages[index];
                            });
                            Navigator.pop(context); // Close BottomSheet
                          },
                        ),
                        if (index < languages.length - 1) Padding(
                          padding: const EdgeInsets.only(left: 18),
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

  // void _showLanguageBottomSheet(BuildContext context) {
  //   List<String> languages = [
  //     "Afrikaans",
  //     "Arabic",
  //     "Bahasa Indonesia",
  //     "Catalan",
  //     "Czech",
  //     "Danish",
  //     "German",
  //     "English",
  //     "Greek",
  //     "Spanish",
  //     "Farsi"
  //   ];
  //
  //   showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (BuildContext context) {
  //       return Column(
  //         // mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             "Set Language",
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
  //           ),
  //           Expanded(
  //             child: ListView.builder(
  //               itemCount: languages.length,
  //               itemBuilder: (context, index) {
  //                 return Column(
  //                   children: [
  //                     ListTile(
  //                       title: Text(languages[index],style: TextStyle(fontSize: 14),),
  //                       trailing: selectedLanguage == languages[index]
  //                           ? Icon(Icons.check, color: Colors.blue)
  //                           : null,
  //                       onTap: () {
  //                         setState(() {
  //                           selectedLanguage = languages[index];
  //                         });
  //                         Navigator.pop(context);
  //                       },
  //                     ),
  //                     // if (index < languages.length - 1) Divider(),
  //                   ],
  //                 );
  //               },
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15),
              Text(
                'Open Bottom Sheet',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                "Switch Account",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
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
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sineris",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Administrator",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      if (selectedTileIndex == 0)
                        Icon(Icons.check, size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alpha Net",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Administrator",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      if (selectedTileIndex == 1)
                        Icon(Icons.check, size: 20, color: Colors.blue),
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
  void _showSetIconBottomSheet(BuildContext context) {
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
                "Set yourself as",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
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
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(backgroundColor: Colors.grey,radius: 6),
                      Text(
                        "Online",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      if (selectedTileIndex == 0)
                        Icon(Icons.check, size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
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
                    spacing: 10,
                    children: [
                      CircleAvatar(backgroundColor: Colors.amberAccent,radius: 6),
                      Text(
                        "Busy",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      if (selectedTileIndex == 1)
                        Icon(Icons.check, size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
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
                    spacing: 10,
                    children: [
                      CircleAvatar(backgroundColor: Colors.red,radius: 6),
                      Text(
                        "Offline",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      if (selectedTileIndex == 2)
                        Icon(Icons.check, size: 20, color: Colors.blue),
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 45,
                    child: Text(
                      "RI",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    right: 3,
                    child: GestureDetector(
                      onTap: (){
                        _showSetIconBottomSheet(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0xfff808080),
                        radius: 9,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Riaz",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text(
                "mdriaz@alpha.net.bd",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  Text(
                    "Preferences",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomCard(
                            text: 'Set availability',
                            icon: Icons.sync_alt,
                            onPressed: () => _showBottomSheet(context),
                            icons: Icons.arrow_forward_ios
                          ),
                          CustomDivider(),
                          CustomCard(
                              text: 'Notifications',
                              icon: Icons.notifications_none,
                              onPressed: () => _showBottomSheet(context),
                              icons: Icons.arrow_forward_ios
                          ),
                          CustomDivider(),
                          CustomCard(
                              text: 'Change Language',
                              icon: Icons.language,
                              onPressed: () => _showLanguageBottomSheet(context),
                              icons: Icons.arrow_forward_ios
                          ),
                          CustomDivider(),
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
                              size: 18,
                            ),
                            title: const Text(
                              "Switch Account",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Alpha Net",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 11,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13,
                                  color: Colors.black38,
                                ),
                              ],
                            ),
                            onTap: () {
                              debugPrint('Switch Account tapped');
                              _sortBottomSheet(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Support",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  Card(
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
                            size: 18,
                          ),
                          title: const Text(
                            "Read Docs",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
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
                            Icons.chat_bubble_outline,
                            color: Colors.black54,
                            size: 18,
                          ),
                          title: const Text(
                            "Chat with us",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                            color: Colors.black38,
                          ),
                          onTap: () {
                            debugPrint('Notifications tapped');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.grey.shade200,
                  fixedSize: Size(MediaQuery.sizeOf(context).width, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfffda375a),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Alpha Net Bangladesh",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
