// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TMDBMovieBasicImpl _$$TMDBMovieBasicImplFromJson(Map<String, dynamic> json) =>
    _$TMDBMovieBasicImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$$TMDBMovieBasicImplToJson(
        _$TMDBMovieBasicImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
    };
