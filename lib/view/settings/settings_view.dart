import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
              CircleAvatar(
                radius: 25,
                child: Text(
                  "RI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
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
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                      // color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () {
                                _showBottomSheet(context);
                              },
                              child: Row(
                                spacing: 6,
                                children: [
                                  Icon(Icons.swap_horiz),
                                  Text(
                                    "Set availability",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, size: 15),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Divider(color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.all(6),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () {},
                              child: Row(
                                spacing: 6,
                                children: [
                                  Icon(Icons.notifications),
                                  Text(
                                    "Notifications",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, size: 15),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Divider(color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.all(6),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () {},
                              child: Row(
                                spacing: 6,
                                children: [
                                  Icon(Icons.translate_outlined),
                                  Text(
                                    "Change Language",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "English",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 13),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Divider(color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.all(6),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () {},
                              child: Row(
                                spacing: 6,
                                children: [
                                  Icon(Icons.swap_horiz),
                                  Text(
                                    "Switch Account",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Alpha Net",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios, size: 15),
                                ],
                              ),
                            ),
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
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(6),
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: Row(
                              spacing: 6,
                              children: [
                                Icon(Icons.swap_horiz),
                                Text(
                                  "Read Docs",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios, size: 15),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Divider(color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(6),
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: Row(
                              spacing: 6,
                              children: [
                                Icon(Icons.chat,size: 20,),
                                Text(
                                  "Chat with us",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios, size: 15),
                              ],
                            ),
                          ),
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
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Chatwoot self-hosted",
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
