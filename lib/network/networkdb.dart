import 'package:cloud_firestore/cloud_firestore.dart';

class Networkdb {
  final FirebaseFirestore fireStoreinstance;
  final String collection;

  Networkdb({required this.fireStoreinstance, required this.collection});

  //get
  Future<List<Map<String, dynamic>>> getTileData() async {
    try {
      QuerySnapshot snapshot =
          await fireStoreinstance.collection(collection).get();
      List<Map<String, dynamic>> result =
          snapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

      return result;
    } on FirebaseException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
