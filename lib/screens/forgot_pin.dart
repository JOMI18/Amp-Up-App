import 'package:amp_up/imports.dart';
import 'package:amp_up/widgets/reset/reset_pin.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ForgotPin extends StatefulWidget {
  const ForgotPin({super.key});

  @override
  State<ForgotPin> createState() => _ForgotPinState();
}

class _ForgotPinState extends State<ForgotPin> {
  int currentStep = 0;

  final List<Map<String, dynamic>> steps = [
    {'widget': const ResetPIN(), 'title': 'Reset PIN'},
    {'widget': const VerifyNumber(), 'title': 'Code Verification'},
    {'widget': const CreatePassword(), 'title': 'Create Password'},
    {'widget': const ConfirmPassword(), 'title': 'Confirm Password'},
  ];

  void nextStep() {
    setState(() {
      if (currentStep < steps.length - 1) {
        currentStep++;
      } else {
        Navigator.pushNamed(context, "logIn");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    String appBarTitle = steps[currentStep]['title'];
    return Scaffold(
      bottomNavigationBar: ComponentSlideIns(
        beginOffset: Offset(0, 4),
        duration: Duration(milliseconds: 600),
        child: BottomAppBar(
            color: colorScheme.background,
            surfaceTintColor: Colors.transparent,
            child: Btns().btn(
                context,
                currentStep == steps.length - 1 ? 'Finish' : 'Continue',
                nextStep)),
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              // showHelpPopup(context);
            },
            child: const CircleAvatar(
              radius: 13,
              child: Icon(Icons.question_mark_outlined,
                  size: 16, color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
            color: colorScheme.primary,
          ),
        ),
        title: Text(appBarTitle,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: (currentStep + 1) / steps.length,
            backgroundColor: Colors.grey[300],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: steps[currentStep]['widget'],
          ),
        ],
      ),
    );
  }
}
