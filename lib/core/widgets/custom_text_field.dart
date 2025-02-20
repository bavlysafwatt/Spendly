import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.keyboardType,
      this.textAlign,
      this.textColor = Colors.black});

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Color(0xfffafafa),
        filled: true,
      ),
      cursorColor: Colors.black,
      style: TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
