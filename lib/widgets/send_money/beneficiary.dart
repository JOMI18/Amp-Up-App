import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class BeneficiaryCard extends StatelessWidget {
  const BeneficiaryCard({super.key, required this.iconTheme});

  final IconThemeData iconTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 400,
      child: ComponentSlideIns(
        beginOffset: Offset(4.0, 0.0),
        duration: Duration(milliseconds: 1300),
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
                    Icons.people_alt_sharp,
                    color: Utilities().appColors(context).primary,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("No beneficiary saved yet",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 10),
                Text(
                    "You don't have any beneficiary saved yet.When you do, they will show up here. ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15, color: Colors.grey.shade800)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
