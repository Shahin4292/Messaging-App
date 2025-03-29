import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/res/components/modify_text.dart';
import 'package:messaging_app/utils/color_path.dart';
import 'package:messaging_app/view/settings/widget/customCard.dart';
import 'package:messaging_app/viewModel/settings_controller/settings_controller.dart';


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
        forceMaterialTransparency: true,
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
                    backgroundColor: ColorPath.paleGrey,
                    radius: 45,
                    child: Text(
                      "RI",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.grey,
                        fontFamily: 'InterB'
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
                    fontFamily: 'InterB'
                ),
              ),
              Text(
                "mdriaz@alpha.net.bd",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.grey,
                    fontFamily: 'Inter'
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
                          InkWell(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14),
                            ),
                            onTap: () {},
                            child: CustomCard(
                              text: 'Set availability',
                              icon: Icons.sync_alt,
                              icons: Icons.arrow_forward_ios, texst: '',
                            ),
                          ),
                          CustomDivider(),
                          InkWell(
                            onTap: () {},
                            child: CustomCard(
                              text: 'Notifications',
                              icon: Icons.notifications_none,
                              icons: Icons.arrow_forward_ios, texst: '',
                            ),
                          ),
                          CustomDivider(),
                          InkWell(
                            onTap:
                                () => settingsController
                                    .showLanguageBottomSheet(context),
                            child: CustomCard(
                              text: 'Change Language',
                              icon: Icons.language,
                              icons: Icons.arrow_forward_ios, texst: 'English',
                            ),
                          ),
                          CustomDivider(),
                          InkWell(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                            onTap: () => settingsController.sortBottomSheet(context),
                            child: CustomCard(
                              text: 'Switch Account',
                              icon: Icons.switch_account,
                              icons: Icons.arrow_forward_ios, texst: 'Alpha Net',
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
                        InkWell(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          onTap: () {},
                          child: CustomCard(
                            text: 'Read Docs',
                            icon: Icons.sync_alt,
                            icons: Icons.arrow_forward_ios, texst: '',
                          ),
                        ),
                        CustomDivider(),
                        InkWell(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(14),
                            bottomRight: Radius.circular(14),
                          ),
                          onTap: (){},
                          child: CustomCard(
                            text: 'Chat with us',
                            icon: Icons.chat_bubble_outline,
                            icons: Icons.arrow_forward_ios, texst: '',
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
                // onPressed: () => settingsController.logout(context),
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorPath.shade,
                    fontFamily: "InterB"
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
                  fontFamily: 'Inter'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
