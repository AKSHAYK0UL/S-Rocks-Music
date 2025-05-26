import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/bloc/blocdb/bloc/database_bloc.dart';
import 'package:s_rocks_music/presentation/screen/home.dart';
import 'package:s_rocks_music/presentation/screen/othertabs.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    context.read<DatabaseBloc>().add(GetDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / 4;

    return BlocBuilder<DatabaseBloc, DatabaseState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is LoadingStata) {
          return Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(169, 1, 64, 1),
            ),
          );
        }
        if (state is ErrorState) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is DataState) {
          final data = state.data;
          final List<Widget> screens = [
            Home(data: data),
            Othertabs(index: _selectedIndex),
            Othertabs(index: _selectedIndex),
            Othertabs(index: _selectedIndex),
          ];
          return Scaffold(
            backgroundColor: const Color.fromRGBO(24, 23, 28, 1),
            body: screens[_selectedIndex],
            bottomNavigationBar: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: Border(
                      top: BorderSide(
                        color: Color.fromRGBO(44, 45, 49, 1),
                        width: 2,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),

                    child: Theme(
                      data: ThemeData(splashColor: Colors.transparent),
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Color.fromRGBO(24, 23, 28, 1),
                        selectedItemColor: Colors.white,
                        unselectedItemColor: Color.fromRGBO(97, 97, 107, 1),
                        selectedLabelStyle: GoogleFonts.syne(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        unselectedLabelStyle: GoogleFonts.syne(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(97, 97, 107, 1),
                        ),
                        items: [
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: EdgeInsets.only(top: 6.5, bottom: 3),
                              child: Image.asset(
                                "assets/icon/navicon1.png",
                                color:
                                    _selectedIndex == 0
                                        ? Colors.white
                                        : Color.fromRGBO(97, 97, 107, 1),
                                height: 23,
                                width: 23,
                              ),
                            ),
                            label: "Home",
                          ),
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: EdgeInsets.only(top: 6.5, bottom: 3),
                              child: Image.asset(
                                "assets/icon/navicon2.png",
                                color:
                                    _selectedIndex == 1
                                        ? Colors.white
                                        : Color.fromRGBO(97, 97, 107, 1),
                                height: 23,
                                width: 23,
                              ),
                            ),
                            label: "News",
                          ),
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: EdgeInsets.only(top: 6.5, bottom: 3),
                              child: Image.asset(
                                "assets/icon/navicon3.png",

                                color:
                                    _selectedIndex == 2
                                        ? Colors.white
                                        : Color.fromRGBO(97, 97, 107, 1),
                                height: 23,
                                width: 23,
                              ),
                            ),
                            label: "TrackBox",
                          ),
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: EdgeInsets.only(top: 6.5, bottom: 3),
                              child: Image.asset(
                                "assets/icon/navicon4.png",
                                color:
                                    _selectedIndex == 3
                                        ? Colors.white
                                        : Color.fromRGBO(97, 97, 107, 1),
                                height: 23,
                                width: 23,
                              ),
                            ),
                            label: "Projects",
                          ),
                        ],
                        currentIndex: _selectedIndex,
                        onTap: (value) {
                          setState(() {
                            _selectedIndex = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  top: -1,
                  left: itemWidth * _selectedIndex + itemWidth / 2.10 - 5,
                  child: Container(
                    width: 15,
                    height: 6.5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
