import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../widgets/widgets.dart';
import 'widgets/service_card.dart';

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
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
        CarouselSlider.builder(
          itemCount: StaticUtils.servicesTitles.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ServiceCard(
              cardHeight: Dimensions.height200,
              cardWidth: Dimensions.width300 + Dimensions.width100,
              serviceIcon: StaticUtils.servicesIcons[i],
              serviceTitle: StaticUtils.servicesTitles[i],
              serviceDescription: StaticUtils.servicesDescription[i],
            ),
          ),
          options: CarouselOptions(
            viewportFraction: 0.65,
            height: width < 450 ? height * 0.4 : height * 0.4,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
        )
      ],
    );
  }
}
