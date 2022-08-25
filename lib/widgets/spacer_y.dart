import 'package:flutter/material.dart';

class SpacerY extends StatelessWidget {
  const SpacerY({
    Key? key,
    this.height = 15.0,
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
