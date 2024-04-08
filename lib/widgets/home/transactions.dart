import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:amp_up/imports.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({super.key, required this.colorScheme});
  final ColorScheme colorScheme;

  final List transactions = [
    {
      "icon": Icons.shopping_cart,
      "price": 100,
      "title": 'Shopping',
      "date": DateTime.now(),
    },
    {
      "icon": Icons.restaurant,
      "price": 50,
      "title": 'Dinner',
      "date": DateTime.now().subtract(const Duration(days: 6)),
    },
    {
      "icon": Icons.local_grocery_store,
      "price": 200,
      "title": 'Groceries',
      "date": DateTime.now().subtract(const Duration(days: 4)),
    },
    {
      "icon": Icons.tv,
      "price": 250,
      "title": 'Hulu',
      "date": DateTime.now().subtract(const Duration(days: 3)),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ComponentSlideIns(
      beginOffset: const Offset(-4.0, 0.0),
      duration: const Duration(milliseconds: 1400),
      child: Column(children: [
        SizedBox(
          width: 800,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {},
                child: Text("View All",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: colorScheme.primary)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 320,
          width: 800,
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    tileColor: const Color.fromARGB(255, 192, 209, 223)
                        .withOpacity(0.2),
                    leading: CircleAvatar(
                      radius: 18,
                      child: Icon(
                        transactions[index]['icon'],
                        size: 17,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    trailing: Text(
                      "₦${transactions[index]['price'].toString()}.00",
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    title: Text(transactions[index]['title'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16)),
                    subtitle: Text(
                      // Format the date and time
                      DateFormat('MMM d, y @H:mm')
                          .format(transactions[index]['date']),
                    ),
                  ),
                  if (index != transactions.length - 1)
                    const SizedBox(
                      height: 6,
                    )
                ],
              );
            },
          ),
        )
      ]),
    );
  }
}
