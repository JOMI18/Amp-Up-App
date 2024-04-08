import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to Amp Up",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                  "To create an account, Enter your details exactly as they appear on your BVN ",
                  textAlign: TextAlign.start,
                  softWrap: true,
                  maxLines: null,
                  style: TextStyle(
                    fontSize: 15,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
