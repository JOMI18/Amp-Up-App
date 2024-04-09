import 'dart:math';

import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class TXSuccess extends StatefulWidget {
  const TXSuccess({super.key});

  @override
  State<TXSuccess> createState() => _TXSuccessState();
}

class _TXSuccessState extends State<TXSuccess> {
  final List<String> phrases = [
    "Congratulations! You're officially a money master!",
    "Boom! Transaction complete, high-five!",
    "Success! You're now a financial wizard!",
    "You just aced that transaction!",
    "Transaction complete! Your wallet is doing a happy dance!",
    "Well done! Your transaction game is on point!",
    "Success! Your account is now richer and happier!",
    "Voila! You just leveled up your financial skills!",
    "Transaction complete! Your money is where the magic happens!",
    "Ta-da! You just made your wallet smile!",
  ];

  final List items = [
    {
      "mainIcon": Icons.card_giftcard,
      "mainTitle": "Fund Wallet",
      "route": "addMoney",
    },
    {
      "mainIcon": Icons.send_rounded,
      "mainTitle": "BuyData",
      "route": "buyDataPG",
    },
    {
      "mainIcon": Icons.phone_android,
      "mainTitle": "Buy Airtime",
      "route": "buyAirtimePG",
    },
    {
      "mainIcon": Icons.tv,
      "mainTitle": "Pay a bill",
      "route": "payBills",
    },
  ];

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    // Choose a random phrase
    String randomPhrase = phrases[random.nextInt(phrases.length)];
    // Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: const CustomAppBars(
        title: 'Transaction Successful',
      ),
      body: Consumer(
        builder: (context, ref, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Lottie.asset("lib/assets/images/lottie/newUser.json",
                          height: 20.h),
                      SizedBox(height: 5),
                      Text(
                        randomPhrase,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Congrats ${ref.watch(userProvider).firstName}",
                        // data['message'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(18),
                        color: Utilities().appColors(context).secondary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "What would you like to do next?",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        height: 38.h,
                        child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, items[index]["route"]);
                                    },
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 20,
                                        child: Icon(
                                          items[index]["mainIcon"],
                                          size: 22,
                                          color: Utilities()
                                              .appColors(context)
                                              .primary,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      title: Text(items[index]["mainTitle"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 16)),
                                    ),
                                  ),
                                  const Divider(
                                    height: 15,
                                  )
                                ],
                              );
                            })),
                      ),
                      SizedBox(height: 12),
                      Btns().btn(context, "Go Home", () {
                        Navigator.pushNamed(context, "dashboard");
                      }),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
