import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/model/tiledatamodel.dart';
import 'package:s_rocks_music/presentation/screen/tilescreen.dart';

class OptionTile extends StatelessWidget {
  final TileDataModel tileData;
  const OptionTile({super.key, required this.tileData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(TileScreen.routeName, arguments: tileData.title);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: 330,
        height: 67,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                tileData.imageBGUrl,
                width: double.infinity,
                height: 67,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(44, 45, 49, 0.9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.transparent,
                    child: Image.network(
                      tileData.imageLDUrl,
                      width: 47,
                      height: 47,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tileData.title,
                          style: GoogleFonts.syne(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          tileData.subtitle,
                          style: GoogleFonts.syne(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_right, size: 30, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
