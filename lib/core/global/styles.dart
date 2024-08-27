import 'package:flutter/material.dart';

class SubtitleStyle extends TextStyle {
  final double size;

  const SubtitleStyle(
      {this.size = 14,
      super.color = Colors.grey,
      super.fontWeight = FontWeight.normal})
      : super(fontSize: size);
}

class TitleStyle extends TextStyle {
  final double size;

  const TitleStyle({this.size = 22, super.color = Colors.black})
      : super(
          fontWeight: FontWeight.bold,
          fontSize: size,
        );
}
