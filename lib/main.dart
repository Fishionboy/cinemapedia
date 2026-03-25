import 'package:cinemapedia/config/database/database.dart';
import 'package:cinemapedia/presentation/providers/settings/settings_app_provider.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // await db.into(db.favoriteMovies).insert(
  //   FavoriteMoviesCompanion.insert(
  //     movieId: 1, 
  //     backdropPath: 'backdropPath.png', 
  //     originalTitle: 'My first movie', 
  //     posterPath: 'posterPath.png', 
  //     title: ' mi primer película'
  //   ),
  // );
  // final deleteQuery = db.delete(db.favoriteMovies);
  // await deleteQuery.go();
  
  final movies = await db.select(db.favoriteMovies).get();
  print('movies: $movies');

  await dotenv.load(fileName: '.env');
   runApp(
    const ProviderScope(child: MainApp())
   );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),     
    );
  }
}
