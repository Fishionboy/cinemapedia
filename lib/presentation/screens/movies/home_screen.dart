import 'package:cinemapedia/presentation/screens/providers/providers.dart';
import 'package:cinemapedia/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name='home-screen'; 

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

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

    final moviesSlideshowProvider = ref.watch(moviesSlideshoProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return Placeholder();

    return CustomScrollView(
      slivers: [

         SliverAppBar(
          floating: true,
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
        ),)
      ]
    );
  }
}