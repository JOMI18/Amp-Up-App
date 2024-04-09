import 'package:amp_up/imports.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // void setLogin() async {
  //   final SharedPreferences prefer = await SharedPreferences.getInstance();
  //   prefer.setBool("loggedIn", true);
  // }

  late TextEditingController? code;
  late TextEditingController? numEmail;
  late TextEditingController? password;

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  void submit(ref) async {
    print("clicked");
    AlertInfo alertInfo = AlertInfo();
    AlertLoading loading = AlertLoading();
    Utilities utilities = Utilities();
    Map info = await utilities.devicePlatform;

    if (numEmail!.text == "" || password!.text == "") {
      alertInfo.message = "Fill all required fields";
      alertInfo.showAlertDialog(context);
      return;
    }
    loading.showAlertDialog(context);
    final response = await AuthController().login({
      "email_or_phone": numEmail!.text,
      "password": password!.text,
      "device_model": info["model"],
      "device_id": info["id"],
    });
    loading.closeDialog(context);

    if (response['token'] != null) {
      SharedPreferences pref;
      pref = await SharedPreferences.getInstance();
      pref.setString("token", response['token']);
    }
    print(response['token']);

    if (response['status'] == "error" &&
        response["otp"] == false &&
        (response["bvn"] == false || response["bvn"] == null)) {
      alertInfo.message = response['message'];
      alertInfo.showAlertDialog(context);
      return;
    } else if (response['status'] == "error" && response["bvn"] == true) {
      ref.read(userProvider.notifier).state =
          UserModel.fromJson(response["user"]);
      ref.read(reasonProvider.notifier).state = response["message"];
      Navigator.of(context).pop();
      Navigator.pushNamed(context, "bvn");
      return;
    } else if (response['status'] == "error" && response["otp"] == false) {
      print(response);

      ref.read(userProvider.notifier).state =
          UserModel.fromJson(response["user"]);
      ref.read(reasonProvider.notifier).state = response["message"];
      Navigator.pushNamed(context, "verifyNumber");
      return;
    } else if (response['status'] == "ok") {
      final user = UserModel.fromJson(response["user"]);
      ref.read(userProvider.notifier).state = user;
      Navigator.pushNamedAndRemoveUntil(
        context,
        "dashboard",
        (route) => false,
      );
      print(response['user']);
    }
  }

  @override
  void initState() {
    super.initState();
    code = TextEditingController();
    numEmail = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    code!.dispose();
    numEmail!.dispose();
    password!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const WelcomeAppBar(),
      bottomNavigationBar: ComponentSlideIns(
        beginOffset: const Offset(0, 2),
        child: BottomAppBar(
            color: colorScheme.background,
            surfaceTintColor: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  " Don't have a Amp Up account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      SlideAnimation(
                        page: ActiveSignUp(),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary),
                  ),
                ),
              ],
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 16),
        child: Consumer(
          builder: (context, ref, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ComponentSlideIns(
                      beginOffset: const Offset(2, 0),
                      duration: const Duration(milliseconds: 1200),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome to Amp Up",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Complete your details below to continue your Amp Up account",
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
                    const SizedBox(
                      height: 20,
                    ),
                    ComponentSlideIns(
                      beginOffset: const Offset(-2, 0),
                      duration: const Duration(milliseconds: 1200),
                      child: CustomTextField(
                        hintText: 'number/email',
                        inputTitle: "Phone number or Email",
                        controller: numEmail,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ComponentSlideIns(
                      beginOffset: const Offset(2, 0),
                      duration: const Duration(milliseconds: 1200),
                      child: CustomTextField(
                        hintText: 'xxxxxxxxx',
                        inputTitle: "Password",
                        obscureText: isPasswordObscure,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordObscure = !isPasswordObscure;
                            });
                          },
                          child: Icon(
                            isPasswordObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: isPasswordObscure
                                ? Colors.grey
                                : colorScheme.primary,
                          ),
                        ),
                        controller: password,
                      ),
                    ),
                  ],
                ),
                Btns().btn(context, "Submit", () {
                  submit(ref);
                })
              ],
            );
          },
        ),
      ),
    );
  }
}
