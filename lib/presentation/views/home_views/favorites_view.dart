import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {

  @override
  void initState() {
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final favoriteMovies = ref.watch(favoriteMoviesProvider);
    final myMovieList = favoriteMovies.values.toList();

  if(myMovieList.isEmpty){
    return Scaffold(
      body: Center(
        child: Text('No hay películas en favoritos'),
      ),
    );
  }
    return Scaffold(    
      body:MoviesMasonry(
        movies: myMovieList,
        loadNextPage:()=> ref.read(favoriteMoviesProvider.notifier).loadNextPage()
        //TODO agregar películas cuando se añade a favoritos al movies provider
        ));    
  }
}