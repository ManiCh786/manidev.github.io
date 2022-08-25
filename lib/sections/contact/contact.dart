import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/responsive/responsive.dart';
import 'package:myportfolio/sections/contact/contact_desktop.dart';
import 'package:myportfolio/sections/contact/contact_mobile.dart';

import '../../controllers/controller.dart';

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);
  final myScrollController = Get.find<SccrollController>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
        key: myScrollController.contactKey,
        desktop: const ContactDesktop(),
        tablet: const ContactMobile(),
        mobile: const ContactMobile());
  }
}
