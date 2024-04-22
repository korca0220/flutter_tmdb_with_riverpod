// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TMDBMoviesResponseImpl _$$TMDBMoviesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TMDBMoviesResponseImpl(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => TMDBMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
      movies: (json['movies'] as List<dynamic>?)
              ?.map((e) => TMDBMovie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TMDBMoviesResponseImplToJson(
        _$TMDBMoviesResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'movies': instance.movies,
    };
