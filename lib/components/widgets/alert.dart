import 'package:flutter/material.dart';
import 'package:flutter_todo_app_r5/components/components.dart';


class AlertCustom {
  static Future<dynamic> simple({required BuildContext context, required String text}) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextLabel.textPurpleBold24(text: 'Alerta'),
            content: TextLabel.text18(text: text),
            actions: <Widget>[
              TextButton(
                onPressed: ()=> Navigator.of(context).pop(),
                child:TextLabel.text18(text: 'Aceptar', color: Colors.deepPurple),
              ),
            ],
          );
        },
      );
    }
  
}