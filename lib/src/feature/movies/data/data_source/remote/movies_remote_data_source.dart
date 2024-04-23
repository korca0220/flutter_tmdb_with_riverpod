import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_movie/src/feature/movies/utils/env.dart';
import 'package:tmdb_movie/src/feature/movies/utils/typedef.dart';
import 'package:tmdb_movie/src/global/http/dio_provider.dart';

final movieDataSourceProvider = Provider((ref) {
  return MoviesRemoteDataSourceImpl(
    ref.read(dioProvider),
  );
});

abstract interface class MoviesRemoteDataSource {
  Future getMovies({
    MoviesQueryData? queryData,
    CancelToken? cancelToken,
    int? movieId,
  });

  Future getNowPlayingMovies({
    required int page,
    CancelToken? cancelToken,
  });
}

final class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  const MoviesRemoteDataSourceImpl(this.client);

  final Dio client;

  @override
  Future getMovies({
    MoviesQueryData? queryData,
    CancelToken? cancelToken,
    int? movieId,
  }) async {
    assert(queryData != null || movieId != null,
        'queryData or movieId must be provided');

    final uri = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: queryData != null ? '3/search/movie' : '3/movie/$movieId',
      queryParameters: {
        'api_key': Env.apiKey,
        'include_adult': 'true',
        if (queryData != null) ...{
          'page': '${queryData.page}',
          'query': queryData.query,
        }
      },
    );
    final response = await client.getUri(uri, cancelToken: cancelToken);

    return response.data;
  }

  @override
  Future getNowPlayingMovies({
    required int page,
    CancelToken? cancelToken,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/now_playing',
      queryParameters: {
        'api_key': Env.apiKey,
        'include_adult': 'true',
        'page': '$page',
      },
    );

    final response = await client.getUri(uri, cancelToken: cancelToken);

    return response.data;
  }
}
