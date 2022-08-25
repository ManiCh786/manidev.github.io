import 'package:flutter/material.dart';
import 'package:myportfolio/widgets/widgets.dart';

import '../configs/configs.dart';

class ProjectCard extends StatefulWidget {
  final String? banner;
  final String? projectLink;
  final String? projectIcon;
  final String projectTitle;
  final String projectDescription;
  final IconData? projectIconData;
  final double cardHeight;
  final double cardWidth;

  const ProjectCard({
    Key? key,
    this.banner,
    this.projectIcon,
    this.projectLink,
    this.projectIconData,
    required this.projectTitle,
    required this.projectDescription,
    required this.cardHeight,
    required this.cardWidth,
  }) : super(key: key);
  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      onTap: widget.projectLink == null ? () {} : () {},
      // : () => openURL(
      //       widget.projectLink!,
      //     ),
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
          color: themeController.isDarkOn() ? Colors.grey[900] : Colors.white,
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
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.projectIcon != null
                    ? (width > 1135 || width < 950)
                        ? Image.asset(
                            widget.projectIcon!,
                            height: height * 0.05,
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                widget.projectIcon!,
                                height: height * 0.03,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              CustomTitleText(
                                title: widget.projectTitle,
                                fontWeight: FontWeight.w100,
                                fontSize: Dimensions.font15,
                                textColor: themeController.isDarkOn()
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ],
                          )
                    : Container(),
                widget.projectIconData != null
                    ? Icon(
                        widget.projectIconData,
                        color: Color.fromARGB(255, 148, 10, 0),
                        size: height * 0.1,
                      )
                    : Container(),
                (width > 1135 || width < 950)
                    ? SizedBox(
                        height: height * 0.02,
                      )
                    : const SizedBox(),
                (width > 1135 || width < 950)
                    ? CustomTitleText(
                        title: widget.projectTitle,
                        fontWeight: FontWeight.w100,
                        fontSize: Dimensions.font15,
                        textColor: themeController.isDarkOn()
                            ? Colors.white
                            : Colors.black,
                      )
                    : Container(),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  widget.projectDescription,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: FittedBox(
                fit: BoxFit.fill,
                child: widget.banner != null
                    ? Image.asset(
                        widget.banner!,
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
