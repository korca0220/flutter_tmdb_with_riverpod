import 'package:dio/dio.dart';
import 'package:tmdb_movie/src/feature/movies/data/model/tmdb_movies_response.dart';
import 'package:tmdb_movie/src/feature/movies/domain/entity/tmdb_movie.dart';
import 'package:tmdb_movie/src/feature/movies/utils/typedef.dart';


abstract interface class MoviesRepository {
  Future<TMDBMoviesResponse> searchMovies({
    required MoviesQueryData queryData,
    CancelToken? cancelToken,
  });

  Future<TMDBMoviesResponse> nowPlayingMovies({
    required int page,
    CancelToken? cancelToken,
  });

  Future<TMDBMovie> movie({
    required int movieId,
    CancelToken? cancelToken,
  });
}
