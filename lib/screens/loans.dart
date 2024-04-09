import 'package:amp_up/imports.dart';

import 'package:flutter/material.dart';

class Loans extends StatelessWidget {
  const Loans({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: CustomAppBars(
        title: "Loans",
        trailing: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Color.fromARGB(255, 87, 87, 87),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "support");
              },
              child: const Icon(
                Icons.question_mark_outlined,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ComponentSlideIns(
                beginOffset: const Offset(0.0, -4.0),
                duration: const Duration(milliseconds: 1400),
                child: SizedBox(
                  height: 120,
                  width: 500,
                  child: Card(
                    elevation: 4,
                    color: colorscheme.secondary,
                    surfaceTintColor: colorscheme.surfaceTint,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total left to pay",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "₦0",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                child: ComponentSlideIns(
                  beginOffset: const Offset(4.0, 0.0),
                  duration: const Duration(milliseconds: 1200),
                  child: SizedBox(
                    height: 45.h,
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      surfaceTintColor: colorscheme.surfaceTint,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.monetization_on,
                                size: 80, color: colorscheme.primary),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "You do not currently have an active loan. Upgrade to KYC L2 and above to apply for a loan.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 56, 56, 56),
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Btns().btn(context, "Get a Loan", () {})
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ComponentSlideIns(
                beginOffset: const Offset(0.0, 4.0),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upgrade to KYC",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: colorscheme.primary,
                              letterSpacing: -0.2),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Upgrade to KYC to be able to apply and get loan offers.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 56, 56, 56),
                              fontSize: 15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Upgrade to KYC",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: colorscheme.primary,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        )
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
