import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class Electricity extends StatefulWidget {
  const Electricity({super.key});

  @override
  State<Electricity> createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  String selectedDisco = "";
  bool isActive = true;
  TextEditingController numCt = TextEditingController();
  TextEditingController billCt = TextEditingController();
  TextEditingController amountCt = TextEditingController();
  Map selectedItems = {};

  Map images = {
    "aba": "lib/assets/images/tv-channels/gotv.jpg",
    "kano": "lib/assets/images/tv-channels/showmax.webp",
    "enugu": "lib/assets/images/tv-channels/dstv.jpg",
    "ibadan": "lib/assets/images/tv-channels/showmax.webp",
    "eko": "lib/assets/images/tv-channels/dstv.jpg",
    "ikeja": "lib/assets/images/tv-channels/showmax.webp",
    "joss": "lib/assets/images/tv-channels/dstv.jpg",
    "kaduna": "lib/assets/images/tv-channels/showmax.webp",
    "abuja": "lib/assets/images/tv-channels/dstv.jpg",
    "portharcourt": "lib/assets/images/tv-channels/showmax.webp",
    "benin": "lib/assets/images/tv-channels/dstv.jpg",
    "yola": "lib/assets/images/tv-channels/showmax.webp",
  };

  List items = [
    {"title": "Lite (annual)", "amount": " ₦ 8,600"},
    {"title": "Jinja", "amount": " ₦ 2,700"},
    {"title": "Jolli", "amount": " ₦ 3,950"},
    {"title": "Max", "amount": " ₦ 5,700"},
    {"title": "Supa", "amount": " ₦ 7,600"},
    {"title": "Gotv Supa Plus", "amount": " ₦ 12,500"},
  ];
  // List items = [];

  void getPlans() async {
    print("$selectedDisco ==================`");
    final response = await BillController()
        .getBillPlans({"serviceId": "$selectedDisco-electric"});

    print(response);
    if (response['status'] == 'error') {
      Utilities().copyToClipboard(context, response['message']);
      return;
    }

    // setState(() {
    //   items = response['data']['content']['variations'];
    // });

// print(items);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map name = ModalRoute.of(context)!.settings.arguments as Map;
    // setState(() {
    selectedDisco = name["name"].toString().toLowerCase();
    //  getPlans();
    // });
    // getPlans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBars(title: "Electricity "),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ComponentSlideIns(
                    beginOffset: const Offset(0.0, -2.0),
                    duration: const Duration(milliseconds: 1200),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage("${images[selectedDisco]}"),
                        ),
                        Text(
                          "${selectedDisco.toUpperCase()} Electricity",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isActive
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ComponentSlideIns(
                              beginOffset: const Offset(-2.0, 0.0),
                              duration: const Duration(milliseconds: 1200),
                              child: CustomTextField(
                                hintText: "Meter Number",
                                inputTitle: "Meter Number",
                                controller: numCt,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(2.0, 0.0),
                              duration: const Duration(milliseconds: 1200),
                              child: CustomTextField(
                                  onTap: () {
                                    setState(() {
                                      isActive = false;
                                    });
                                  },
                                  readOnly: true,
                                  hintText: "Select Bill Plan",
                                  inputTitle: "Bill Plan",
                                  controller: billCt,
                                  suffixIcon: const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.white,
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(-2.0, 0.0),
                              duration: const Duration(milliseconds: 1200),
                              child: CustomTextField(
                                hintText: "0.00",
                                inputTitle: "Amount",
                                controller: amountCt,
                                prefixIcon: const Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text("Account balance:{ N10,000.00 }")
                          ],
                        )
                      : SizedBox(
                          height: 50.h,
                          child: ComponentSlideIns(
                            beginOffset: const Offset(-2.0, 0.0),
                            duration: const Duration(milliseconds: 1200),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isActive = true;
                                      selectedItems = items[index];
                                      billCt.text = selectedItems["title"];
                                      amountCt.text = selectedItems["amount"];
                                      // billCt.text = selectedItems["name"];
                                      // amountCt.text =
                                      //     selectedItems["variation_amount"];
                                    });
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(items[index]["title"],
                                              // items[index]["name"],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12)),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "${(items[index]['amount'])} ",
                                            // "${Utilities().formatCurrency(items[index]['variation_amount'])}, ",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                ],
              ),
              ComponentSlideIns(
                  beginOffset: const Offset(0.0, 2.0),
                  duration: const Duration(milliseconds: 1200),
                  child: Btns().btn(context, "Proceed", () {
                    Navigator.pushNamed(context, "reviewpurchase");
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
