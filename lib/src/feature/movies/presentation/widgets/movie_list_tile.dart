import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tmdb_movie/src/feature/movies/domain/entity/tmdb_movie.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/widgets/movie_poster.dart';
import 'package:tmdb_movie/src/feature/movies/presentation/widgets/top_gradient.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({
    super.key,
    required this.movie,
    this.debugIndex,
    this.onTap,
  });

  final TMDBMovie movie;
  final int? debugIndex;
  final VoidCallback? onTap;

  static const posterHeight = 80.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: posterHeight * MoviePoster.width / MoviePoster.height,
                  height: posterHeight,
                  child: MoviePoster(
                    imagePath: movie.posterPath,
                  ),
                ),
                if (debugIndex != null) ...[
                  const Positioned.fill(
                    child: TopGradient(),
                  ),
                  Positioned(
                    left: 4,
                    top: 4,
                    child: Text(
                      '$debugIndex',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ]
              ],
            ),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Gap(8),
                  Text('Released: ${movie.releaseDate}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
