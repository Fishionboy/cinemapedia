import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actor/actor_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorByIdProvider = FutureProvider.family<Actor,String>((ref,actorId){
  final repository = ref.read(actorRepositoryProvider);
  return repository.getActorById(actorId);
});