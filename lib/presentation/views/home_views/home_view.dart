import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
      if(initialLoading ) return const FullScreenLoader();

    final moviesSlideshowProvider = ref.watch(moviesSlideshoProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [

         SliverAppBar(
          floating: true,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              alignment: Alignment.center,
              child: const CustomAppbar(),
               ),
            
          
          ),
        ),

        SliverList(delegate:SliverChildBuilderDelegate(
          (context,index){
            return Column(
              children: [

                MoviesSlideshow(movies: moviesSlideshowProvider),
            
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subTitle: 'Lunes 29',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage() ;
                    },
                  ),
            
                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  subTitle: 'Este mes',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage() ;
                    },
                  ),
                
                MovieHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Más votadas',
                  subTitle: 'Este mes',
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage() ;
                    },
                  ),
                
                  MovieHorizontalListview(
                  movies: upcomingMovies,
                  title: 'Próximamente',
                  subTitle: 'Este mes',
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage() ;
                    },
                  ),
              ],
      );
          },
          childCount: 1
        ),
        )
      ]
    );
  }
}