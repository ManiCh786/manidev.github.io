import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../widgets/widgets.dart';

class PortfolioDesktop extends StatelessWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          CustomTitleText(
            title: "\nPortfolio",
            fontWeight: FontWeight.w100,
            fontSize: Dimensions.font45,
            textColor: Theme.of(context).focusColor,
          ),
          SpacerY(height: Dimensions.height10),
          CustomTitleText(
            title: "Here are few samples of my previous work :)\n\n",
            fontSize: Dimensions.font20,
            fontWeight: FontWeight.w200,
            textColor: themeController.isDarkOn() ? Colors.white : Colors.grey,
          ),
          SpacerY(height: Dimensions.height30),
          Wrap(
            spacing: width * 0.05,
            runSpacing: height * 0.05,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: ProjectUtils.banners
                .asMap()
                .entries
                .map(
                  (e) => ProjectCard(
                    cardWidth: Dimensions.width300 + Dimensions.width100,
                    cardHeight: Dimensions.height250 + Dimensions.height10,
                    banner: e.value,
                    projectTitle: ProjectUtils.titles[e.key],
                    projectDescription: ProjectUtils.description[e.key],
                    projectIcon: ProjectUtils.icons[e.key],
                    projectLink: ProjectUtils.links[e.key],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
