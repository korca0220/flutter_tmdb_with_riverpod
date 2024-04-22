import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/movies/provider/movie_search_provider.dart';

class MovieSearchBar extends StatefulHookConsumerWidget {
  const MovieSearchBar({
    super.key,
  });

  @override
  ConsumerState<MovieSearchBar> createState() => _MovieSearchBarState();
}

class _MovieSearchBarState extends ConsumerState<MovieSearchBar> {
  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return SizedBox(
      height: 70,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                Expanded(
                  child: Center(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        hintText: 'Search movies',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                      ),
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onChanged: (value) => ref
                          .read(movieSearchNotifierProvider.notifier)
                          .setQuery(value),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
