import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/components/modify_text.dart';
import '../../res/repository/language_list.dart';
import '../../view/settings/widget/language_selectable_tile.dart';
import '../../view/settings/widget/selectable_status_title.dart';
import '../../view/settings/widget/selectable_tile.dart';

class SettingsController extends GetxController {
  int selectedTileIndex = 0;
  String selectedLanguage = "English";

  void showLanguageBottomSheet(BuildContext context) {
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
              ModifyText(title: "Set Language"),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        LanguageSelectableTile(inbox: languages[index],
                          isSelected: selectedLanguage == languages[index]["name"], onTap: () {
                            selectedLanguage = languages[index]["name"];
                            Navigator.pop(context);
                          },),
                        if (index < languages.length - 1) Padding(
                          padding: const EdgeInsets.only(left: 15),
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

  void sortBottomSheet(BuildContext context) {
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
              ModifyText(title: 'Switch Account'),
              SelectableTile(
                name: 'Sineris',
                role: 'Administrator',
                selectedTileIndex: selectedTileIndex,
                index: 0,
                onTap: (index) {
                  selectedTileIndex = index;
                },
              ),
              CustomPadding(),
              SelectableTile(
                name: 'Alpha Net',
                role: 'Administrator',
                selectedTileIndex: selectedTileIndex,
                index: 1,
                onTap: (index) {
                  selectedTileIndex = index;
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showSetIconBottomSheet(BuildContext context) {
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
              ModifyText(title: 'Set yourself as'),
              SelectableStatusTile(
                label: 'Online',
                selectedTileIndex: selectedTileIndex,
                index: 0,
                onTap: (index) {
                  selectedTileIndex = index;
                },
                color: Colors.amberAccent,
              ),
              CustomPadding(),
              SelectableStatusTile(
                label: 'Busy',
                selectedTileIndex: selectedTileIndex,
                index: 1,
                onTap: (index) {
                  selectedTileIndex = index;
                },
                color: Colors.grey,
              ),
              CustomPadding(),
              SelectableStatusTile(
                label: 'Offline',
                selectedTileIndex: selectedTileIndex,
                index: 2,
                onTap: (index) {
                  selectedTileIndex = index;
                },
                color: Colors.red,
              ),
            ],
          ),
        );
      },
    );
  }
}
