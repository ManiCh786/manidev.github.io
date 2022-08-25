import 'package:flutter/widgets.dart';

class HeaderItem {
  final String text;
  final VoidCallback onTap;
  final bool isButton;
  final IconData icon;
  HeaderItem(
      {required this.text,
      required this.icon,
      required this.onTap,
      this.isButton = false});
}
