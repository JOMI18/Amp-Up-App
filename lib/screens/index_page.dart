import 'package:flutter/material.dart';

import 'package:amp_up/imports.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late SharedPreferences prefer;

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(milliseconds: 7000), () => {initializePreferences()});
  }

  void initializePreferences() async {
    prefer = await SharedPreferences.getInstance();
    navigateUser();
  }

  void navigateUser() {
    bool? isDataNew = prefer.getBool("newUser");

    // print(isDataNew);

    if (isDataNew == null || isDataNew) {
      Navigator.of(context).push(
        SlideAnimation(
          page: const NewUser(),
        ),
      );
    } else {
      bool? isDataSignedUp = prefer.getBool("accountHolder");
      // print(isDataSignedUp);
      print("Value of 'newUser' in SharedPreferences: $isDataNew");
      // prefer.clear();
      if (isDataSignedUp == true) {
        setLogin();
      } else {
        Navigator.pushNamed(context, "signUp");
        // Navigator.pushNamed(context, "newUser");
      }
    }
  }

  void setLogin() {
    bool? isDataLoggedIn = prefer.getBool("loggedIn");
    if (isDataLoggedIn == true) {
      Navigator.pushNamed(context, "alreadySignedIn");
    } else {
      Navigator.pushNamed(context, "logIn");
    }
  }

  void clearSharedPreferences() async {
    prefer = await SharedPreferences.getInstance();

    prefer.setBool("newUser", false); // Set the "newUser" key to false
    print(prefer.getBool("newUser"));

    prefer.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utilities().appColors(context).background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ComponentSlideIns(
              beginOffset: const Offset(0, -2),
              child: Image.asset(
                "lib/assets/images/amp-up-logo.png",
                height: 50.h,
              ),
            ),
            GestureDetector(
                onTap: clearSharedPreferences,
                child: const Text("Clear new user status")),
          ],
        ),
      ),
    );
  }
}
