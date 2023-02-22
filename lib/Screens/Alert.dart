import 'package:flutter/material.dart';

class Alerts{
  
  //late final void Function() actions;
  List<ElevatedButton>? actions;
  Alerts({required this.context});

  String? text;
  BuildContext context;
  void setAlertParams({String? text, int? buttonCount}){

    this.text=text;

    if(buttonCount!>0){
      actions= List.generate(buttonCount, (index){
        return ElevatedButton(onPressed: (){}, child: Text(""));
      });
    }
  }

  void showAlert(){
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            content: text != null ? Text(text!) : null,
            actions: actions,
          );
        });
  }
}