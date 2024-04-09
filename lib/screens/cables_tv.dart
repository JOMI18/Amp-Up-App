import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class CablesTv extends StatefulWidget {
  const CablesTv({super.key});

  @override
  State<CablesTv> createState() => _CablesTvState();
}

class _CablesTvState extends State<CablesTv> {
  String selectedCable = "";
  bool isActive = true;
  TextEditingController numCt = TextEditingController();
  TextEditingController billCt = TextEditingController();
  TextEditingController amountCt = TextEditingController();
  Map selectedItems = {};

  List items = [
    {"title": "Lite (annual)", "amount": " ₦ 8,600"},
    {"title": "Jinja", "amount": " ₦ 2,700"},
    {"title": "Jolli", "amount": " ₦ 3,950"},
    {"title": "Max", "amount": " ₦ 5,700"},
    {"title": "Supa", "amount": " ₦ 7,600"},
    {"title": "Gotv Supa Plus", "amount": " ₦ 12,500"},
  ];

  Widget updateCable() {
    if (selectedCable == "gotv") {
      // if the names being sent were different
      // backgroundImage:
      // AssetImage("lib/Assets/img/$selectedCable/gotv.jpg");

      return const CircleAvatar(
          radius: 40,
          backgroundImage:
              AssetImage("lib/assets/images/tv-channels/gotv.jpg"));
    } else if (selectedCable == "showmax") {
      return const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(
            "lib/assets/images/tv-channels/showmax.webp",
          ));
    } else if (selectedCable == "dstv") {
      return const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(
            "lib/assets/images/tv-channels/dstv.jpg",
          ));
    } else if (selectedCable == "startimes") {
      return const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(
            "lib/assets/images/tv-channels/startimes.png",
          ));
    }

    return Container();
  }
// Method 2

  // Map images = {
  //   'gotv': "lib/Assets/img/gotv.jpeg",
  //   "dstv": "lib/Assets/img/dstv.jpeg",
  //   "showmax": "lib/Assets/img/showmax.webp",
  //   "startimes": "lib/Assets/img/startimes.png"
  // };

// if i was receiving it from the backend

// List items = [];

//   void getPlans() async {
//     AlertLoading loading = AlertLoading();
//     // loading.showAlertDialog(context);
//     final response =
//         await BillController().getBillPlans({"serviceId": selectedCable});
//     // loading.closeDialog(context);
//     // print(response);
//     if (response['status'] == 'error') {
//       Utilities().mySnackbar(context, response['message']);
//       return;
//     }
//     setState(() {
//       items = response['data']['content']['variations'];
//     });
// // print(items);
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     Map name = ModalRoute.of(context)!.settings.arguments as Map;
//     // setState(() {
//     selectedCable = name["name"].toString().toLowerCase();
//     //  getPlans();
//     // });
//     getPlans();
//   }

  @override
  Widget build(BuildContext context) {
    Map name = ModalRoute.of(context)!.settings.arguments as Map;
    setState(() {
      selectedCable = name["name"].toString().toLowerCase();
      // trying to get the named parameter match how it is on this page
    });
    print(selectedCable);
    return Scaffold(
      appBar: const CustomAppBars(title: "Cable Tv"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ComponentSlideIns(
                    beginOffset: const Offset(2.0, 0.0),
                    duration: const Duration(milliseconds: 1200),
                    child: Column(
                      children: [
                        // method if were using Map images
                        //  CircleAvatar(
                        //   radius: 30,
                        //   backgroundImage:
                        //       AssetImage("${images[selectedCable]}"),
                        // ),
                        updateCable(),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${selectedCable.toUpperCase()} Subscription",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
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
                              duration: const Duration(milliseconds: 1100),
                              child: CustomTextField(
                                hintText: "Enter Decoder Number",
                                controller: numCt,
                                inputTitle: "Decoder Number",
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(-3.0, 0.0),
                              duration: const Duration(milliseconds: 1200),
                              child: CustomTextField(
                                onTap: () {
                                  setState(() {
                                    isActive = false;
                                  });
                                },
                                hintText: "Enter Bill Plans",
                                readOnly: true,
                                controller: billCt,
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 28,
                                  color: Colors.white,
                                ),
                                inputTitle: "Bill Plans",
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(-4, 0.0),
                              duration: const Duration(milliseconds: 1300),
                              child: CustomTextField(
                                hintText: "₦ 0.00",
                                readOnly: true,
                                controller: amountCt,
                                prefixIcon: const Icon(
                                  Icons.payment_outlined,
                                  color: Colors.white,
                                ),
                                inputTitle: "Amount",
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text("Äccount balance ₦10,000.00")
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                                height: 50.h,
                                child: ComponentSlideIns(
                                  beginOffset: const Offset(0, 4.0),
                                  duration: const Duration(milliseconds: 1200),
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 20,
                                              crossAxisSpacing: 20),
                                      // scrollDirection: Axis.horizontal,
                                      itemCount: items.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isActive = true;
                                              selectedItems = items[index];
                                              billCt.text =
                                                  selectedItems["title"];
                                              amountCt.text =
                                                  selectedItems["amount"];
                                            });

                                            // method 2 from  backend

                                            // setState(() {
                                            //   isActive = true;
                                            //   selectedItems = items[index];
                                            //   billCt.text =
                                            //       selectedItems["name"];
                                            //   amountCt.text = selectedItems[
                                            //       "variation_amount"];
                                            // });
                                          },
                                          child: Card(
                                            elevation: 5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  items[index]["title"],
                                                  // title=name in backend ---amount to changes {you're getting from api}
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  items[index]["amount"],
                                                  // "${Utilities().formatCurrency(items[index]['variation_amount'])}, ",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ))
                          ],
                        )
                ],
              ),
              ComponentSlideIns(
                  beginOffset: const Offset(0, 2.0),
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
