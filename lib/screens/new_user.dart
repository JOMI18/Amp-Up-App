import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class NewUser extends StatefulWidget {
  const NewUser({super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  void newAppUser() async {
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setBool("newUser", false);

    Navigator.pushNamed(context, "signUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utilities().appColors(context).background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ComponentSlideIns(
                  beginOffset: const Offset(0, -2),
                  child: Image.asset(
                    "lib/assets/images/logo--sm.png",
                    height: 28.h,
                  ),
                ),
                ComponentSlideIns(
                  beginOffset: const Offset(2, 0),
                  child: Lottie.asset(
                    "lib/assets/images/lottie/newUser.json",
                    height: 30.h,
                  ),
                ),
                ComponentSlideIns(
                    beginOffset: const Offset(-2, 0),
                    child: Container(
                      width: 95.w,
                      child: const Text(
                        "Instantly buy Data-bundle and Airtime, Pay Electricity and Cable/TV bills, Convert Airtime to Cash, Transfer to Nigerian Bank Accounts and Save money.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                        softWrap: true,
                        maxLines: null,
                      ),
                    )),
                ComponentSlideIns(
                    beginOffset: const Offset(0, 2),
                    child: Btns().btn(context, "Get Started", newAppUser))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
