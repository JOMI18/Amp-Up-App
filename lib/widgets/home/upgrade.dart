import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class Upgrade extends StatelessWidget {
  const Upgrade({super.key, required this.colorScheme});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return ComponentSlideIns(
      beginOffset: const Offset(-4.0, 0.0),
      endOffset: const Offset(0.0, 0.0),
      duration: const Duration(milliseconds: 1300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Shadow color
                  spreadRadius: 0.5, // Spread radius
                  blurRadius: 2, // Blur radius
                  offset: const Offset(0, 1), // Offset
                ),
              ],
            ),
            child: Card(
              elevation: 2,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(
                  10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.upgrade,
                          size: 28,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Upgrade your Betterlife Account",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                                "Verify your identity to improve limits on your account",
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Tap here to upgrade now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: -0.6,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.primary,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
