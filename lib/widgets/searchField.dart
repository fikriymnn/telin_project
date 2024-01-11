import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telin_project/constants/style.dart';

class BuildSearchField extends StatefulWidget {
  final TextEditingController controller;
  final dynamic onChange;
  const BuildSearchField({super.key, required this.controller, this.onChange});

  @override
  State<BuildSearchField> createState() => _BuildSearchFieldState();
}

class _BuildSearchFieldState extends State<BuildSearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: activeTable,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
        child: TextField(
          controller: widget.controller,
          onChanged: widget.onChange,
          style: GoogleFonts.rubik(
              fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
          cursorColor: Colors.blue,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 15, bottom: 11, left: 13),
              fillColor: light,
              filled: true,
              hintStyle: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(0.38)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search"),
        ),
      ),
    );
  }
}
