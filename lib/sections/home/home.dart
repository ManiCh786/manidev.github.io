import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/responsive/responsive.dart';
import 'package:myportfolio/sections/sections.dart';
import 'package:myportfolio/widgets/widgets.dart';

import '../../controllers/controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final myScrollController = Get.find<SccrollController>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
        key: myScrollController.homeKey,
        desktop: const HomeDesktop(),
        tablet: const HomeTablet(),
        mobile: const HomeMobile());
  }
}
