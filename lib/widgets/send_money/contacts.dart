import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class ContactsCard extends StatelessWidget {
  const ContactsCard({super.key, required this.iconTheme});

  final IconThemeData iconTheme;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400,
      child: ComponentSlideIns(
        beginOffset: Offset(4.0, 0.0),
        duration: Duration(milliseconds: 1100),
        child: Card(
          elevation: 8,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  // backgroundColor: const Color.fromARGB(228, 211, 231, 255),
                  radius: 50,
                  child: Icon(
                    Icons.contact_phone_rounded,
                    color: Utilities().appColors(context).primary,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("No contact access",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 10),
                Text(
                    "Grant us access to your contact list, this will enable Amp Up to allow you choose which friends to transact with. ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15, color: Colors.grey.shade800)),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Utilities().appColors(context).primary,
                        elevation: 5,
                        fixedSize: const Size(500, 50),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: const Text(
                      "Allow access",
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
