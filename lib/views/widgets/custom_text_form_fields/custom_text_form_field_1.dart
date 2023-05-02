import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField1 extends StatelessWidget {
  const CustomTextFormField1({
    Key? key,
    required this.controller,
    required this.maxLines,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    required this.inputFormatters,
    required this.obscureText,
  }) : super(key: key);
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: inputFormatters,
      textCapitalization: TextCapitalization.sentences,
      maxLines: maxLines,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
