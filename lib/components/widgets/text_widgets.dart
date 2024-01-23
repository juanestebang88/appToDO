import 'package:flutter/material.dart';

class TextLabel {

  static Text textBold30({required String text}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text textPurpleBold24({required String text}) {
    return Text(text,
    textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple
      ),
    );
  }

  static Text text18({required String text, Color? color = Colors.black }) {
    return Text(text,
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: color,
      ),
    );
  }

}