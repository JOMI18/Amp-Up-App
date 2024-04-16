import 'package:amp_up/imports.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Education extends StatefulWidget {
  Education({super.key, required this.param});
  String param;
  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  String selectedPin = "";
  bool isActive = true;
  TextEditingController numCt = TextEditingController();
  TextEditingController billCt = TextEditingController();
  TextEditingController amountCt = TextEditingController();
  Map selectedItems = {};

  Map images = {
    'jamb': "lib/assets/images/education/jamb.jpeg",
    "waec": "lib/assets/images/education/waec.png",
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedPin = widget.param;
    });
    // getPlans();
  }

  void getPlans() async {
    // AlertLoading loading=AlertLoading();
    // loading.showAlertDialog(context);
    final response =
        await BillController().getBillPlans({"serviceId": selectedPin});
    // loading.closeDialog(context);
    // print(response);
    if (response['status'] == 'error') {
      Utilities().copyToClipboard(context, response['message']);
      return;
    }

    // setState(() {
    //   items = response['data']['content']['variations'];
    // });

// print(items);
  }

//  @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//    Map name = ModalRoute.of(context)!.settings.arguments as Map;
//     // setState(() {
//       selectedPin = name["name"].toString().toLowerCase();
//       //  getPlans();
//     // });
//     getPlans();
//     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBars(title: "Education"),
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
                          backgroundImage: AssetImage("${images[selectedPin]}"),
                        ),
                        Text(
                          "${selectedPin.toUpperCase()} Pin",
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
                                hintText: "${selectedPin.toUpperCase()} Number",
                                inputTitle:
                                    " ${selectedPin.toUpperCase()} Number",
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
                                readOnly: true,
                                prefixIcon: const Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text("Account balance:{ ₦10,000.00 }")
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
                                          Text("${items[index]["title"]}",
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
                    Navigator.pushNamed(
                      context,
                      "reviewpurchase",
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
