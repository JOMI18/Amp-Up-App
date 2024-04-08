// import 'dart:async';


import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class Account extends StatefulWidget {
  const Account({super.key, required this.colorScheme});
  final ColorScheme colorScheme;

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // void copyToClipboard(String text) {
  //   Clipboard.setData(ClipboardData(text: text));

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text('Text copied to clipboard')),
  //   );
  // }

  bool isVisible = true;
  String accountNumber = "4004383940385";

  @override
  Widget build(BuildContext context) {
    return ComponentSlideIns(
      beginOffset: const Offset(4.0, 0.0),
      duration: const Duration(milliseconds: 1400),
      child: SizedBox(
        height: 20.h,
        // width: 500,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: widget.colorScheme.primary,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Main Account Balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "₦ ${isVisible ? "0.00" : "***"}",
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(
                                isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 26,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              "Account number:$accountNumber",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                // copyToClipboard(accountNumber);

                                Utilities()
                                    .copyToClipboard(context, accountNumber);
                              },
                              child: const Icon(
                                Icons.copy,
                                size: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 1, 157, 7),
                              borderRadius: BorderRadius.circular(3)),
                          child: const Text(
                            "Commissioned",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "₦ 10,000",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 15.w,
                child: Container(
                  height: 48,
                  width: 260,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 190, 219, 255),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            backgroundColor: widget.colorScheme.surfaceVariant),
                        onPressed: () {
                          Navigator.of(context).push(
                            SlideAnimation(
                              page: AddMoney(),
                            ),
                          );
                        },
                        child: const Text(
                          "Add money",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            backgroundColor: widget.colorScheme.surfaceVariant),
                        onPressed: () {
                          Navigator.of(context).push(
                            SlideAnimation(
                              page: const SendMoney(),
                            ),
                          );
                        },
                        child: const Text(
                          "Send Money",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
