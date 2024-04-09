import 'package:amp_up/imports.dart';

import 'package:flutter/material.dart';

class Savings extends StatefulWidget {
  Savings({super.key});

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    // Initialize _currentIndex to 0 when the widget is first created
    // _currentIndex = widget.param;
    _currentIndex = 0;
  }

  String getTitle(int index) {
    return index == 0
        ? "Active"
        : index == 1
            ? "Pending"
            : "Completed";
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Savings: ${getTitle(_currentIndex)}"), // Set the title dynamically
        centerTitle: true,
        titleSpacing: 20,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromARGB(146, 167, 167, 167),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
          child: CustomTabBar(
        tabTitles: const [
          "Active",
          "Pending",
          "Completed",
        ],
        tabViews: [
          Active(
            colorScheme: colorScheme,
          ),
          Pending(colorScheme: colorScheme),
          Completed(colorScheme: colorScheme),
        ],
        onTabChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex, // Pass currentIndex to CustomTabBar
      )),
    );
  }
}
