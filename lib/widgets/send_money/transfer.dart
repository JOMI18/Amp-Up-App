import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class TransferCard extends StatelessWidget {
  const TransferCard({super.key, required this.iconTheme});

  final IconThemeData iconTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 400,
      child: ComponentSlideIns(
        beginOffset: Offset(4.0, 0.0),
        endOffset: Offset(0.0, 0.0),
        duration: Duration(milliseconds: 1200),
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
                    Icons.note_alt_sharp,
                    color: Utilities().appColors(context).primary,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("No recent transfers",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 10),
                Text("You have not made any transfers recently ",
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
