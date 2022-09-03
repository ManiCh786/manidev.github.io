import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../widgets/widgets.dart';

class ContactMobile extends StatelessWidget {
  const ContactMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
          CarouselSlider.builder(
            itemCount: StaticUtils.contactIcon.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ProjectCard(
                cardHeight: Dimensions.height200,
                cardWidth: Dimensions.width300 + Dimensions.width100,
                projectIconData: StaticUtils.contactIcon[i],
                projectTitle: StaticUtils.titles[i],
                projectDescription: StaticUtils.details[i],
              ),
            ),
            options: CarouselOptions(
              pauseAutoPlayOnTouch: true,
              height: height * 0.4,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false,
            ),
          ),
        ],
      ),
    );
  }
}
