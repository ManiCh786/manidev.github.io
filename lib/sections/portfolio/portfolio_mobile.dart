import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../widgets/widgets.dart';

class PortfolioMobile extends StatelessWidget {
  const PortfolioMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
          CarouselSlider.builder(
            itemCount: ProjectUtils.banners.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ProjectCard(
                cardWidth: Dimensions.width300 + 200,
                cardHeight: Dimensions.height250 + 70,
                banner: ProjectUtils.banners[i],
                projectIcon: ProjectUtils.icons[i],
                projectLink: ProjectUtils.links[i],
                projectTitle: ProjectUtils.titles[i],
                projectDescription: ProjectUtils.description[i],
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
