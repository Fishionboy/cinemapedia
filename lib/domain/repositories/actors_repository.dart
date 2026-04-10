import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsRepository {  
  Future<Actor> getActorById(String actorId);
}