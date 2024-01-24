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
        margin: const EdgeInsets.symmetric(vertical: 20.0 ),
        width: MediaQuery.of(context).size.width *0.85,
        height: 50.0,
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Center(
          child: TextLabel.textNormal(
            text: widget.text, 
            color: Colors.white
          ),
        ),
      ),
    );
  }
}

class ButtonCardFinish extends StatelessWidget {
  const ButtonCardFinish({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.only(top: 10.0 ),
        height: 30.0,
        decoration: const BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: TextLabel.textNormal(
              text: 'Completada', 
              color: Colors.white,
              size: 12.0
            ),
          ),
        ),
      ),
    );
  }
}