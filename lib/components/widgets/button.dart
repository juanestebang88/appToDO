import 'package:flutter/material.dart';
import 'package:flutter_todo_app_r5/components/components.dart';

class ButtonCustom extends StatefulWidget {
  const ButtonCustom({
    required this.text,
    required this.currentStateValidate, 
    this.function, 
    super.key, 
  });
  final Function()? function;
  final String text;
  final bool currentStateValidate;

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    final Color colorButton = widget.currentStateValidate?Colors.deepPurple: Colors.grey;
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 50.0 ),
        width: MediaQuery.of(context).size.width *0.85,
        height: 50.0,
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Center(
          child: TextLabel.text18(
            text: widget.text, 
            color: Colors.white
          ),
        ),
      ),
    );
  }
}