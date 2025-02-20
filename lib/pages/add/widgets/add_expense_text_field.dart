import 'package:flutter/material.dart';

class AddExpenseTextField extends StatelessWidget {
  const AddExpenseTextField({
    super.key,
    this.keyboardType,
    required this.controller,
    required this.hint,
  });

  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 26,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: const EdgeInsets.all(16),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
