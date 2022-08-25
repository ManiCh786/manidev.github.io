import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/sections/sections.dart';

import '../../controllers/controller.dart';
import '../../responsive/responsive.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);
  final myScrollController = Get.find<SccrollController>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      key: myScrollController.aboutKey,
      desktop: AboutDesktop(),
      tablet: AboutTablet(),
      mobile: AboutMobile(),
    );
  }
}
