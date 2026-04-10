import 'package:cinemapedia/infrastructure/datasources/cast_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/cast_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final castRepositoryProvider = Provider((ref){
 return CastRepositoryImpl(CastMoviedbDatasource());
});