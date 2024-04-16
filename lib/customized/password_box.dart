import 'package:flutter/material.dart';

class PasswordInputBox extends StatelessWidget {
  PasswordInputBox(
      {super.key,
      required this.textController,
      required this.focusnode,
      this.nextfocusnode,
      this.prevfocusnode,
      this.func,
      this.isLast = false});

  late final TextEditingController textController;
  late final FocusNode focusnode;
  late final FocusNode? nextfocusnode;
  late final FocusNode? prevfocusnode;
  late final VoidCallback? func;
  late final bool? isLast;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: textController,
        focusNode: focusnode,
        maxLength: 1,
        onChanged: (value) {
          if (value.isEmpty && prevfocusnode != null) {
            prevfocusnode!.requestFocus();
          }
          if (value != "" && nextfocusnode != null) {
            nextfocusnode!.requestFocus();
          }
          if (isLast == true && value != "") {
            func!();
          }
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          fillColor: Colors.grey.shade200,

          counter: const SizedBox.shrink(), // removes the counter
        ),
      ),
    );
  }
}
