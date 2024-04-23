import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_movie/src/feature/movies/domain/use_case/movies_use_cases.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/movies/provider/movie_search_provider.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/movies/widgets/movie_list_tile_error.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/movies/widgets/movie_list_tile_shimmer.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/widgets/movie_list_tile.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/widgets/movie_search_bar.dart';
import 'package:tmdb_movie/src/global/route/router.dart';

class MovieSearchScreen extends ConsumerWidget {
  const MovieSearchScreen({super.key});

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(movieSearchNotifierProvider);

    final responseAsync = ref.watch(
      fetchMoviesProvider(
        queryData: (page: 1, query: query),
      ),
    );

    final totalResults = responseAsync.valueOrNull?.totalResults;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TMDB Movies',
        ),
      ),
      body: Column(
        children: [
          const MovieSearchBar(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(fetchMoviesProvider);

                try {
                  ref.read(
                    fetchMoviesProvider(queryData: (page: 1, query: query))
                        .future,
                  );
                } catch (e) {
                  log(e.toString());
                }
              },
              child: ListView.builder(
                key: ValueKey(query),
                itemCount: totalResults,
                itemBuilder: (context, index) {
                  final page = index ~/ pageSize + 1;
                  final indexInPage = index % pageSize;

                  final responseAsync = ref.watch(
                    fetchMoviesProvider(queryData: (page: page, query: query)),
                  );

                  return responseAsync.when(
                    data: (response) {
                      if (indexInPage >= response.results.length) {
                        return null;
                      }

                      final movie = response.results[indexInPage];

                      return MovieListTile(
                        movie: movie,
                        debugIndex: index + 1,
                        onTap: () {
                          context.goNamed(
                            AppRoute.movie.name,
                            pathParameters: {
                              'id': movie.id.toString(),
                            },
                            extra: movie,
                          );
                        },
                      );
                    },
                    error: (error, _) => MovieListTileError(
                      query: query,
                      page: page,
                      indexInPage: indexInPage,
                      error: error.toString(),
                      isLoading: responseAsync.isLoading,
                    ),
                    loading: () => const MovieListTileShimmer(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
