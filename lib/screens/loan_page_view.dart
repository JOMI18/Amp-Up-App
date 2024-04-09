import 'package:amp_up/imports.dart';
import 'package:flutter/material.dart';

class LoanPageView extends StatefulWidget {
  const LoanPageView({Key? key}) : super(key: key);

  @override
  State<LoanPageView> createState() => _LoanPageViewState();
}

class _LoanPageViewState extends State<LoanPageView> {
  final PageController _loanController = PageController();

  final List<List<Map<String, String>>> pages = [
    [
      {
        "title": "Provide a bank statement",
      },
      {
        "title": "Have a good credit & repayment history",
      },
      {
        "title": "Update your profile information",
      },
      {"title": "Transact more with AMP Up"}
    ],
    [
      {
        "title":
            "Choose a loan offer and the repayment period to see your payment plan",
      },
      {
        "title":
            "You can set up to ₦30k on your first loan and up to ₦1M on subsequent loans",
      },
      {
        "title": "Loan offers are based on your repayment and credit profile",
      },
    ],
    [
      {
        "title":
            "Add your other bank card to get your funds in your AMP Up account",
      },
      {
        "title":
            "Ensure your loan repayments are made on time. Fees apply for late repayment",
      },
      {
        "title": "Enjoy your AMP Up loan!",
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: PageView.builder(
        controller: _loanController,
        scrollDirection: Axis.horizontal,
        itemCount: pages.length,
        itemBuilder: (context, pageIndex) {
          return buildPage(context, pageIndex, colorScheme);
        },
      ),
      floatingActionButton: CircleAvatar(
        radius: 14,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: const Color.fromARGB(217, 172, 172, 172),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(
            Icons.close,
            size: 20,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget buildPage(
      BuildContext context, int pageIndex, ColorScheme colorScheme) {
    return Column(
      children: [
        Container(
          height: 48.h,
          width: 96.w,
          child: Image.asset(
            pageIndex == 0
                ? "lib/assets/images/page-view/img1.jpg"
                : pageIndex == 1
                    ? "lib/assets/images/page-view/img2.jpg"
                    : "lib/assets/images/page-view/img3.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          child: SmoothPageIndicator(
            controller: _loanController,
            count: pages.length,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Welcome guide",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          pageIndex == 0
              ? "Apply for a Loan"
              : pageIndex == 1
                  ? "Accept Offer"
                  : "Repay your Loan",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: pages[pageIndex].length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 14,
                  child: Icon(
                    Icons.check,
                    color: Theme.of(context).iconTheme.color,
                    size: 18,
                  ),
                ),
                title: Text(
                  pages[pageIndex][index]["title"]!,
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
        pageIndex == pages.length - 1
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Btns().btn(context, "Finish", () {}),
              )
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.secondary.withOpacity(0.7),
                        foregroundColor: Theme.of(context).iconTheme.color,
                        elevation: 5,
                        fixedSize: const Size(100, 60),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Back"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        fixedSize: const Size(260, 60),
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Next"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_right_alt_outlined)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
