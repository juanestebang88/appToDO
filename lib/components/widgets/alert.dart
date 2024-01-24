import 'package:flutter/material.dart';
import 'package:flutter_todo_app_r5/components/components.dart';


class AlertCustom {
  static Future<dynamic> simple({required BuildContext context, required String text}) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextLabel.textPurpleBold(text: 'Alerta'),
            content: TextLabel.textNormal(text: text),
            actions: <Widget>[
              TextButton(
                onPressed: ()=> Navigator.of(context).pop(),
                child:TextLabel.textNormal(text: 'Aceptar', color: Colors.deepPurple),
              ),
            ],
          );
        },
      );
    }

  static Future<dynamic> yesOrNot({
    required BuildContext context,
    required String text,
    required Function()? functionYes}) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextLabel.textPurpleBold(text: 'Alerta'),
            content: TextLabel.textNormal(text: text),
            actions: <Widget>[
              TextButton(
                onPressed: ()=> Navigator.of(context).pop(),
                child:TextLabel.textNormal(text: 'Cancelar', color: Colors.deepPurple),
              ),
              TextButton(
                onPressed: functionYes,
                child:TextLabel.textNormal(text: 'Aceptar', color: Colors.deepPurple),
              ),
            ],
          );
        },
      );
    } 
}