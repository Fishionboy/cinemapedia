import 'package:cinemapedia/infrastructure/repositories/actors_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/datasources/actors_moviedb_datasource.dart';

final actorRepositoryProvider = Provider((ref){
  return ActorsRepositoryImpl(ActorsMoviedbDatasource());
});