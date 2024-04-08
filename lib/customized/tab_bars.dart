import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';
// import 'package:the_betterlife_app/Services/utilities.dart';

// class CustomTabBarsViews extends StatefulWidget {
//   final String title;
//   final List<String> tabTitles;
//   final List<Widget> tabViews;
//   final ValueChanged<int> onTabChanged; // Callback function
//   final String? dynamicTitle;

//   const CustomTabBarsViews({
//     super.key,
//     required this.title,
//     this.dynamicTitle, // Make dynamicTitle optional
//     required this.tabTitles,
//     required this.tabViews,
//     required this.onTabChanged, // Accept the callback function
//   });
//   @override
//   _CustomTabBarsViewsState createState() => _CustomTabBarsViewsState();
// }

// class _CustomTabBarsViewsState extends State<CustomTabBarsViews>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(
//       length: widget.tabTitles.length,
//       vsync: this,
//       initialIndex: 0, // Initially select the first tab
//     );
//     tabController.addListener(() {
//       widget.onTabChanged(tabController.index); // Notify the callback
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     ColorScheme colorScheme = Theme.of(context).colorScheme;
//     String completeTabTitle = widget.dynamicTitle != null
//         ? "${widget.dynamicTitle} ${widget.tabTitles[tabController.index]}"
//         : widget.tabTitles[tabController.index];
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 size: 25,
//                 color: colorScheme.primary,
//               ),
//             ),
//             Text(completeTabTitle,
//                 style:
//                     const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//             CircleAvatar(
//               radius: 13,
//               backgroundColor:
//                   Color.fromARGB(255, 106, 106, 106).withOpacity(0.5),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, "support");
//                 },
//                 child: const Icon(
//                   Icons.question_mark_outlined,
//                   size: 18,
//                   color: Color.fromARGB(255, 24, 24, 24),
//                 ),
//               ),
//             ),
//           ]),
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(5),
//             child: Container(
//               decoration: const BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     width: 1,
//                     color: Color.fromARGB(146, 167, 167, 167),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // bottom: TabBar(
//           //   controller: tabController,
//           //   tabs: widget.tabTitles.map((title) => Tab(text: title)).toList(),
//           // ),
//         ),
//         body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//           // Display buttons as tabs
//           Container(
//             color: Utilities().appColors(context).secondary,
//             // child: TabBar(
//             //   onTap: (value) {
//             //     setState(() {
//             //       tabController.index = value;
//             //     });
//             //   },
//             //   padding: EdgeInsets.all(10),
//             //   unselectedLabelColor: Colors.grey,
//             //   controller: tabController,
//             //   tabs:,
//             // ),
//           ),
//           // Display tab views
//           Expanded(
//             child: TabBarView(
//               controller: tabController,
//               children: widget.tabViews,
//             ),
//           ),
//         ]));
//   }
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
// }

// ignore: must_be_immutable
class CustomTabBar extends StatefulWidget {
  final List<String> titles;
  final List<Widget> contents;
  void Function(int index) onTabChanged;

  CustomTabBar(
      {super.key,
      required this.titles,
      required this.contents,
      required this.onTabChanged});

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Utilities().appColors(context).secondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              widget.titles.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                    widget.onTabChanged(index);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.titles[index],
                    style: TextStyle(
                      color: _currentIndex == index
                          ? Utilities().appColors(context).primary
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        widget.contents[_currentIndex],
      ],
    );
  }
}
