import 'package:amp_up/imports.dart';

import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  Payments({super.key});

  final List items = [
    {
      "mainIcon": Icons.monetization_on,
      "mainTitle": "Add money",
      "subTitle": "Add money to your Amp Up account",
      "iconColor": const Color.fromARGB(255, 43, 0, 255),
      "route": "addMoney",
    },
    {
      "mainIcon": Icons.ios_share_sharp,
      "mainTitle": "Send money ",
      "subTitle": "Purchase airtime & data",
      "iconColor": const Color.fromARGB(255, 255, 0, 111),
      "route": "sendMoney",
    },
    {
      "mainIcon": Icons.phone_android,
      "mainTitle": "Airtime/Data",
      "subTitle": "Add money to your Amp Up account",
      "iconColor": const Color.fromARGB(255, 239, 68, 255),
      "route": "buyAirtimePG",
    },
    {
      "mainIcon": Icons.tv,
      "mainTitle": "Pay a bill",
      "subTitle": "Pay bills easily from your Amp Up",
      "iconColor": const Color.fromARGB(255, 255, 204, 20),
      "route": "payBills",
    },
    {
      "mainIcon": Icons.shopping_cart,
      "mainTitle": "Amp Up",
      "subTitle": "Split your purchases with Amp Up",
      "iconColor": Colors.green.shade700,
      "route": "",
    },
    {
      "mainIcon": Icons.money_outlined,
      "mainTitle": "Recurring payments",
      "subTitle": "Manage your recurring payments",
      "iconColor": const Color.fromARGB(255, 47, 0, 129),
      "route": "",
    },
    {
      "mainIcon": Icons.call_to_action_rounded,
      "mainTitle": "Saved payments",
      "subTitle": "Repeat a bill,airtime or date payment",
      "iconColor": const Color.fromARGB(255, 0, 108, 129),
      "route": "",
    },
    {
      "mainIcon": Icons.add_card_rounded,
      "mainTitle": "Card ",
      "subTitle": "View debit card details and benefits",
      "iconColor": Colors.pinkAccent,
      "route": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        screenWidth ~/ 200; // Calculate cross-axis count based on item width
    double itemWidth =
        (screenWidth - 12 * (crossAxisCount + 1)) / crossAxisCount;
    // double itemWidth =
    //     (screenWidth - 48) / 2; // Subtracting padding and cross axis spacing

    return Scaffold(
      appBar: const CustomAppBars(
        title: "Payments",
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // crossAxisCount: 2,
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio:
                  (itemWidth / 180), // Adjust item height based on width
            ),
            itemCount: items.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, items[index]["route"]);
                    },
                    child: ComponentSlideIns(
                      beginOffset: const Offset(0, -4.0),
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 180,
                        height: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade500,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(
                                items[index]["mainIcon"],
                                size: 26,
                                color: items[index]["iconColor"],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(items[index]["mainTitle"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(items[index]["subTitle"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
