import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class Data extends StatelessWidget {
  const Data({super.key});
  @override
  Widget build(BuildContext context) {
    ColorScheme Colorscheme = Theme.of(context).colorScheme;
    return
     SingleChildScrollView(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Beneficiary phone number",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, // Adjust vertical padding as needed
                            horizontal:
                                40, // Adjust horizontal padding as needed
                          ),
                          filled: true,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          fillColor: Colors.grey.shade200,
                          hintText: " Enter phone number",
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 133, 133, 133),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone_android_rounded,
                            color: Color.fromARGB(255, 65, 65, 65),
                            size: 28,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 200,
                width: 400,
                child: ComponentSlideIns(
                  beginOffset: const Offset(4.0, 0),
                  duration: const Duration(milliseconds: 1200),
                  child: Card(
                    elevation: 4,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            // backgroundColor: Color.fromARGB(228, 211, 231, 255),
                            radius: 50,
                            child: Icon(
                              Icons.credit_card,
                              color: Theme.of(context).iconTheme.color,
                              size: 70,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text("No recent payment",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 10),
                          Text("You have not made any payment recently ",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade800)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 240,
                width: 400,
                child: ComponentSlideIns(
                  beginOffset: const Offset(0.0, 4.0),
                  duration: const Duration(milliseconds: 1100),
                  child: Card(
                    elevation: 8,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            // backgroundColor: Color.fromARGB(228, 211, 231, 255),
                            radius: 50,
                            child: Icon(
                              Icons.people_alt_sharp,
                              color: Theme.of(context).iconTheme.color,
                              size: 60,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text("No saved contact",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 10),
                          Text(
                              "You currently have no saved contacts on your account.When you do, they will show up here. ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade800)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colorscheme.primary,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      disabledBackgroundColor:
                          Colorscheme.primary.withOpacity(0.6),
                      disabledForegroundColor: Colors.white,
                      fixedSize: const Size(500, 50),
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text("Proceed"))
            ],
          ),
        ),
      ),
    );
  }
}
