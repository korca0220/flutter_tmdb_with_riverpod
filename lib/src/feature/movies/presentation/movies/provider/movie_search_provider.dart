import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_search_provider.g.dart';

@riverpod
class MovieSearchNotifier extends _$MovieSearchNotifier {
  Timer? _debounceTimer;

  @override
  String build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });

    return '';
  }

  void setQuery(String query) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      state = query;
    });
  }
}
