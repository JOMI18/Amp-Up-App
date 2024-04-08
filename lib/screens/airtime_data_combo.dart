
import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class AirtimeDataCombo extends StatefulWidget {
  final int? param;
  AirtimeDataCombo({super.key, this.param});

  @override
  State<AirtimeDataCombo> createState() => _AirtimeDataComboState();
}

class _AirtimeDataComboState extends State<AirtimeDataCombo> {
  // ignore: unused_field
  late int _currentIndex;
  // late String _appBarTitle;

  // static const List<Tab> myTabs = <Tab>[
  //   Tab(text: 'Buy Airtime'),
  //   Tab(text: 'Buy Data'),
  // ];

  static const List<String> myTabs = <String>[
    'Buy Airtime',
    'Buy Data',
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.param ?? 0;
    // _appBarTitle = widget.tabs[_currentIndex].title;
  }

  void _updateAppBarTitle(int index) {
    setState(() {
      _currentIndex = index;
      // _appBarTitle = widget.tabs[index].title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("d"),
        centerTitle: true,
        titleSpacing: 20,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Container(
            decoration: BoxDecoration(
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
        titles: myTabs,
        contents: [
          Airtime(),
          Data(),
        ],
        onTabChanged: (index) {
          // Handle tab change
        },
      )),
    );
  }
}
