import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class AirtimeDataCombo extends StatefulWidget {
  final int param;
  AirtimeDataCombo({super.key, required this.param});

  @override
  State<AirtimeDataCombo> createState() => _AirtimeDataComboState();
}

class _AirtimeDataComboState extends State<AirtimeDataCombo> {
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    // Initialize _currentIndex to 0 when the widget is first created
    _currentIndex = widget.param;
  }

  String getTitle(int index) {
    if (index == 0) {
      return "Airtime";
    } else if (index == 1) {
      return "Data";
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle(_currentIndex)), // Set the title dynamically
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
          "Airtime",
          "Data",
        ],
        tabViews: const [
          Airtime(),
          Data(),
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
