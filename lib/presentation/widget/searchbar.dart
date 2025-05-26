import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 299,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(47, 47, 57, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(CupertinoIcons.search, color: Colors.white),
          suffixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                VerticalDivider(
                  color: Color.fromRGBO(69, 69, 79, 1),
                  thickness: 1,
                  width: 10,
                  indent: 11.5,
                  endIndent: 11.5,
                ),
                Icon(Icons.mic, color: Colors.white),
              ],
            ),
          ),
          hintText: 'Search “Punjabi Lyrics”',
          hintStyle: GoogleFonts.syne(
            color: Color.fromRGBO(97, 97, 107, 1),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: const Color.fromRGBO(47, 47, 57, 1),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: outlineInputBorder(Colors.transparent),
          enabledBorder: outlineInputBorder(Colors.transparent),
          focusedBorder: outlineInputBorder(Colors.transparent),
          errorBorder: outlineInputBorder(Colors.transparent),
          focusedErrorBorder: outlineInputBorder(Colors.transparent),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color),
  );
}
