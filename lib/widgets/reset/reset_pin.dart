import 'package:amp_up/imports.dart';

import 'package:flutter/material.dart';

class ResetPIN extends StatefulWidget {
  const ResetPIN({super.key});

  @override
  State<ResetPIN> createState() => _ResetPINState();
}

class _ResetPINState extends State<ResetPIN> {
  late TextEditingController? code;

  late TextEditingController? numEmail;

  late TextEditingController? password;

  bool isPasswordObscure = true;

  bool isConfirmPasswordObscure = true;

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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ComponentSlideIns(
                beginOffset: Offset(2, 0),
                duration: Duration(milliseconds: 1200),
                child: const Text(
                  "Reset PIN",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ComponentSlideIns(
                beginOffset: Offset(2, 0),
                duration: Duration(milliseconds: 1200),
                child: Text(
                  "To help protect you, please confirm the phone number registered on your Amp Up account and your date of birth",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
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
              SizedBox(
                height: 3.h,
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
                      color:
                          isPasswordObscure ? Colors.grey : colorScheme.primary,
                    ),
                  ),
                  controller: password,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
