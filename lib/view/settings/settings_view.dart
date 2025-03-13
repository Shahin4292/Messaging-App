import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:messaging_app/res/components/modify_text.dart';
import 'package:messaging_app/utils/color_path.dart';
import 'package:messaging_app/view/settings/widget/customCard.dart';
import 'package:messaging_app/view/settings/widget/custom_list_tile.dart';
import 'package:messaging_app/view/settings/widget/selectable_status_title.dart';
import 'package:messaging_app/view/settings/widget/selectable_tile.dart';
import 'package:messaging_app/viewModel/settings_controller/settings_controller.dart';

import '../../res/repository/language_list.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                    backgroundColor: Color(0xffff1f1f1),
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
                      onTap: () {
                        settingsController.showSetIconBottomSheet(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: ColorPath.green,
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
                  ModifyText(title: "Preferences"),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomCard(
                            text: 'Set availability',
                            icon: Icons.sync_alt,
                            onPressed: () {},
                            icons: Icons.arrow_forward_ios,
                          ),
                          CustomDivider(),
                          CustomCard(
                            text: 'Notifications',
                            icon: Icons.notifications_none,
                            onPressed: () {},
                            icons: Icons.arrow_forward_ios,
                          ),
                          CustomDivider(),
                          CustomCard(
                            text: 'Change Language',
                            icon: Icons.language,
                            onPressed:
                                () => settingsController
                                    .showLanguageBottomSheet(context),
                            icons: Icons.arrow_forward_ios,
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
                              settingsController.sortBottomSheet(context);
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
                  ModifyText(title: "Support"),
                  Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomListTile(
                          leadingIcon: Icons.sync_alt,
                          title: 'Read Docs',
                          trailingIcon: Icons.arrow_forward_ios,
                          onTap: () {},
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Divider(height: 1, color: Colors.grey[300]),
                        ),
                        CustomListTile(
                          leadingIcon: Icons.chat_bubble_outline,
                          title: 'Chat with us',
                          trailingIcon: Icons.arrow_forward_ios,
                          onTap: () {},
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
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
                  fixedSize: Size(MediaQuery.sizeOf(context).width, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorPath.shade,
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
