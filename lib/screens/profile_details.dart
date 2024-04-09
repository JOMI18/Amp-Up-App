import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

// Icons.arrow_forward_ios
class ProfileInfo extends StatefulWidget {
  ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  void confirmClose() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
              icon: (Icons.delete_sweep_rounded),
              iconColor: const Color.fromARGB(255, 255, 17, 0),
              title: "Close Account",
              content: ComponentSlideIns(
                beginOffset: const Offset(-2.0, 0.0),
                duration: const Duration(milliseconds: 1200),
                child: const Text(
                  "You are about to delete your profile. Please note that when you delete your profile your previous transactions are not deleted",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: popUpButtonStyle(),
                        child: const Text("Close Account",
                            style: TextStyle(fontWeight: FontWeight.w900)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: popUpButtonStyle(),
                        child: const Text("Not now",
                            style: TextStyle(fontWeight: FontWeight.w900)),
                      ),
                    ],
                  ),
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    // ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            surfaceTintColor: Colors.transparent,
            elevation: 2,
            child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          icon: (Icons.warning_rounded),
                          iconColor: Colors.amberAccent,
                          title: "Are you sure you want to close your account?",
                          content: Column(children: [
                            ComponentSlideIns(
                              beginOffset: const Offset(4.0, 0.0),
                              duration: const Duration(milliseconds: 600),
                              child: const Text(
                                "Please give us 1 working day to review this request so that we can:",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 55, 55, 55)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(4.0, 0.0),
                              duration: const Duration(milliseconds: 700),
                              child: const Text(
                                "1)  Ensure adherence to CBN regulations around transaction history",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 55, 55, 55)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(4.0, 0.0),
                              duration: const Duration(milliseconds: 800),
                              child: const Text(
                                "2)  Ensure there is no balance remaining on your account or loan repayments to be settled",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 55, 55, 55)),
                              ),
                            ),
                          ]),
                          actions: [
                            Column(
                              children: [
                                ComponentSlideIns(
                                    beginOffset: const Offset(0.0, 3.0),
                                    duration: const Duration(milliseconds: 700),
                                    child:
                                        Btns().trnsBtn(context, "Continue", () {
                                      Navigator.of(context).pop();
                                      confirmClose();
                                    })),
                                const SizedBox(
                                  height: 8,
                                ),
                                ComponentSlideIns(
                                    beginOffset: const Offset(0.0, 2.0),
                                    duration: const Duration(milliseconds: 800),
                                    child: Btns().btn(
                                      context,
                                      "Keep account Open",
                                      () {
                                        Navigator.of(context).pop();
                                      },
                                    )),
                              ],
                            ),
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: const Size(50, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  foregroundColor: const Color.fromARGB(255, 213, 3, 3),
                ),
                icon: const Icon(Icons.delete),
                label: const Text("Close Account"))),
        appBar: const CustomAppBars(
          title: "Profile",
        ),
        body: SingleChildScrollView(child: ProfileDetailsBody()));
  }
}
