import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_rocks_music/model/tiledatamodel.dart';
import 'package:s_rocks_music/repository/repodb.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final Repodb _repodb;
  DatabaseBloc(this._repodb) : super(DatabaseInitial()) {
    on<GetDataEvent>(_getData);
  }
  Future<void> _getData(GetDataEvent event, Emitter<DatabaseState> emit) async {
    emit(LoadingStata());
    try {
      final data = await _repodb.getTileData();
      emit(DataState(data: data));
    } on FirebaseException catch (_) {
      emit(ErrorState(errorMessage: "something went wrong"));
    } catch (_) {
      emit(ErrorState(errorMessage: "something went wrong"));
    }
  }
}
