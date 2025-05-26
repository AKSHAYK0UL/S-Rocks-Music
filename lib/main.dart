import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_rocks_music/bloc/blocdb/bloc/database_bloc.dart';
import 'package:s_rocks_music/firebase_options.dart';
import 'package:s_rocks_music/network/networkdb.dart';
import 'package:s_rocks_music/presentation/screen/navbar.dart';
import 'package:s_rocks_music/presentation/screen/tilescreen.dart';
import 'package:s_rocks_music/repository/repodb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(169, 1, 64, 1),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create:
          (context) => Repodb(
            networkdb: Networkdb(
              fireStoreinstance: FirebaseFirestore.instance,
              collection: "tiledata",
            ),
          ),
      child: BlocProvider(
        create:
            (context) => DatabaseBloc(RepositoryProvider.of<Repodb>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'S Rocks Music',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: NavBar(),
          routes: {TileScreen.routeName: (context) => TileScreen()},
        ),
      ),
    );
  }
}
