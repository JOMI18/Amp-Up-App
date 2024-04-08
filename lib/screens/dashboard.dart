
import 'package:flutter/material.dart';

import 'package:amp_up/imports.dart';

class Dashboard extends StatefulWidget {
  final UserModel? user;

  const Dashboard({super.key, this.user});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    Home(),

    Savings(),
    Payments(),
    Transactions(),
    Profile(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        body: widgetOptions.elementAt(selectedIndex),

        // In Dart, the elementAt() methd is used to access an element at a specific index in a list or iterable.
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: colorScheme
              .primary, // Color of the selected item's icon and label
          unselectedItemColor: Colors
              .grey.shade800, // Color of the unselected items' icons and labels
          selectedLabelStyle: const TextStyle(
              fontWeight:
                  FontWeight.bold), // Style for the selected item's label

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.savings_outlined),
              label: 'Savings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded),
              label: 'Payments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_rounded),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Accounts',
            ),
          ],
        ));
  }
}
