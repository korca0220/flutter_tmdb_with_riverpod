import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/movies/provider/movie_search_provider.dart';

class MovieSearchScreen extends StatefulHookConsumerWidget {
  const MovieSearchScreen({super.key});

  @override
  ConsumerState<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends ConsumerState<MovieSearchScreen> {
  static const posterHeight = 80.0;

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TMDB Movies',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
            child: Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
          ),
          const Gap(10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            const SizedBox(
                              width: posterHeight *
                                  MoviePoster.width /
                                  MoviePoster.height,
                              height: posterHeight,
                              child: MoviePoster(),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black87,
                                      Colors.transparent,
                                    ],
                                    stops: [0.1, 0.5],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    tileMode: TileMode.repeated,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 4,
                              top: 4,
                              child: Text(
                                '4',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, this.imagePath});
  final String? imagePath;

  static const width = 154.0;
  static const height = 231.0;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return CachedNetworkImage(
        //fit: BoxFit.fitWidth,
        // imageUrl: TMDBPoster.imageUrl(imagePath!, PosterSize.w154),
        imageUrl: '',
        placeholder: (_, __) => Shimmer.fromColors(
          baseColor: Colors.black26,
          highlightColor: Colors.black12,
          child: Container(
            width: width,
            height: height,
            color: Colors.black,
          ),
        ),
      );
    }
    return const Placeholder(
      color: Colors.black87,
    );
  }
}
