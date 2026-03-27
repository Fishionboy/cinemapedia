import 'package:cinemapedia/domain/entities/cast.dart';
import 'package:cinemapedia/presentation/providers/cast/cast_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final castByMovieProvider = StateNotifierProvider<CastByMovieNotifier,Map<String,List<Cast>>>((ref){
  final castRepository = ref.watch(castRepositoryProvider);

  return CastByMovieNotifier(getCast: castRepository.getCastByMovie);
});

typedef GetCastCallback = Future <List<Cast>>Function(String movieId);

class CastByMovieNotifier extends StateNotifier <Map<String,List<Cast>>>{
  final GetCastCallback getCast;

CastByMovieNotifier({
  required this.getCast
  }): super({});

Future<void> loadCast(String movieId)async{
  if( state[movieId] != null) return;
 
  final List <Cast> castMembers = await getCast(movieId);

  state= {...state,movieId: castMembers};
}

}
