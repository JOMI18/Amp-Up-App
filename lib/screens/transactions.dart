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
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    // Initialize _currentIndex to 0 when the widget is first created
    // _currentIndex = widget.param;
    _currentIndex = 0;
  }

  String getTitle(int index) {
    return index == 0
        ? "Transactions"
        : index == 1
            ? "Commissions"
            : "";
  }

  @override
  Widget build(BuildContext context) {
    // ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle(_currentIndex)), // Set the title dynamically
        centerTitle: true,
        titleSpacing: 20,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromARGB(146, 167, 167, 167),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
          child: CustomTabBar(
        tabTitles: const [
          "Transactions",
          "Commissions",
        ],
        tabViews: [
          TransTab(),
          CommissTab(),
        ],
        onTabChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex, // Pass currentIndex to CustomTabBar
      )),
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
