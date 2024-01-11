import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const CustomTextField(
      {super.key, required this.controller, required this.label});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: GoogleFonts.rubik(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
      cursorColor: Colors.blue,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Color(0xffF8F6F6),
        filled: true,
        hintStyle: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black.withOpacity(0.38)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xffE6E4E4), width: 1)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
        ),
        hintText: widget.label,
      ),
    );
  }
}
