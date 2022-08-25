import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/configs.dart';
import '../../controllers/controller.dart';
import '../../widgets/widgets.dart';

class AboutDesktop extends StatelessWidget {
  AboutDesktop({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20, vertical: Dimensions.height20),
      child: Column(children: [
        CustomTitleText(
          title: "About Me",
          fontWeight: FontWeight.w100,
          fontSize: Dimensions.font45,
          textColor: Theme.of(context).focusColor,
        ),
        SpacerY(height: Dimensions.height10),
        CustomTitleText(
          title: "Get to know me :)",
          fontSize: Dimensions.font20,
          fontWeight: FontWeight.w200,
          textColor: themeController.isDarkOn() ? Colors.white : Colors.grey,
        ),
        SpacerY(height: Dimensions.height30),
        Padding(
          padding: EdgeInsets.only(right: Dimensions.width30),
          child: Row(
            children: [
              Expanded(
                child:
                    Image.asset(StaticUtils.maniColorBg, height: height * 0.7),
              ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  padding: EdgeInsets.only(
                      left: width < 1230 ? 25.0 : 0,
                      right: width > 1230 ? 10 : 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTitleText(
                          title: "Who am I ?",
                          fontWeight: FontWeight.w200,
                          fontSize: Dimensions.font30,
                          textColor: Colors.red.shade900,
                        ),
                        const SpacerY(),
                        CustomTitleText(
                          title: StaticUtils.aboutMeHeadline,
                          fontSize: Dimensions.font26,
                          textColor: Theme.of(context).focusColor,
                        ),
                        const SpacerY(),
                        Text(
                          StaticUtils.aboutMeDetail,
                          style: TextStyle(
                            height: 2,
                            letterSpacing: 1.1,
                            fontFamily: 'Montserrat',
                            fontSize: Dimensions.font20,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SpacerY(),
                        Divider(
                          color: Colors.grey[800],
                          thickness: 1,
                        ),
                        const SpacerY(),
                        CustomTitleText(
                          title: "Technologies I have worked with:",
                          fontSize: Dimensions.font20,
                          textColor: Colors.red.shade900,
                          fontWeight: FontWeight.w100,
                        ),
                        const SpacerY(),
                        Row(
                            children: StaticUtils.kTools
                                .map((e) => ToolTechWidget(techName: e))
                                .toList()),
                        const SpacerY(),
                        Divider(
                          color: Colors.grey[800],
                          thickness: 1,
                        ),
                        const SpacerY(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const NameAgeAboutWidget(
                                    title: "Name: ",
                                    subtitle: " Abdur Rehman",
                                  ),
                                  SpacerY(height: Dimensions.height20),
                                  const NameAgeAboutWidget(
                                    title: "Age: ",
                                    subtitle: " 23",
                                  ),
                                ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const NameAgeAboutWidget(
                                  title: "Email: ",
                                  subtitle: " mani.gujjar000001@gmail.com",
                                ),
                                SpacerY(height: Dimensions.height20),
                                const NameAgeAboutWidget(
                                  title: "From: ",
                                  subtitle: " Gujrat,PK",
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: width < 1230 ? width * 0.05 : width * 0.1,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
