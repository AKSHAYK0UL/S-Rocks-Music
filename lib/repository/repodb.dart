import 'package:firebase_core/firebase_core.dart';
import 'package:s_rocks_music/model/tiledatamodel.dart';
import 'package:s_rocks_music/network/networkdb.dart';

class Repodb {
  final Networkdb networkdb;

  Repodb({required this.networkdb});

  Future<List<TileDataModel>> getTileData() async {
    try {
      List<Map<String, dynamic>> data = await networkdb.getTileData();
      List<TileDataModel> result =
          data.map((e) => TileDataModel.fromJson(e)).toList();
      return result;
    } on FirebaseException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
