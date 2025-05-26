import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TileScreen extends StatelessWidget {
  static const routeName = "/titlescreen";
  const TileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 23, 28, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 23, 28, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(169, 1, 64, 1)),
        ),
      ),
      body: Center(
        child: Text(
          "You tapped on: $text",
          style: GoogleFonts.syne(
            color: Color.fromRGBO(169, 1, 64, 1),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
