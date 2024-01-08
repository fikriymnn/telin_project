import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final dynamic item;
  final dynamic onChange;
  final dynamic value;
  const CustomDropdown(
      {super.key,
      required this.label,
      required this.item,
      required this.onChange,
      required this.value});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        style: GoogleFonts.rubik(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
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
        items: widget.item,
        onChanged: widget.onChange);
  }
}
