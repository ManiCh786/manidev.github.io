import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolio/widgets/widgets.dart';
import '../configs/configs.dart';
import '../responsive/responsive.dart';

class HomeIconButtonsRow extends StatelessWidget {
  const HomeIconButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeIconButton(
          icon: FontAwesomeIcons.facebook,
          onTap: () => openUrl(StaticUtils.socialLinks[0]),
          iconSize: Responsive.isDesktop(context)
              ? Dimensions.iconSize45
              : Dimensions.iconSize30,
        ),
        HomeIconButton(
          icon: FontAwesomeIcons.instagram,
          onTap: () => openUrl(StaticUtils.socialLinks[1]),
          iconSize: Responsive.isDesktop(context)
              ? Dimensions.iconSize45
              : Dimensions.iconSize30,
        ),
        HomeIconButton(
          icon: FontAwesomeIcons.twitter,
          onTap: () => openUrl(StaticUtils.socialLinks[2]),
          iconSize: Responsive.isDesktop(context)
              ? Dimensions.iconSize45
              : Dimensions.iconSize30,
        ),
        HomeIconButton(
          icon: FontAwesomeIcons.github,
          onTap: () => openUrl(StaticUtils.socialLinks[3]),
          iconSize: Responsive.isDesktop(context)
              ? Dimensions.iconSize45
              : Dimensions.iconSize30,
        ),
      ],
    );
  }
}
