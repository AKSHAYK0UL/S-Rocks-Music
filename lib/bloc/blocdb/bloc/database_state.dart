part of 'database_bloc.dart';

sealed class DatabaseState {}

final class DatabaseInitial extends DatabaseState {}

final class LoadingStata extends DatabaseState {}

final class DataState extends DatabaseState {
  List<TileDataModel> data = [];
  DataState({required this.data});
}

final class ErrorState extends DatabaseState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
