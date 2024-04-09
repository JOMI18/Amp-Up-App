import 'package:flutter/material.dart';

import 'package:amp_up/imports.dart';

class BvnVerification extends StatefulWidget {
  const BvnVerification({super.key});

  @override
  State<BvnVerification> createState() => _BvnVerificationState();
}

class _BvnVerificationState extends State<BvnVerification> {
  TextEditingController bvnCt = TextEditingController();
  TextEditingController dobCt = TextEditingController();
  AlertLoading loading = AlertLoading();
  AlertInfo info = AlertInfo();
  DateTime? selectedDate;

  void submit(ref) async {
    // Perform validation
    String bvn = bvnCt.text;
    if (bvn == "") {
      info.message = "Field can't be empty";
      info.showAlertDialog(context);
      return;
    }
    // String dob = selectedDate?=null? selectedDate.toString():"";
    loading.showAlertDialog(context);
    final response = await AuthController().verifyBvn({"bvn": bvn});
    loading.closeDialog(context);

    if (response['status'] == 'error') {
      info.message = response['message'];
      info.showAlertDialog(context);
      return;
    }
    final data = ref.watch(signUpProvider);
    data["phone"] = response["phone"];
    ref.read(signUpProvider.notifier).state = data;
    ref.read(goToProvider.notifier).state = "dashboard";
    ref.read(bvnProvider.notifier).state = true;

    Navigator.pushNamed(context, "verifyNumber");
    // Navigator.pushNamedAndRemoveUntil(context, "verifyNumber", (route)=> false);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.input,
      helpText: "Select a date",
      errorFormatText: "Enter valid date",
      errorInvalidText: "Enter date in a valid range",
      fieldLabelText: "Date of Birth",
      fieldHintText: "Month/Date/Year",
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = DateTime(picked.year, picked.month, picked.day);
        dobCt.text = "${picked.year}/${picked.month}/${picked.day}";
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bvnCt.dispose();
    dobCt.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
          child: Consumer(builder: (context, ref, _) {
            final user = ref.watch(userProvider);
            final name = ref.watch(signUpProvider);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ComponentSlideIns(
                      beginOffset: const Offset(-2, 0),
                      duration: const Duration(milliseconds: 1200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "BVN Verification",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Icon(
                            Icons.security,
                            size: 60,
                            color: Utilities().appColors(context).primary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ComponentSlideIns(
                      beginOffset: const Offset(2, 0),
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        "Let's verify your BVN, ${name["first_name"] ?? user.firstName}!",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ComponentSlideIns(
                      beginOffset: const Offset(-2, 0),
                      duration: const Duration(milliseconds: 1200),
                      child: CustomTextField(
                        hintText: 'xxxxxxxxxxxx',
                        inputTitle: "BVN",
                        controller: bvnCt,
                        keyboardType: TextInputType.phone,
                        prefixIcon: GestureDetector(
                          onTap: () {
                            print("being tapped");
                            // _selectDate(context);
                          },
                          child: const Icon(
                            Icons.domain_verification,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ComponentSlideIns(
                  beginOffset: const Offset(0, 3),
                  duration: const Duration(milliseconds: 1200),
                  child: Btns().btn(context, "Submit", () {
                    submit(ref);
                  }),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
