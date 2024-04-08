import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class Transactions extends StatefulWidget {
  Transactions({
    super.key,
  });

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  int selectedIndex = 0;

  final List<String> tabTitles = ["Transactions", "Commission"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // child: TabBarsViews(
          //   title: tabTitles[selectedIndex],
          //   tabTitles: tabTitles,
          //   tabViews: [
          //     const TransTab(),
          //     const CommissTab(),
          //   ],
          //   onTabChanged: (index) {
          //     setState(() {
          //       selectedIndex = index;
          //     });
          //   },
          // ),
          ),
    );
  }
}

class TransTab extends StatelessWidget {
  const TransTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: ComponentSlideIns(
                beginOffset: const Offset(4.0, 0.0),
                duration: const Duration(milliseconds: 1100),
                child: Column(
                  children: [
                    SizedBox(
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, // Adjust vertical padding as needed
                              horizontal:
                                  40, // Adjust horizontal padding as needed
                            ),
                            filled: true,
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            fillColor: Colors.grey.shade200,
                            hintText: "Search Transaction",
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 133, 133, 133),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 65, 65, 65),
                              size: 25,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 500,
                      width: 400,
                      child: ComponentSlideIns(
                        beginOffset: const Offset(4.0, 0),
                        duration: const Duration(milliseconds: 1200),
                        child: Card(
                          elevation: 4,
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  // backgroundColor: Color.fromARGB(228, 211, 231, 255),
                                  radius: 50,
                                  child: Icon(
                                    Icons.transcribe,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 70,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text("No recent transaction",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 10),
                                Text("You have no new notifications",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade800)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommissTab extends StatelessWidget {
  const CommissTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: ComponentSlideIns(
                beginOffset: const Offset(4.0, 0.0),
                duration: const Duration(milliseconds: 1100),
                child: Column(
                  children: [
                    SizedBox(
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, // Adjust vertical padding as needed
                              horizontal:
                                  40, // Adjust horizontal padding as needed
                            ),
                            filled: true,
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            fillColor: Colors.grey.shade200,
                            hintText: "Search Commission",
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 133, 133, 133),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 65, 65, 65),
                              size: 25,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 500,
                      width: 400,
                      child: ComponentSlideIns(
                        beginOffset: const Offset(4.0, 0),
                        duration: const Duration(milliseconds: 1200),
                        child: Card(
                          elevation: 4,
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  // backgroundColor: Color.fromARGB(228, 211, 231, 255),
                                  radius: 50,
                                  child: Icon(
                                    Icons.transcribe,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 70,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text("No recent Commision",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 10),
                                Text("You have no new Commission",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade800)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
