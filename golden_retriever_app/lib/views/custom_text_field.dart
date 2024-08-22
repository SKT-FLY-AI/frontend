// lib/widgets/custom_text_field.dart

import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;
  final IconData prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    this.obscureText = false,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final double contextHeight = MediaQuery.of(context).size.height * 0.1;
    final double contextWidth = MediaQuery.of(context).size.width * 0.1;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: contextWidth * 0.6),
      padding: EdgeInsets.symmetric(vertical: contextHeight * 0.1),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        obscureText: obscureText,
        padding: EdgeInsets.symmetric(vertical: contextHeight * 0.2, horizontal: contextWidth * 0.05),
        prefix: Padding(
          padding: EdgeInsets.symmetric(horizontal: contextWidth * 0.4),
          child: Icon(prefixIcon),
        ),
      ),
    );
  }
}
