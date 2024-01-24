import 'package:flutter/material.dart';

class TextLabel {

  static Text textBold({
    required String text,
    Color? color = Colors.black,
    double? size = 30.0}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color
      ),
    );
  }

  static Text textPurpleBold({
    required String text,
    double? size = 24.0}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple
      ),
    );
  }

  static Text textNormal({
    required String text,
    Color? color = Colors.black,
    double? size = 18.0}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}