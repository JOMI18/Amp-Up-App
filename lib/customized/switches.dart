import 'package:flutter/material.dart';

class Switches extends StatefulWidget {
  const Switches({super.key});

  @override
  State<Switches> createState() => _SwitchesState();
}

class _SwitchesState extends State<Switches> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Switch(
        activeColor: colorScheme.secondary,
        inactiveThumbColor: colorScheme.primary,
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.secondary,
        value: isSwitchOn,
        onChanged: (value) {
          setState(() {
            isSwitchOn = value;
          });
        });
  }
}
