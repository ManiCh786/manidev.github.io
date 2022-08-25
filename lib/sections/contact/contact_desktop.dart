import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../widgets/widgets.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: Dimensions.height10,
          left: Dimensions.width10,
          right: Dimensions.width10),
      child: Column(
        children: [
          CustomTitleText(
            title: "\Get in Touch",
            fontWeight: FontWeight.w100,
            fontSize: Dimensions.font45,
            textColor: Theme.of(context).focusColor,
          ),
          SpacerY(height: Dimensions.height10),
          CustomTitleText(
            title: "Let's build something together :)\n\n",
            fontSize: Dimensions.font20,
            fontWeight: FontWeight.w200,
            textColor: themeController.isDarkOn() ? Colors.white : Colors.grey,
          ),
          SpacerY(height: Dimensions.height30),
          Wrap(
              alignment: WrapAlignment.center,
              runSpacing: Dimensions.width15,
              spacing: Dimensions.height20,
              children: StaticUtils.contactIcon
                  .asMap()
                  .entries
                  .map((e) => ProjectCard(
                        cardHeight: Dimensions.height250,
                        cardWidth: Dimensions.width300 + 100,
                        projectIconData: e.value,
                        projectTitle: StaticUtils.titles[e.key],
                        projectDescription: StaticUtils.details[e.key],
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
