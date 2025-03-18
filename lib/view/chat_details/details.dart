import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/utils/color_path.dart';
import 'package:messaging_app/view/chat_details/widget/modify_card.dart';

import '../settings/widget/customCard.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14,right: 14,top: 10),
      key: const ValueKey(2),
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        spacing: 20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ModifyCard(
                icon: CupertinoIcons.arrow_2_circlepath,
                text: 'Open',
                onPress: () {}, color: ColorPath.paleGrey, colors: ColorPath.exchangeGrey,
              ),
              ModifyCard(
                icon: Icons.downloading_outlined,
                text: 'Pending',
                onPress: () {}, color: ColorPath.greenGrey, colors: ColorPath.pendingGrey,
              ),
              ModifyCard(
                icon: Icons.ac_unit_outlined,
                text: 'Unit',
                onPress: () {}, color: ColorPath.greyShade2, colors: ColorPath.shade,
              ),
            ],
          ),
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
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(radius: 11,child: Text("L",style: TextStyle(
                            color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 13
                          ))),
                          SizedBox(width: 8),
                          Text(
                            "Liya Akter",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,fontFamily: 'Inter'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomDivider(),
                  InkWell(
                    onTap: () {},
                    child: CustomCard(
                      text: 'No Team Assigned',
                      icon: Icons.
                      shield_outlined,
                      icons: Icons.arrow_forward_ios, texst: '',
                    ),
                  ),
                  CustomDivider(),
                  InkWell(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    onTap: () {},
                    child: CustomCard(
                      text: 'No Priority Added',
                      icon: Icons.signal_cellular_alt,
                      icons: Icons.arrow_forward_ios, texst: '',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
