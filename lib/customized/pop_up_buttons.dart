import 'package:flutter/material.dart';

ButtonStyle popUpButtonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
    fixedSize: MaterialStateProperty.all(const Size(135, 40)),
    elevation: MaterialStateProperty.all(0),
    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        side: BorderSide(width: 2, color: Color.fromARGB(255, 0, 0, 0)))),
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    foregroundColor: MaterialStateProperty.all(Colors.black),
  );
}
