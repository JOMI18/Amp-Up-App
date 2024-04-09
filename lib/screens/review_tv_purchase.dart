import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class ReviewPurchase extends StatefulWidget {
  const ReviewPurchase({super.key});

  @override
  State<ReviewPurchase> createState() => _ReviewPurchaseState();
}

class _ReviewPurchaseState extends State<ReviewPurchase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBars(
          title: "Review Purchase",
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ComponentSlideIns(
                      beginOffset: const Offset(2.0, 0.0),
                      duration: const Duration(milliseconds: 1100),
                      child: Card(
                          elevation: 8,
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Subscriber name",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        )),
                                    Text("Jonathan Smith Reyes",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Utilities()
                                              .appColors(context)
                                              .primary,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Decoder Number",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        )),
                                    Text("23456789098765",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Service provider",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        )),
                                    Text("GoTv Subscription plan",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ))),
                  const SizedBox(
                    height: 30,
                  ),
                  ComponentSlideIns(
                      beginOffset: const Offset(-2.0, 0.0),
                      duration: const Duration(milliseconds: 1100),
                      child: const Card(
                          elevation: 8,
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        )),
                                    Text("₦ 1,000.00",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Service Fee",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        )),
                                    Text("Free",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Debt",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        )),
                                    Text("₦ 100",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  const Column(
                    children: [
                      Divider(
                        color: Color.fromARGB(102, 149, 149, 149),
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Save payment",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Switches()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  ComponentSlideIns(
                    beginOffset: const Offset(2.0, 0.0),
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      height: 8.h,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 190, 188),
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 18,
                              backgroundColor:
                                  Color.fromARGB(181, 245, 140, 137),
                              child: Icon(
                                Icons.dangerous_sharp,
                                color: Color.fromARGB(255, 255, 69, 69),
                                size: 28,
                              ),
                            ),
                            SizedBox(
                              width: 75.w,
                              child: const Text(
                                "Be sure of the payment details before submitting as this cannot be reversed",
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ComponentSlideIns(
                      beginOffset: const Offset(0, 20),
                      duration: const Duration(milliseconds: 1200),
                      child: Btns().btn(context, "Securely Pay Your Bill", () {
                        Navigator.pushNamed(context, "txSuccess");
                      })),
                ],
              )
            ],
          ),
        ));
  }
}
