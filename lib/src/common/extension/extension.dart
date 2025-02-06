import 'package:flutter/material.dart';

extension SixedBoxExtension on Widget {
  Widget horizontalBox(double width) {
    return SizedBox(
      width: width,
      child: this,
    );
  }

  Widget verticalBox(double height) {
    return SizedBox(
      height: height,
      child: this,
    );
  }
}
