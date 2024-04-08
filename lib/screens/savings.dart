import 'package:amp_up/imports.dart';
import 'package:flutter/material.dart';

class Savings extends StatefulWidget {
  Savings({super.key});

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  int selectedIndex = 0;

  final List<String> tabTitles = ["Active", "Pending", "Completed"];

  @override
  Widget build(BuildContext context) {
  // ColorScheme colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        // child: TabBarsViews(
        //   dynamicTitle: "My Savings --",
        //   title: tabTitles[selectedIndex],
        //   tabTitles: tabTitles,
        //   tabViews: [Active(colorScheme: colorscheme), Pending(colorScheme: colorscheme), Completed(colorScheme: colorscheme)],
        //   onTabChanged: (index) {
        //     // Update the selected index when the tab changes
        //     setState(() {
        //       selectedIndex = index;
        //     });
        //   },
        // ),
      ),
    );
  }
}
