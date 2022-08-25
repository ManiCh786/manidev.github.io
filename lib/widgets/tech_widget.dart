import 'package:flutter/material.dart';
import 'package:myportfolio/widgets/widgets.dart';

import '../configs/configs.dart';

class ToolTechWidget extends StatelessWidget {
  final String techName;

  const ToolTechWidget({Key? key, required this.techName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        Icons.play_arrow,
        color: Colors.red.shade900,
        size: Dimensions.font30,
      ),
      CustomTitleText(
        title: " $techName ",
        textColor: Theme.of(context).focusColor,
        fontSize: Dimensions.font20,
      ),
    ]);
  }
}
