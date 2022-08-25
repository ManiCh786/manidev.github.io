import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/sections/portfolio/portfolio_desktop.dart';
import 'package:myportfolio/sections/portfolio/portfolio_mobile.dart';

import '../../controllers/controller.dart';
import '../../responsive/responsive.dart';

class Portfolio extends StatelessWidget {
  Portfolio({Key? key}) : super(key: key);
  final myScrollController = Get.find<SccrollController>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      key: myScrollController.portfolioKey,
      desktop: const PortfolioDesktop(),
      tablet: const PortfolioMobile(),
      mobile: const PortfolioMobile(),
    );
  }
}
