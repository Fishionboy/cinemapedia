import 'package:cinemapedia/domain/entities/cast.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class CastMapper {

  static Cast castToEntity(CastDto cast) => Cast(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    : 'https://i.pinimg.com/736x/2f/15/f2/2f15f2e8c688b3120d3d26467b06330c.jpg',
    character: cast.character
    );

}