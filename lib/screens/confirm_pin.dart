import 'package:amp_up/imports.dart';

import 'package:flutter/material.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;

  late FocusNode focusnode1;
  late FocusNode focusnode2;
  late FocusNode focusnode3;
  late FocusNode focusnode4;

  AlertLoading loading = AlertLoading();
  AlertInfo info = AlertInfo();
  var refs;
  var pins;

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

  // void submit() {
  //   setSignUp();
  //   Navigator.pushNamed(context, "logIn");
  // }

  // void setSignUp() async {
  //   final SharedPreferences prefer = await SharedPreferences.getInstance();
  //   prefer.setBool("accountHolder", true);
  // }

  void submit() async {
    final pin1 = refs.watch(txPinProvider);
    final pin2 = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text;
    if (pin2 != pin1['pin1']) {
      info.message = 'Pin not match';
      pin1['pin1'];
      info.showAlertDialog(context);
      return;
    }
    loading.showAlertDialog(context);
    final response = await AuthController().createTxPin({'pin': pin2});
    loading.closeDialog(context);
    print(response);
    if (response['status'] == 'error') {
      info.message = response['message'];
      info.showAlertDialog(context);
      return;
    }

    // Navigator.pushNamed(context, "bvn");
    Navigator.pushNamed(context, "dashboard");
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: colorScheme.background,
        body: Center(
          child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                child: Consumer(builder: (context, ref, _) {
                  pins = ref.watch(txPinProvider);
                  refs = ref;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ComponentSlideIns(
                              beginOffset: const Offset(0, -2),
                              duration: const Duration(milliseconds: 1200),
                              child: Icon(
                                Icons.lock_person,
                                size: 60,
                                color: colorScheme.primary,
                              )),
                          const SizedBox(
                            height: 40,
                          ),
                          ComponentSlideIns(
                            beginOffset: const Offset(0, -2),
                            duration: const Duration(milliseconds: 1200),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Confirm the pin",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Just to be sure. Kindly re-enter your 4-digit PIN to confirm it.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Column(
                        children: [
                          ComponentSlideIns(
                            beginOffset: const Offset(-2, 0),
                            duration: const Duration(milliseconds: 1200),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PasswordInputBox(
                                    textController: controller1,
                                    focusnode: focusnode1,
                                    nextfocusnode: focusnode2),
                                const SizedBox(
                                  width: 20,
                                ),
                                PasswordInputBox(
                                    textController: controller2,
                                    prevfocusnode: focusnode1,
                                    focusnode: focusnode2,
                                    nextfocusnode: focusnode3),
                                const SizedBox(
                                  width: 20,
                                ),
                                PasswordInputBox(
                                    textController: controller3,
                                    prevfocusnode: focusnode2,
                                    focusnode: focusnode3,
                                    nextfocusnode: focusnode4),
                                const SizedBox(
                                  width: 20,
                                ),
                                PasswordInputBox(
                                  textController: controller4,
                                  prevfocusnode: focusnode3,
                                  focusnode: focusnode4,
                                  func: submit,
                                  isLast: true,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                })),
          ),
        ),
      ),
    );
  }
}
