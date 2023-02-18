import 'dart:ffi';

import 'package:flutter/material.dart';

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class Styles {
  Color get getPurpleColor => const Color.fromARGB(255, 58, 48, 189);

  static InputDecoration getTextboxInput({required String hint, required Icon icon}) => (InputDecoration(
        border: InputBorder.none,
        prefixIcon: icon,
        prefixIconColor: Styles().getPurpleColor,
        hintText: hint,
        fillColor: Color.fromARGB(255, 230, 229, 229),
        filled: true,
      ));
}
