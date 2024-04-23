import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_movie/src/feature/favorites/presentation/favorites_screen.dart';
import 'package:tmdb_movie/src/feature/movies/domain/entity/tmdb_movie.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/movie_detail/movie_detail_screen.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/movies/movie_search_screen.dart';
import 'package:tmdb_movie/src/global/route/main_navigation.dart';

enum AppRoute {
  movies,
  movie,
  favorites,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _searchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'search');
final _favoritesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'favorite');

final goRouterProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/movies',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainNavigation(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _searchNavigatorKey,
              routes: [
                GoRoute(
                  path: '/movies',
                  name: AppRoute.movies.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const MovieSearchScreen(),
                  ),
                  routes: [
                    GoRoute(
                      path: ':id',
                      name: AppRoute.movie.name,
                      pageBuilder: (context, state) {
                        final id =
                            int.parse(state.pathParameters['id'] as String);
                        final movie = state.extra is TMDBMovie
                            ? state.extra as TMDBMovie
                            : null;

                        return MaterialPage(
                          key: state.pageKey,
                          child: MovieDetailsScreen(
                            movieId: id,
                            movie: movie,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _favoritesNavigatorKey,
              routes: [
                GoRoute(
                  path: '/favorites',
                  name: AppRoute.favorites.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const FavoritesScreen(),
                  ),
                ),
              ],
            ),
          ]),
    ],
  );
});
