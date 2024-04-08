import 'package:flutter/material.dart';

class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBars({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.leading,
    this.trailing,
  });

  final String title;
  final bool centerTitle;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Color.fromARGB(146, 167, 167, 167),
              ),
            ),
          ),
        ),
      ),
      centerTitle: centerTitle,
      leading: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 25,
        ),
      ),
      actions: trailing != null ? [trailing!] : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
