import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/actor_response.dart';

class ActorMapper {
  static Actor actorToEntity(ActorDto actorDto) => Actor(
    alsoKnownAs: actorDto.alsoKnownAs ?? [], 
    biography: actorDto.biography ?? '', 
    birthday: actorDto.birthday ?? DateTime(1,1,1), 
    deathday: actorDto.deathday, 
    gender: actorDto.gender, 
    id: actorDto.id, 
    imdbId: actorDto.imdbId, 
    knownForDepartment: actorDto.knownForDepartment ?? '', 
    name: actorDto.name, 
    placeOfBirth: actorDto.placeOfBirth ?? '', 
    popularity: actorDto.popularity ?? 0, 
    profilePath: actorDto.profilePath != '' 
    ? 'https://image.tmdb.org/t/p/w500/${actorDto.profilePath}'   
    : 'https://i.pinimg.com/736x/2f/15/f2/2f15f2e8c688b3120d3d26467b06330c.jpg',
    );
}