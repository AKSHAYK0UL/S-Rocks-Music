import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Othertabs extends StatelessWidget {
  final int index;
  const Othertabs({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 28, 1),
      body: Center(
        child: Text(
          index == 1
              ? "News Tab"
              : index == 2
              ? "TrackBox Tab"
              : "Projects Tab",
          style: GoogleFonts.syne(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(169, 1, 64, 1),
          ),
        ),
      ),
    );
  }
}
