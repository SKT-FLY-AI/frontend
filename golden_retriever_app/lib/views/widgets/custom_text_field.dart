// lib/widgets/custom_text_field.dart

import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;
  final IconData prefixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.placeholder,
    this.obscureText = false,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        obscureText: obscureText,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        prefix: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(prefixIcon),
        ),
      ),
    );
  }
}
