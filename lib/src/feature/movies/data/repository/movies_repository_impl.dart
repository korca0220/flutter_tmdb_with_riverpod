import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_movie/src/feature/movies/data/model/tmdb_movies_response.dart';
import 'package:tmdb_movie/src/feature/movies/domain/entity/tmdb_movie.dart';
import 'package:tmdb_movie/src/feature/movies/domain/repository/movies_repository.dart';
import 'package:tmdb_movie/src/feature/movies/utils/typedef.dart';

import '../data_source/remote/movies_remote_data_source.dart';

final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl(ref.read(movieDataSourceProvider));
});

final class MoviesRepositoryImpl implements MoviesRepository {
  const MoviesRepositoryImpl(this.remoteDataSource);

  final MoviesRemoteDataSource remoteDataSource;

  @override
  Future<TMDBMovie> movie(
      {required int movieId, CancelToken? cancelToken}) async {
    final result = await remoteDataSource.getMovies(
      movieId: movieId,
      cancelToken: cancelToken,
    );

    return TMDBMovie.fromJson(result);
  }

  @override
  Future<TMDBMoviesResponse> nowPlayingMovies({
    required int page,
    CancelToken? cancelToken,
  }) async {
    final result = await remoteDataSource.getNowPlayingMovies(
      page: page,
      cancelToken: cancelToken,
    );

    return TMDBMoviesResponse.fromJson(result);
  }

  @override
  Future<TMDBMoviesResponse> searchMovies({
    required MoviesQueryData queryData,
    CancelToken? cancelToken,
  }) async {
    final result = await remoteDataSource.getMovies(
      queryData: queryData,
      cancelToken: cancelToken,
    );

    return TMDBMoviesResponse.fromJson(result);
  }
}
