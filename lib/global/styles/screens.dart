import 'package:flutter/material.dart';

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class Styles {
  Color get getPurpleColor => const Color.fromARGB(255, 58, 48, 189);
  Color get getTextBoxColor => const Color.fromARGB(255, 230, 229, 229);

  //callback
  static InputDecoration getTextboxInput({required String hint, required Icon prefixIcon, Icon? suffixIcon, bool passwordVisible=true}) => (
    InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))
        ),
        prefixIcon: prefixIcon,
        // suffixIcon: suffixIcon!=null?(
        //   InkWell(
        //     onTap: (){
        //       passwordVisible=!passwordVisible;
        //     },
        //     child: passwordVisible?suffixIcon:Icon(Icons.not_interested_sharp),
        //   )
        // ):null,
        prefixIconColor: Styles().getPurpleColor,
        hintText: hint,
        fillColor: Color.fromARGB(255, 230, 229, 229),
        filled: true,
      ));
}
