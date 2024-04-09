// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class BuyData extends StatefulWidget {
  const BuyData({super.key});

  @override
  State<BuyData> createState() => _BuyDataState();
}

class _BuyDataState extends State<BuyData> {
  TextEditingController textCt = TextEditingController();
  TextEditingController inputCt = TextEditingController();
  AlertInfo info = AlertInfo();

  String selectedNetwork = "Mtn";
  void Submit() {
    if (inputCt.text == "") {
      info.message = "Field can't be empty";
      info.showAlertDialog(context);
    }
  }

  void updateInputValue(String buttonValue) {
    inputCt.text = buttonValue;
  }

  Widget updateNetworkName() {
    if (selectedNetwork == "Mtn") {
      return const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            "https://c8.alamy.com/comp/2HMMWR2/mtn-logo-2HMMWR2.jpg",
          ));
    } else if (selectedNetwork == "Airtel") {
      return const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              "https://c7.alamy.com/comp/2HMGGJB/airtel-logo-2HMGGJB.jpg"));
    } else if (selectedNetwork == "Glo") {
      return const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            "https://www.gloworld.com/logo.png",
          ));
    } else if (selectedNetwork == "9mobile") {
      return const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            "https://www.techquery.ng/wp-content/uploads/2018/03/9mobile.png",
          ));
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBars(title: "Buy Airtime"),
        body: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [updateNetworkName()],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "${selectedNetwork}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Btns().textBtn(context, "₦ 100", () {
                                    updateInputValue("₦100");
                                  }),
                                  Btns().textBtn(context, "₦ 200", () {
                                    updateInputValue("₦200");
                                  }),
                                  Btns().textBtn(context, "₦ 500", () {
                                    updateInputValue("₦500");
                                  }),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Btns().textBtn(context, "₦ 800", () {
                                    updateInputValue("₦800");
                                  }),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Btns().textBtn(context, "₦ 1000", () {
                                    updateInputValue("₦1000");
                                  }),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                  hintText: " Amount ",
                                  prefixIcon: const Icon(
                                    Icons.phone_android_rounded,
                                    color: Color.fromARGB(255, 65, 65, 65),
                                    size: 28,
                                  ),
                                  controller: inputCt,
                                  inputTitle: "Enter a custom amount"),
                            ],
                          ),
                          const SizedBox()
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      const Column(
                        children: [
                          Divider(
                            color: Color.fromARGB(102, 59, 59, 59),
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Save as beneficiary?",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                              ),
                              Switches()
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Btns().btn(context, "Done", () {
                    Submit();
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}
