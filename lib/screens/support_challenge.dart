import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  late TextEditingController? complaint;
  late TextEditingController? description;
  late TextEditingController? subject;

  @override
  void initState() {
    super.initState();
    complaint = TextEditingController();
    description = TextEditingController();
    subject = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    complaint!.dispose();
    description!.dispose();
    subject!.dispose();
  }

  void dropdownmsg() {
    List item = [
      {
        "title": "Funds Transfer",
      },
      {
        "title": "Bills / Airtime",
      },
      {
        "title": "Savings / Investment",
      },
    ];
    showDropdownMenu(
        context,
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: item.map((e) {
              return Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          complaint!.text = e["title"];
                          Navigator.pop(context);
                        },
                        child: Text(
                          e["title"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              );
            }).toList(),
          ),
        ),
        200);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: const CustomAppBars(title: "Report a challenge"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Complete this form to help us address your query",
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    ComponentSlideIns(
                        beginOffset: const Offset(2.0, 0.0),
                        child: CustomTextField(
                          controller: complaint,
                          onTap: () {
                            dropdownmsg();
                          },
                          hintText: "Complaint Category",
                          inputTitle: "Complaint Category ",
                          readOnly: true,
                          suffixIcon: Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 32,
                            color: Colors.white,
                          ),
                          contentPadding: const EdgeInsets.all(15),
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    ComponentSlideIns(
                        beginOffset: const Offset(-2.0, 0.0),
                        child: CustomTextField(
                          controller: subject,
                          hintText: "Subject",
                          inputTitle: "Subject",
                          contentPadding: const EdgeInsets.all(15),
                        )),
                    SizedBox(
                      height: 3.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 20.h,
                          child: ComponentSlideIns(
                            beginOffset: const Offset(4.0, 0.0),
                            duration: const Duration(milliseconds: 1400),
                            child: TextField(
                              maxLines: null,
                              controller: description,
                              expands: true,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                hintText: "Tell us what happened",
                                contentPadding: const EdgeInsets.all(10),
                                hintStyle: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 208, 208, 208),
                                    fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: Color.fromARGB(90, 221, 221, 221),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: ComponentSlideIns(
                              beginOffset: const Offset(-4.0, 0.0),
                              duration: const Duration(milliseconds: 1000),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: colorScheme.primary,
                                    width: 2,
                                  ),
                                  color: colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cloud_upload,
                                      size: 40,
                                      color: colorScheme.primary,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Tap to upload transaction image',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Btns().btn(context, "Submit", () {})
          ],
        ),
      ),
    );
  }
}
