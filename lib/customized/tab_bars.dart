import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;
  final ValueChanged<int>? onTabChanged;
  final int currentIndex;

  const CustomTabBar({
    required this.tabTitles,
    required this.tabViews,
    this.onTabChanged,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

// class _CustomTabBarState extends State<CustomTabBar>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController =
//         TabController(vsync: this, length: widget.tabTitles.length);
//     _tabController.addListener(() {
//       if (widget.onTabChanged != null) {
//         widget.onTabChanged!(_tabController.index);
//       }
//       _tabController.index = widget.currentIndex;
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               color: Utilities().appColors(context).secondary,
//               child: TabBar(
//                 dividerHeight: 0.5,
//                 padding: EdgeInsets.all(10),
//                 unselectedLabelStyle:
//                     TextStyle(color: Color.fromARGB(223, 41, 41, 41)),
//                 indicatorWeight: 4,
//                 labelStyle:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//                 indicatorPadding: const EdgeInsets.symmetric(vertical: -2),
//                 controller: _tabController,
//                 tabs:
//                     widget.tabTitles.map((title) => Tab(text: title)).toList(),
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: widget.tabViews,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.tabTitles.length, initialIndex: widget.currentIndex);
    _tabController.addListener(() {
      if (widget.onTabChanged != null) {
        widget.onTabChanged!(_tabController.index);
      }
    });
  }

  @override
  void didUpdateWidget(covariant CustomTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != _tabController.index) {
      _tabController.index = widget.currentIndex;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Utilities().appColors(context).secondary,
              child: TabBar(
                dividerHeight: 0.5,
                padding: EdgeInsets.all(10),
                unselectedLabelStyle: TextStyle(color: Color.fromARGB(223, 41, 41, 41)),
                indicatorWeight: 4,
                labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                indicatorPadding: const EdgeInsets.symmetric(vertical: -2),
                controller: _tabController,
                tabs: widget.tabTitles.map((title) => Tab(text: title)).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: widget.tabViews,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
