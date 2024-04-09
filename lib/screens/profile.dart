import 'package:amp_up/imports.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final List items = [
    {
      "mainIcon": Icons.arrow_upward_rounded,
      "mainTitle": "Upgrade your account",
    },
    {
      "mainIcon": Icons.account_circle,
      "mainTitle": "Profile",
      "route": "profileInfo",
      "page": ProfileInfo()
    },
    {
      "mainIcon": Icons.edit_document,
      "mainTitle": "Request Statement",
    },
    {
      "mainIcon": Icons.email,
      "mainTitle": "Support",
      "route": "support",
    },
    {
      "mainIcon": Icons.credit_card,
      "mainTitle": "Cards and bank",
    },
    {
      "mainIcon": Icons.lock,
      "mainTitle": "Security settings",
      "route": "security",
    },
    {
      "mainIcon": Icons.note_alt,
      "mainTitle": "Credit report",
    },
    {
      "mainIcon": Icons.format_line_spacing_rounded,
      "mainTitle": "Preferences",
    },
    {
      "mainIcon": Icons.card_giftcard_outlined,
      "mainTitle": "Referrals",
    },
    {
      "mainIcon": Icons.double_arrow_outlined,
      "mainTitle": "Account limits",
    },
    {
      "mainIcon": Icons.account_balance,
      "mainTitle": "About AMP Up",
    },
    {
      "mainIcon": Icons.block_sharp,
      "mainTitle": "Sign out",
      "route": "signOut",
      "page": const SignOutAlert()
    },
  ];

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const CustomAppBars(title: "Account"),
      body: Consumer(
        builder: (context, ref, _) {
          final firstName = ref.watch(userProvider).firstName;
          final lastName = ref.watch(userProvider).lastName;
          final time = ref.watch(userProvider).createdAt;
          final date = DateFormat('MMM d, y @H:mm').format(time);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ComponentSlideIns(
                        beginOffset: const Offset(0.0, -4.0),
                        endOffset: const Offset(0.0, 0.0),
                        duration: const Duration(milliseconds: 1000),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          color: colorScheme.primary,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.spa_rounded,
                                        size: 41, color: colorScheme.primary),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "$firstName $lastName",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1.1),
                                      ),
                                      Text("Client ID:2345678567",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.white,
                                          )),
                                      Text("$date",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: const Color(0xD5000000),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    "LEVEL 1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: ComponentSlideIns(
                    beginOffset: const Offset(-4.0, 0.0),
                    duration: const Duration(milliseconds: 1200),
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (items[index]["page"] != "" &&
                                  items[index]["route"] != "") {
                                Navigator.of(context).push(
                                  SlideAnimation(
                                    page: items[index]["page"],
                                  ),
                                );
                              } else {
                                Navigator.pushNamed(
                                    context, items[index]["route"]);
                              }
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    child: Icon(
                                      items[index]["mainIcon"],
                                      size: 22,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  title: Text(items[index]["mainTitle"],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                ),
                                Divider(
                                  height: 2.h,
                                ),
                                if (index == items.length - 1)
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Text("Amp up: version.1.1.0 "),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text("Copyright Oluwajomiloju Odedairo"),
                                    ],
                                  ),
                              ],
                            ),
                          );
                        })),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
