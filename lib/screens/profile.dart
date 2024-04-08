import 'package:amp_up/imports.dart';


import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final List items = [
    {
      "mainIcon": Icons.arrow_upward_rounded,
      "mainTitle": "Upgrade your account",
      "route": "",
      "page": ""
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
      "route": "",
      "page": ""
    },
    {
      "mainIcon": Icons.email,
      "mainTitle": "Support",
      "route": "support",
      "page": ""
    },
    {
      "mainIcon": Icons.credit_card,
      "mainTitle": "Cards and bank",
      "route": "",
      "page": ""
    },
    {
      "mainIcon": Icons.lock,
      "mainTitle": "Security settings",
      "route": "security",
      "page": ""
    },
    {
      "mainIcon": Icons.note_alt,
      "mainTitle": "Credit report",
      "route": "",
      "page": ""
    },
    {
      "mainIcon": Icons.format_line_spacing_rounded,
      "mainTitle": "Preferences",
      "route": "",
      "page": ""
    },
    {
      "mainIcon": Icons.card_giftcard_outlined,
      "mainTitle": "Referrals",
      "route": "",
      "page": ""
    },
    {
      "mainIcon": Icons.double_arrow_outlined,
      "mainTitle": "Account limits",
      "route": "",
      "page": ""
    },
    {
      "mainIcon": Icons.account_balance,
      "mainTitle": "About Betterlife",
      "route": "",
      "page": ""
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
      body: Padding(
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
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.spa_rounded,
                                  size: 41,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jonathan Smith Reyes",
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
                                  Text("Joined Feb 05, 2023",
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
                            Navigator.pushNamed(context, items[index]["route"]);
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
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              title: Text(items[index]["mainTitle"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                            ),
                            const Divider(
                              height: 6,
                            )
                          ],
                        ),
                      );
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
