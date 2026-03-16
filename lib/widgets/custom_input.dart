import 'package:flutter/material.dart';
import 'package:study_planner/constants/colors.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String lableText;
  final String? Function(String?)? validator;

  const CustomInput({
    super.key,
    required this.controller,
    required this.lableText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: lableText,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: darkGreen),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13.0,
            horizontal: 12.0,
          ),
        ),
      ),
    );
  }
}
