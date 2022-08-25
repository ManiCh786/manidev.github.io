import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/configs.dart';
import '../../controllers/controller.dart';
import '../../widgets/widgets.dart';

class AboutTablet extends StatelessWidget {
  AboutTablet({Key? key}) : super(key: key);
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
          fontSize: Dimensions.font40,
          textColor: Theme.of(context).focusColor,
        ),
        const SpacerY(),
        CustomTitleText(
          title: "Get to know me :)",
          fontSize: Dimensions.font20,
          textColor: themeController.isDarkOn() ? Colors.white : Colors.grey,
        ),
        SpacerY(height: Dimensions.height30),
        Image.asset(StaticUtils.mobilePhoto, height: height * 0.27),
        SizedBox(
          height: height * 0.03,
        ),
        CustomTitleText(
          title: "Who am I ?",
          fontSize: Dimensions.font30,
          textColor: Colors.red,
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
        Align(
          alignment: Alignment.topLeft,
          child: CustomTitleText(
            title: "Technologies I have worked with:",
            fontSize: Dimensions.font20,
            textColor: Colors.red,
            fontWeight: FontWeight.w100,
          ),
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
        Wrap(
          runSpacing: Dimensions.width10,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
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
        )
      ]),
    );
  }
}
