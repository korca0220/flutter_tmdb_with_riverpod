// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_use_cases.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchMoviesHash() => r'fa0b92b5a5c7d5b05dab28050737fccca02d9577';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchMovies].
@ProviderFor(fetchMovies)
const fetchMoviesProvider = FetchMoviesFamily();

/// See also [fetchMovies].
class FetchMoviesFamily extends Family<AsyncValue<TMDBMoviesResponse>> {
  /// See also [fetchMovies].
  const FetchMoviesFamily();

  /// See also [fetchMovies].
  FetchMoviesProvider call({
    required ({int page, String query}) queryData,
  }) {
    return FetchMoviesProvider(
      queryData: queryData,
    );
  }

  @override
  FetchMoviesProvider getProviderOverride(
    covariant FetchMoviesProvider provider,
  ) {
    return call(
      queryData: provider.queryData,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchMoviesProvider';
}

/// See also [fetchMovies].
class FetchMoviesProvider
    extends AutoDisposeFutureProvider<TMDBMoviesResponse> {
  /// See also [fetchMovies].
  FetchMoviesProvider({
    required ({int page, String query}) queryData,
  }) : this._internal(
          (ref) => fetchMovies(
            ref as FetchMoviesRef,
            queryData: queryData,
          ),
          from: fetchMoviesProvider,
          name: r'fetchMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMoviesHash,
          dependencies: FetchMoviesFamily._dependencies,
          allTransitiveDependencies:
              FetchMoviesFamily._allTransitiveDependencies,
          queryData: queryData,
        );

  FetchMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.queryData,
  }) : super.internal();

  final ({int page, String query}) queryData;

  @override
  Override overrideWith(
    FutureOr<TMDBMoviesResponse> Function(FetchMoviesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMoviesProvider._internal(
        (ref) => create(ref as FetchMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        queryData: queryData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TMDBMoviesResponse> createElement() {
    return _FetchMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMoviesProvider && other.queryData == queryData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, queryData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchMoviesRef on AutoDisposeFutureProviderRef<TMDBMoviesResponse> {
  /// The parameter `queryData` of this provider.
  ({int page, String query}) get queryData;
}

class _FetchMoviesProviderElement
    extends AutoDisposeFutureProviderElement<TMDBMoviesResponse>
    with FetchMoviesRef {
  _FetchMoviesProviderElement(super.provider);

  @override
  ({int page, String query}) get queryData =>
      (origin as FetchMoviesProvider).queryData;
}

String _$getMovieHash() => r'44c48c1010b70b5058b8c017c5c477d608545ec3';

/// See also [getMovie].
@ProviderFor(getMovie)
const getMovieProvider = GetMovieFamily();

/// See also [getMovie].
class GetMovieFamily extends Family<AsyncValue<TMDBMovie>> {
  /// See also [getMovie].
  const GetMovieFamily();

  /// See also [getMovie].
  GetMovieProvider call({
    required int movieId,
  }) {
    return GetMovieProvider(
      movieId: movieId,
    );
  }

  @override
  GetMovieProvider getProviderOverride(
    covariant GetMovieProvider provider,
  ) {
    return call(
      movieId: provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMovieProvider';
}

/// See also [getMovie].
class GetMovieProvider extends AutoDisposeFutureProvider<TMDBMovie> {
  /// See also [getMovie].
  GetMovieProvider({
    required int movieId,
  }) : this._internal(
          (ref) => getMovie(
            ref as GetMovieRef,
            movieId: movieId,
          ),
          from: getMovieProvider,
          name: r'getMovieProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMovieHash,
          dependencies: GetMovieFamily._dependencies,
          allTransitiveDependencies: GetMovieFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  GetMovieProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<TMDBMovie> Function(GetMovieRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMovieProvider._internal(
        (ref) => create(ref as GetMovieRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TMDBMovie> createElement() {
    return _GetMovieProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMovieProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMovieRef on AutoDisposeFutureProviderRef<TMDBMovie> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _GetMovieProviderElement
    extends AutoDisposeFutureProviderElement<TMDBMovie> with GetMovieRef {
  _GetMovieProviderElement(super.provider);

  @override
  int get movieId => (origin as GetMovieProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
