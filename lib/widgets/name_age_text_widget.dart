import 'package:flutter/material.dart';

import '../configs/configs.dart';

class NameAgeAboutWidget extends StatelessWidget {
  const NameAgeAboutWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: title,
        style: TextStyle(
          color: Theme.of(context).focusColor,
          fontFamily: "Raleway",
          fontSize: Dimensions.font20,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(
          text: subtitle,
          style: TextStyle(
            color: Theme.of(context).focusColor,
            fontFamily: "Raleway",
            fontSize: Dimensions.font20,
            fontWeight: FontWeight.w100,
          )),
    ]));
  }
}
