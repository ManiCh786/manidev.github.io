import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../widgets/widgets.dart';
import 'widgets/service_card.dart';

class ServicesDesktop extends StatefulWidget {
  const ServicesDesktop({Key? key}) : super(key: key);

  @override
  State<ServicesDesktop> createState() => _ServicesDesktopState();
}

class _ServicesDesktopState extends State<ServicesDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          CustomTitleText(
            title: "What I can do ?",
            fontWeight: FontWeight.w100,
            fontSize: Dimensions.font45,
            textColor: Theme.of(context).focusColor,
          ),
          SpacerY(height: Dimensions.height10),
          CustomTitleText(
            title: "I may not be perfect but surely I'm of some use :)",
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
            children: StaticUtils.servicesIcons
                .asMap()
                .entries
                .map(
                  (e) => ServiceCard(
                    serviceIcon: StaticUtils.servicesIcons[e.key],
                    serviceTitle: StaticUtils.servicesTitles[e.key],
                    serviceDescription: StaticUtils.servicesDescription[e.key],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
