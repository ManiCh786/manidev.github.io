import 'package:flutter/material.dart';

import '../configs/configs.dart';

class HomeIconButton extends StatelessWidget {
  const HomeIconButton({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final double iconSize;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width15, vertical: Dimensions.height10),
      child: IconButton(
        icon: Icon(
          icon,
          color: Theme.of(context).focusColor,
        ),
        iconSize: iconSize,
        hoverColor: Colors.red,
        tooltip: "Connect with me",
        onPressed: onTap,
      ),
    );
  }
}
