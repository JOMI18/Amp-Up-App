import 'package:amp_up/imports.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AlreadySignedIn extends StatefulWidget {
  const AlreadySignedIn({super.key});

  @override
  State<AlreadySignedIn> createState() => _AlreadySignedInState();
}

class _AlreadySignedInState extends State<AlreadySignedIn> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;

  late FocusNode focusnode1;
  late FocusNode focusnode2;
  late FocusNode focusnode3;
  late FocusNode focusnode4;

  final dio = Dio();

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    focusnode1 = FocusNode();
    focusnode2 = FocusNode();
    focusnode3 = FocusNode();
    focusnode4 = FocusNode();

    focusnode1.requestFocus();
  }

  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    focusnode1.dispose();
    focusnode2.dispose();
    focusnode3.dispose();
    focusnode4.dispose();
  }

  void submit() async {
    Navigator.pushNamed(context, "dashboard");
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const WelcomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ComponentSlideIns(
                        beginOffset: const Offset(0, -4),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back, Jonathan Smith!",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Enter your pin to continue to your Amp Up account",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  surfaceTintColor: Colors.transparent,
                  elevation: 5,
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 32,
                      child: Icon(Icons.account_circle,
                          size: 60, color: Theme.of(context).iconTheme.color)),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                ComponentSlideIns(
                  beginOffset: const Offset(4, 0),
                  duration: const Duration(milliseconds: 1200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PasswordInputBox(
                        textController: controller1,
                        focusnode: focusnode1,
                        nextfocusnode: focusnode2,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      PasswordInputBox(
                        textController: controller2,
                        focusnode: focusnode2,
                        nextfocusnode: focusnode3,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      PasswordInputBox(
                        textController: controller3,
                        focusnode: focusnode3,
                        nextfocusnode: focusnode4,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      PasswordInputBox(
                        textController: controller4,
                        focusnode: focusnode4,
                        isLast: true,
                        func: submit,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "forgotPin");
                  },
                  child: Text(
                    "Forgot PIN?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.fingerprint_rounded,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ComponentSlideIns(
                  beginOffset: const Offset(0, 4),
                  duration: const Duration(milliseconds: 1200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not Jonathan?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            SlideAnimation(
                              page: const SignOutAlert(),
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            ),
                          );
                        },
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
