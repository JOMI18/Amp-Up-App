import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class ActiveSignUp extends StatefulWidget {
  ActiveSignUp({super.key});

  @override
  State<ActiveSignUp> createState() => _ActiveSignUpState();
}

class _ActiveSignUpState extends State<ActiveSignUp> {
  late TextEditingController? firstNameCt;
  late TextEditingController? lastNameCt;
  late TextEditingController? dobCt;
  late TextEditingController? genderCt;
  late TextEditingController? countryCt;
  late TextEditingController? username;

  void showGenderTab(ref) {
    String selectedGender = ref.watch(genderProvider);
    final List<Map<String, dynamic>> gender = [
      {
        "title": "Male",
      },
      {
        "title": "Female",
      }
    ];
    showDropdownMenu(
        context,
        Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 14, 14, 0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: gender.map(
                (gen) {
                  bool isSelected = selectedGender == '${gen["title"]}';
                  return GestureDetector(
                    onTap: () {
                      ref.read(genderProvider.notifier).state =
                          '${gen["title"]}';

                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.add_circle_rounded,
                          color: isSelected ? Colors.green : Colors.blueGrey,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          gen["title"],
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              ).toList()),
        ),
        120);
  }

  void sendFormData(ref) {
    if (firstNameCt!.text == '' ||
        lastNameCt!.text == '' ||
        dobCt!.text == '' ||
        username!.text == '' ||
        genderCt!.text == '') {
      AlertInfo alert = AlertInfo();

      alert.message = "Fill all fields";
      alert.showAlertDialog(context);
      return;
    }

    ref.read(signUpProvider.notifier).state = {
      "first_name": firstNameCt!.text,
      "last_name": lastNameCt!.text,
      "date_of_birth": dobCt!.text,
      "username": username!.text,
      "gender": genderCt!.text,
    };

    Navigator.of(context).push(SlideAnimation(page: SignUpPasswordScreen()));
  }

  @override
  void initState() {
    super.initState();
    firstNameCt = TextEditingController();
    lastNameCt = TextEditingController();
    dobCt = TextEditingController();
    genderCt = TextEditingController();
    countryCt = TextEditingController();
    username = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameCt!.dispose();
    lastNameCt!.dispose();
    dobCt!.dispose();
    genderCt!.dispose();
    countryCt!.dispose();
    username!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const CustomAppBars(
        title: "Hello, Create An Account",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Consumer(
          builder: (context, ref, _) {
            var date = ref.watch(dobProvider);
            dobCt!.text = date.toString();
            genderCt!.text = ref.watch(genderProvider);
            return Column(
              children: [
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const TopSection(),
                        SizedBox(
                          height: 3.h,
                        ),
                        Form(
                            child: Column(
                          children: [
                            ComponentSlideIns(
                              beginOffset: const Offset(2, 0),
                              child: CustomTextField(
                                hintText: 'John',
                                inputTitle: "First Name",
                                controller: firstNameCt,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(-2, 0),
                              duration: const Duration(milliseconds: 1200),
                              child: CustomTextField(
                                hintText: 'Smith',
                                inputTitle: "Surname / Last Name",
                                controller: lastNameCt,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(2, 0),
                              duration: const Duration(milliseconds: 1200),
                              child: CustomTextField(
                                hintText: 'Johnny',
                                inputTitle: "Username",
                                controller: username,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(-2, 0),
                              duration: const Duration(milliseconds: 1200),
                              child: CustomTextField(
                                readOnly: true,
                                onTap: () {
                                  showCalendarPicker(
                                    context,
                                  );
                                },
                                hintText: 'mm/dd/yyyy',
                                inputTitle: "Date of Birth",
                                controller: dobCt,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    showCalendarPicker(
                                      context,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ComponentSlideIns(
                              beginOffset: const Offset(2, 0),
                              duration: const Duration(milliseconds: 1200),
                              child: CustomTextField(
                                onTap: () {
                                  showGenderTab(ref);
                                },
                                readOnly: true,
                                hintText: 'Gender',
                                inputTitle: "Gender",
                                controller: genderCt,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    showGenderTab(ref);
                                  },
                                  child: const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ComponentSlideIns(
                    beginOffset: const Offset(0, 2),
                    duration: const Duration(milliseconds: 1200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              text: "By continuing, you accept our ",
                              children: [
                                TextSpan(
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.primary),
                                    text: " Terms of Service "),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Text tapped!');
                                      },
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    text: " and "),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Text tapped!');
                                      },
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.primary),
                                    text: " Privacy Policy."),
                              ]),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Btns().btn(context, "Continue", () {
                          sendFormData(ref);
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "logIn");
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
