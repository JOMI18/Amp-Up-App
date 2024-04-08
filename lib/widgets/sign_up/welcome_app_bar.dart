import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class WelcomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const WelcomeAppBar({super.key});

  @override
  State<WelcomeAppBar> createState() => _WelcomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _WelcomeAppBarState extends State<WelcomeAppBar> {
  @override
  Widget build(BuildContext context) {
    // ColorScheme colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      // backgroundColor: colorScheme.background,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: ComponentSlideIns(
        beginOffset: const Offset(0, -2),
        duration: const Duration(milliseconds: 1200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "lib/assets/images/logo--bar.png",
              height: 9.h,
            ),
            GestureDetector(
              onTap: () {
                showHelpPopup(context);
              },
              child: const CircleAvatar(
                radius: 12,
                // backgroundColor: Color.fromARGB(255, 31, 31, 31),
                child: Icon(Icons.question_mark_outlined,
                    size: 16, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
