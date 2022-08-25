import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({
    Key? key,
    required this.title,
    this.fontSize = 30,
    this.fontWeight = FontWeight.bold,
    this.textColor = Colors.black,
  }) : super(key: key);
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Montserrat",
        height: 1,
      ),
    );
  }
}
