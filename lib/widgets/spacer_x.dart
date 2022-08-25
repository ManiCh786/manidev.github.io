import 'package:flutter/material.dart';

class SpacerX extends StatelessWidget {
  const SpacerX({
    Key? key,
    this.width = 15.0,
  }) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
