import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class AccountCard extends StatefulWidget {
  AccountCard({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  final List item = [
    {
      "prefixIcon": Icons.account_balance,
      "prefixTitle": "BANK NAME",
      "suffixIcon": Icons.share,
      "mainTitle": "Amp Up",
      "numColor": const Color.fromARGB(255, 16, 16, 16)
    },
    {
      "prefixIcon": Icons.tag_rounded,
      "prefixTitle": "ACCOUNT NUMBER",
      "mainTitle": "4004383940385",
      "icon": Icons.copy,
      "numColor": null
    },
    {
      "prefixIcon": Icons.account_circle,
      "prefixTitle": "BENEFICIARY",
      "mainTitle": "",
      "numColor": const Color.fromARGB(255, 16, 16, 16)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final user = ref.watch(userProvider).firstName +
            ref.watch(userProvider).lastName;
        item[2]["mainTitle"] = user;

        return ComponentSlideIns(
          beginOffset: const Offset(4.0, 0.0),
          duration: const Duration(milliseconds: 1200),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: const Offset(0, 2), // Offset
                ),
              ],
            ),
            child: Card(
              elevation: 3,
              surfaceTintColor: Colors.white,
              shadowColor: widget.colorScheme.secondary.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 19,
                                child: Icon(
                                  Icons.account_tree_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 22,
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Bank Transfer",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 1, 157, 7),
                              borderRadius: BorderRadius.circular(3)),
                          child: const Text(
                            "RECOMMENDED",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                        text: const TextSpan(
                      style: TextStyle(
                        // letterSpacing: 0.2,
                        fontSize: 15,
                        color: Color.fromARGB(255, 36, 36, 36),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'To add money to your Amp Up account, make a bank transfer of up to '),
                        TextSpan(
                          text: '₦0',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  Colors.black), // Change the color as needed
                        ),
                        TextSpan(
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            text:
                                ' to the account below. Funds reflect instantly.'),
                      ],
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(148, 67, 105, 166),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                                itemCount: item.length,
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 19,
                                                child: Icon(
                                                  item[index]["prefixIcon"],
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                  size: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item[index]["prefixTitle"],
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors
                                                            .grey.shade800),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        item[index]
                                                            ["mainTitle"],
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: item[index][
                                                                  "numColor"] ??
                                                              Theme.of(context)
                                                                  .iconTheme
                                                                  .color,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (item[index][
                                                                  "mainTitle"] ==
                                                              "4004383940385") {
                                                            Utilities()
                                                                .copyToClipboard(
                                                                    context,
                                                                    item[index][
                                                                        "mainTitle"]);
                                                          }
                                                        },
                                                        child: Icon(
                                                          item[index]["icon"],
                                                          size: 20,
                                                          color:
                                                              Theme.of(context)
                                                                  .iconTheme
                                                                  .color,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            item[index]["suffixIcon"],
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            size: 25,
                                          ),
                                        ],
                                      ),
                                      // Add a divider after all items except the last one
                                      if (index != item.length - 1)
                                        const Divider(
                                          height: 35,
                                          color:
                                              Color.fromARGB(255, 67, 105, 166),
                                        ),
                                    ],
                                  );
                                })),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
