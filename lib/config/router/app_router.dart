import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/home_views/favorites_view.dart';
import 'package:cinemapedia/presentation/views/home_views/home_view.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(

  initialLocation: '/',

  routes: <RouteBase>[

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {

        return HomeScreen(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
      
        StatefulShellBranch(
          routes: <RouteBase>[
           
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeView(),
              routes: <RouteBase>[
             
                GoRoute(                 
                  path: 'movie/:id',
                  name: MovieScreen.name,
                  builder: (context, state) {
                   
                    final movieID = state.pathParameters['id'] ?? 'no-id';
                    return MovieScreen(movieId: movieID);
                  },
                ),
              ],
            ),
          ],
        ),      
      
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesView(),
            )
          ],
        ),
      ],
    )
  ],
);


  
   
   
   
   
   
   
    // GoRoute(
    //   path: '/',
    //   name:HomeScreen.name,
    //   builder: (context, state) => const HomeScreen(childView: HomeView(),),
    //   routes: [
    //      GoRoute(
    //   path: 'movie/:id',
    //   name:MovieScreen.name,
    //   builder: (context, state) {
    //     final movieId = state.pathParameters['id'] ?? 'no-id';
    //     return MovieScreen(movieId: movieId,);
    //     },
    //   ),
    //   ]
    //   ),

   

  