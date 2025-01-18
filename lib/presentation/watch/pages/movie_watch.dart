import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/domain/movie/entites/movie.dart';
import 'package:movie_app/presentation/watch/widget/recommendation_movies.dart';
import 'package:movie_app/presentation/watch/widget/similar_movies.dart';
import 'package:movie_app/presentation/watch/widget/video_overview.dart';
import 'package:movie_app/presentation/watch/widget/video_player.dart';
import 'package:movie_app/presentation/watch/widget/video_release_date.dart';
import 'package:movie_app/presentation/watch/widget/video_title.dart';
import 'package:movie_app/presentation/watch/widget/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoTitle(title: movieEntity.title!),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(
                  voteAverage: movieEntity.voteAverage!,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            VideoOverview(overview: movieEntity.overview!),
            const SizedBox(
              height: 16,
            ),
            RecommendationMovie(movieId: movieEntity.id!),
            const SizedBox(
              height: 16,
            ),
            SimilarMovies(movieId: movieEntity.id!),
          ],
        ),
      ),
    );
  }
}
