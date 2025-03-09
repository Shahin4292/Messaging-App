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
              CircleAvatar(
                radius: 35,
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
                              size: 20,
                            ),
                            title: const Text(
                              "Set availability",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
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
                              Icons.notifications_none,
                              color: Colors.black54,
                              size: 20,
                            ),
                            title: const Text(
                              "Notifications",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.black38,
                            ),
                            onTap: () {
                              debugPrint('Notifications tapped');
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 55),
                            child: Divider(height: 1, color: Colors.grey[300]),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.language,
                              color: Colors.black54,
                              size: 20,
                            ),
                            title: const Text(
                              "Change Language",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "English",
                                  style: TextStyle(color: Colors.black54, fontSize: 13),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.black38,
                                ),
                              ],
                            ),
                            onTap: () {
                              debugPrint('Change Language tapped');
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 55),
                            child: Divider(height: 1, color: Colors.grey[300]),
                          ),

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
                              size: 20,
                            ),
                            title: const Text(
                              "Switch Account",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Alpha Net",
                                  style: TextStyle(color: Colors.black54, fontSize: 13),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.black38,
                                ),
                              ],
                            ),
                            onTap: () {
                              debugPrint('Switch Account tapped');
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
                            size: 20,
                          ),
                          title: const Text(
                            "Read Docs",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
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
                            Icons.chat,
                            color: Colors.black54,
                            size: 20,
                          ),
                          title: const Text(
                            "Chat with us",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
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
