import 'package:amp_up/imports.dart';

import 'package:flutter/material.dart';

class BillTabs extends StatelessWidget {
  BillTabs({super.key});
  final List items = [
    {
      "mainIcon": Icons.wifi,
      "mainTitle": "Internet Data",
      "avatarColor": const Color.fromARGB(255, 43, 0, 255),
      "route": "",
    },
    {
      "mainIcon": Icons.tv_rounded,
      "mainTitle": "Cable TV ",
      "avatarColor": const Color.fromARGB(255, 255, 0, 111),
      "route": "",
    },
    {
      "mainIcon": Icons.lightbulb_outline_sharp,
      "mainTitle": "Electricity",
      "avatarColor": const Color.fromARGB(255, 239, 68, 255),
      "route": "",
    },
    {
      "mainIcon": Icons.card_membership_outlined,
      "mainTitle": "JAMB Pin",
      "avatarColor": Colors.amberAccent,
      "route": "",
    },
    {
      "mainIcon": Icons.sports_basketball,
      "mainTitle": "Sports Betting",
      "avatarColor": Colors.green.shade700,
      "route": "",
    },
    {
      "mainIcon": Icons.book,
      "mainTitle": "Waec Pin",
      "avatarColor": const Color.fromARGB(255, 47, 0, 129),
      "route": "",
    },
    {
      "mainIcon": Icons.car_repair,
      "mainTitle": "Transport",
      "avatarColor": const Color.fromARGB(255, 129, 37, 0),
      "route": "",
    },
    {
      "mainIcon": Icons.add,
      "mainTitle": "Religion",
      "avatarColor": const Color.fromARGB(255, 0, 108, 129),
      "route": "",
    },
    {
      "mainIcon": Icons.airplanemode_on,
      "mainTitle": "Airline ",
      "avatarColor": Colors.pinkAccent,
      "route": "",
    },
    {
      "mainIcon": Icons.account_balance,
      "mainTitle": "Loans & MFBs ",
      "avatarColor": const Color.fromARGB(255, 5, 75, 0),
      "route": "",
    },
    {
      "mainIcon": Icons.add_card_rounded,
      "mainTitle": "Products & Services ",
      "avatarColor": const Color.fromARGB(255, 0, 51, 255),
      "route": "",
    },
    {
      "mainIcon": Icons.add_moderator_sharp,
      "mainTitle": "Insurance ",
      "avatarColor": Color.fromARGB(255, 0, 180, 15),
      "route": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        screenWidth ~/ 120; // Calculate cross-axis count based on item width
    double itemWidth =
        (screenWidth - 12 * (crossAxisCount + 1)) / crossAxisCount;
    return Scaffold(
      appBar: const CustomAppBars(title: "Pay a bill"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Make Payment",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, // Adjust vertical padding as needed
                      horizontal: 40, // Adjust horizontal padding as needed
                    ),
                    filled: true,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    fillColor: Colors.grey.shade200,
                    hintText: "Search by biller name",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 133, 133, 133),
                    ),
                    prefixIcon: GestureDetector(
                      child: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 65, 65, 65),
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 200,
                width: 400,
                child: ComponentSlideIns(
                  beginOffset: Offset(-4.0, 0),
                  duration: Duration(milliseconds: 1200),
                  child: Card(
                    elevation: 4,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            // backgroundColor: Color.fromARGB(228, 211, 231, 255),
                            radius: 50,
                            child: Icon(
                              Icons.credit_card,
                              color: Theme.of(context).iconTheme.color,
                              size: 70,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text("No recent payment",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 10),
                          Text("You have not made any payment recently ",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade800)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                surfaceTintColor: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6, 15, 6, 36),
                  child: SizedBox(
                    height: 420,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 12),
                          child: const Text("Billers",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                        ),
                        Expanded(
                          child: ComponentSlideIns(
                            beginOffset: Offset(0.0, 4.0),
                            duration: Duration(milliseconds: 1400),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                // crossAxisCount: 3,
                                childAspectRatio: (itemWidth /
                                    100), // Adjust item height based on width
                                crossAxisCount: crossAxisCount,

                                mainAxisSpacing: 20,
                                crossAxisSpacing: 0,
                              ),
                              itemCount: items.length,
                              itemBuilder: ((context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, items[index]["route"]);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.grey.shade500,
                                            )),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: items[index]
                                                  ["avatarColor"],
                                              foregroundColor: Colors.white,
                                              radius: 18,
                                              child: Icon(
                                                items[index]["mainIcon"],
                                                size: 24,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(items[index]["mainTitle"],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 12)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
