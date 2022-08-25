import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/sections/services/services_desktop.dart';
import 'package:myportfolio/sections/services/services_mobile.dart';

import '../../controllers/controller.dart';
import '../../responsive/responsive.dart';

class Services extends StatelessWidget {
  Services({Key? key}) : super(key: key);
  final myScrollController = Get.find<SccrollController>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      key: myScrollController.servicesKey,
      desktop: ServicesDesktop(),
      tablet: ServicesMobile(),
      mobile: ServicesMobile(),
    );
  }
}
