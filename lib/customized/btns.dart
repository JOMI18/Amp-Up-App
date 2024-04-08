import 'package:flutter/material.dart';

class Btns {
  ColorScheme? colorScheme;
  Btns();

  Widget btn(context, title, func) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            fixedSize: const Size(350, 60),
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.white,

            // disabledForegroundColor: Colors.black,
            // disabledBackgroundColor:
            //     colorScheme.primary.withOpacity(0.6),

            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),

        // onPressed: null,
        onPressed: func,
        child: Text("$title",
            style: const TextStyle(
              fontWeight: FontWeight.w800,
            )));
  }

  Widget textBtn(context, title, func) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            fixedSize: const Size(120, 50),
            foregroundColor: colorScheme.primary,
            backgroundColor: Colors.white,

            // disabledForegroundColor: Colors.black,
            // disabledBackgroundColor:
            //     colorScheme.primary.withOpacity(0.6),

            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),

        // onPressed: null,
        onPressed: func,
        child: Text("$title",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            )));
  }
}
