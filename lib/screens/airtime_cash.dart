import 'package:amp_up/imports.dart';
import 'package:flutter/material.dart';

class AirtimeCash extends StatefulWidget {
  const AirtimeCash({super.key});

  @override
  State<AirtimeCash> createState() => _AirtimeCashState();
}

class _AirtimeCashState extends State<AirtimeCash> {
  late TextEditingController? networkCt;
  late TextEditingController? numberCt;
  late TextEditingController? amountSentCt;
  late TextEditingController? amountReceiveCt;

  AlertInfo alertInfo = AlertInfo();
  AlertLoading alertLoading = AlertLoading();

  void selectNetwork() {
    final List<Map<String, dynamic>> network = [
      {"title": "Mtn", "img": "dstv.jpg"},
      {"title": "Airtel", "img": "dstv.jpg"},
      {"title": "Glo", "img": "dstv.jpg"},
      {"title": "9-Mobile", "img": "dstv.jpg"}
    ];
    showDropdownMenu(
        context,
        Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 14, 14, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: network.map(
                (net) {
                  return GestureDetector(
                    onTap: () {
                      networkCt!.text = net["title"];
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  "lib/assets/images/tv-channels/${net["img"]}",
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              net["title"],
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ).toList()),
        ),
        250);
  }

  void submit() {
    if (networkCt!.text == '' ||
        numberCt!.text == '' ||
        amountSentCt!.text == '' ||
        amountReceiveCt!.text == '') {
      alertInfo.message = "Fill all required fields";
      alertInfo.showAlertDialog(context);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    networkCt = TextEditingController();
    numberCt = TextEditingController();
    amountSentCt = TextEditingController();
    amountReceiveCt = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    networkCt!.dispose();
    numberCt!.dispose();
    amountSentCt!.dispose();
    amountReceiveCt!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars(
        title: "Airtime to Cash",
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Wallet Balance:₦87",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Number to send airtime to:"),
                        Text(
                          "09053732806",
                          style: TextStyle(fontSize: 18.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Percentage"),
                        Text(
                          "20.0%",
                          style: TextStyle(fontSize: 18.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      hintText: "mtn",
                      inputTitle: "Network",
                      readOnly: true,
                      onTap: () {
                        selectNetwork();
                      },
                      controller: networkCt,
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: numberCt,
                      hintText: "081***********",
                      inputTitle: "Phone Number (airtime will be sent from)",
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: amountSentCt,
                      hintText: "0.00",
                      inputTitle: "Amount to be sent",
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      controller: amountReceiveCt,
                      hintText: "0.00",
                      inputTitle: "Amount to receive",
                    ),
                  ],
                ),
              ),
            ),
            Btns().btn(context, "Done", () {
              submit();
            })
          ],
        ),
      ),
    );
  }
}
