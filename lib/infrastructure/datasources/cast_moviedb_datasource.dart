import 'package:cinemapedia/config/constant/environment.dart';
import 'package:cinemapedia/domain/datasources/cast_datasource.dart';
import 'package:cinemapedia/domain/entities/cast.dart';
import 'package:cinemapedia/infrastructure/mappers/cast_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class CastMoviedbDatasource extends CastDatasource{

   final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key':Environment.theMovieDbKey,
        'language': 'es'
      }
    ));

  @override
  Future<List<Cast>> getCastByMovie(String movieId) async {

    final response = await dio.get(
      '/movie/$movieId/credits'
      );

   final castResponse = CreditsResponse.fromJson(response.data);
   final List<Cast> castMembers = castResponse.cast
   .map(
    (cast)=> CastMapper.castToEntity(cast)
   ).toList();
   
   return castMembers;
  }

}