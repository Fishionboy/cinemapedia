import 'package:cinemapedia/config/constant/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/actor_response.dart';
import 'package:dio/dio.dart';

class ActorsMoviedbDatasource extends ActorsDatasource {

    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
         'api_key':Environment.theMovieDbKey,
         'language':'es'
      }
    ));

    @override
     Future<Actor> getActorByMovie(String actorId) async{

      final response = await dio.get('/person/$actorId');

      final actorResponse = ActorResponse.fromJson(response.data);
      final Actor actor = ActorMapper.actorToEntity(actorResponse.actorDto);
    

      return actor;


     }
   
  }
