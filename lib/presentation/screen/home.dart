import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/model/tiledatamodel.dart';
import 'package:s_rocks_music/presentation/widget/optiontile.dart';
import 'package:s_rocks_music/presentation/widget/searchbar.dart';

class Home extends StatelessWidget {
  final List<TileDataModel> data;
  const Home({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 23, 28, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(169, 1, 64, 1),
                            Color.fromRGBO(89, 1, 33, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 15,
                      left: -20,
                      child: Image.asset(
                        "assets/layer/Layer1.png",
                        height: 90.75,
                        width: 90.75,
                      ),
                    ),

                    Positioned(
                      bottom: 15,
                      right: -47,
                      child: Image.asset(
                        "assets/layer/Layer2.png",
                        height: 119,
                        width: 134,
                      ),
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.5,
                            vertical: 16,
                          ),
                          child: Row(
                            children: [
                              const Searchbar(),
                              const SizedBox(width: 12),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/icon/avatar.png",
                                  height: 34,
                                  width: 34,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Claim your",
                          style: GoogleFonts.syne(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Free Demo",
                          style: GoogleFonts.lobster(
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "for custom Music Production",
                          style: GoogleFonts.syne(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: Text(
                            "Book Now",
                            style: GoogleFonts.syne(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 335,
                height: 65,
                child: Text(
                  "Hire hand-picked Pros for popular music services",
                  style: GoogleFonts.syne(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final tileData = data[index];
                  return OptionTile(tileData: tileData);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
