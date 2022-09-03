import 'package:flutter/material.dart';
import 'package:myportfolio/widgets/widgets.dart';

import '../configs/configs.dart';

class VideoCard extends StatefulWidget {
  final double cardHeight;
  final double cardWidth;
  final String? projectLink;
  final String projectTitle;

  const VideoCard(
      {Key? key,
      required this.cardHeight,
      required this.cardWidth,
      this.projectLink,
      required this.projectTitle})
      : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.projectLink == null
            ? () {}
            : () => openUrl(
                  widget.projectLink!,
                ),
        onHover: (isHovering) {
          if (isHovering) {
            setState(() {
              isHover = true;
            });
          } else {
            setState(() {
              isHover = false;
            });
          }
        },
        child: Container(
            padding: EdgeInsets.all(Dimensions.width20),
            width: widget.cardWidth,
            // width: Dimensions.width300 + 200,
            // height: Dimensions.height250 + 70,
            height: widget.cardHeight,
            decoration: BoxDecoration(
              color:
                  themeController.isDarkOn() ? Colors.grey[900] : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: isHover
                  ? [
                      BoxShadow(
                        color: Theme.of(context).focusColor,
                        blurRadius: 12.0,
                        offset: const Offset(0.0, 0.0),
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withAlpha(100),
                        blurRadius: 12.0,
                        offset: const Offset(0.0, 0.0),
                      )
                    ],
            ),
            child: Stack(fit: StackFit.expand, children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Center(
                  child: CustomTitleText(
                    title: widget.projectTitle,
                    fontWeight: FontWeight.w100,
                    fontSize: Dimensions.font15,
                    textColor: themeController.isDarkOn()
                        ? Colors.white
                        : Colors.black,
                  ),
                )
              ])
            ])));
  }
}
