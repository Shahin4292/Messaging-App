import 'package:flutter/material.dart';
import 'package:messaging_app/view/chat_details/chat_details.dart';

import '../../utils/color_path.dart';
import '../chat_details/details.dart';

class SlideView extends StatefulWidget {
  final String? sender;
  final String? message;
  final String? timestamp;
  final bool? isDeleted;
  final IconData? additionalIcon;
  final String? additionalText;
  final String? imageUrl;
  final IconData? icon;

  const SlideView({
    super.key,
    this.sender,
    this.message,
    this.timestamp,
    this.isDeleted,
    this.additionalIcon,
    this.additionalText,
    this.imageUrl,
    this.icon,
  });

  @override
  SlideViewState createState() => SlideViewState();
}

class SlideViewState extends State<SlideView> {
  int _currentIndex = 0;
  void togglePage() {
    setState(() {
      _currentIndex = _currentIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        actions: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: ColorPath.greyShade2,
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorPath.greyShade,
                        backgroundImage:
                            widget.imageUrl != null
                                ? AssetImage(widget.imageUrl!)
                                : null,
                        child:
                            widget.imageUrl == null
                                ? (widget.icon != null
                                    ? Icon(widget.icon, color: ColorPath.grey)
                                    : Text(
                                      widget.sender!
                                          .split(" ")
                                          .map((e) => e[0])
                                          .take(2)
                                          .join()
                                          .toUpperCase(),
                                      style: TextStyle(
                                        color: ColorPath.grey,
                                        fontFamily: "InterB",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ))
                                : null,
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.sender!,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.task_alt_outlined,
                          size: 22,
                          color: ColorPath.greyShade2,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          togglePage();
                        },
                        child: Icon(
                          Icons.more_horiz,
                          size: 20,
                          color: ColorPath.greyShade2,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: Colors.grey.shade300),
              ],
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0 && _currentIndex == 0) {
            setState(() {
              _currentIndex = 1;
            });
          } else if (details.primaryVelocity! > 0 && _currentIndex == 1) {
            setState(() {
              _currentIndex = 0;
            });
          }
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final slideAnimation = Tween<Offset>(
              begin:
                  _currentIndex == 1
                      ? const Offset(1.0, 0.0)
                      : const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(position: slideAnimation, child: child);
          },
          child: _currentIndex == 0 ? const ChatDetails() : const DetailsView(),
        ),
      ),
    );
  }
}

