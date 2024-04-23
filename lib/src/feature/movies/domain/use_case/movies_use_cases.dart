import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb_movie/src/feature/movies/data/model/tmdb_movies_response.dart';
import 'package:tmdb_movie/src/feature/movies/data/repository/movies_repository_impl.dart';
import 'package:tmdb_movie/src/feature/movies/domain/entity/tmdb_movie.dart';

import '../../utils/typedef.dart';

part 'movies_use_cases.g.dart';

@riverpod
Future<TMDBMoviesResponse> fetchMovies(
  FetchMoviesRef ref, {
  required MoviesQueryData queryData,
}) {
  final repo = ref.watch(movieRepositoryProvider);

  final cancelToken = CancelToken();

  _cacheRef(ref: ref, cancelToken: cancelToken);

  return queryData.query.isNotEmpty
      ? repo.searchMovies(
          queryData: queryData,
          cancelToken: cancelToken,
        )
      : repo.nowPlayingMovies(
          page: queryData.page,
          cancelToken: cancelToken,
        );
}

@riverpod
Future<TMDBMovie> getMovie(
  GetMovieRef ref, {
  required int movieId,
}) {
  final cancelToken = CancelToken();

  final repo = ref.watch(movieRepositoryProvider);

  return repo.movie(movieId: movieId, cancelToken: cancelToken);
}

void _cacheRef({
  required AutoDisposeRef ref,
  required CancelToken cancelToken,
}) {
  Timer? timer;

  final link = ref.keepAlive();

  ref.onDispose(() {
    cancelToken.cancel();
    timer?.cancel();
  });

  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });

  ref.onResume(() {
    timer?.cancel();
  });
}
