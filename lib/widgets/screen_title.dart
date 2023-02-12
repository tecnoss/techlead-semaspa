import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
          color: Colors.black87,
        ),
      ),
    );
  }
}
