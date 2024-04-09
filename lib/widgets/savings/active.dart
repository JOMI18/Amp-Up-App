import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class Active extends StatelessWidget {
  const Active({super.key, required this.colorScheme});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: ComponentSlideIns(
        beginOffset: const Offset(4.0, 0.0),
        duration: const Duration(milliseconds: 1400),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Container(
                  height: 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                  width: 550,
                  decoration: BoxDecoration(
                    // boxShadow: Box,
                    borderRadius: BorderRadius.circular(10.0),

                    color: colorScheme.primary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Balance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "₦ 0",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                colorScheme.secondary.withOpacity(0.9),
                            // foregroundColor: Colors.white,
                            elevation: 5,
                            fixedSize: const Size(120, 40),
                            padding: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        child: Text(
                          "Get a Loan",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: colorScheme.primary,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                ComponentSlideIns(
                  beginOffset: const Offset(-6.0, 0.0),
                  duration: const Duration(milliseconds: 1200),
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    child: SizedBox(
                      width: 600,
                      height: 350,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: colorScheme.surfaceVariant,
                              radius: 50,
                              child: Icon(
                                Icons.savings_outlined,
                                size: 70,
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "No Savings Created Yet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 56, 56, 56),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "When you save, the details of your plan will appear here",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 56, 56, 56),
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: Colors.white,
                                  elevation: 5,
                                  fixedSize: const Size(500, 60),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              child: const Text(
                                "Create a Savings Plan",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            )
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
    );
  }
}
