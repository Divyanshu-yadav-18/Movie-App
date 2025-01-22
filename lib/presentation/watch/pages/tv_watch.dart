import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/presentation/watch/widget/movie_keywords.dart';
import 'package:movie_app/presentation/watch/widget/recommendation_tvs.dart';
import 'package:movie_app/presentation/watch/widget/similar_tv.dart';
import 'package:movie_app/presentation/watch/widget/video_overview.dart';
import 'package:movie_app/presentation/watch/widget/video_player.dart';
import 'package:movie_app/presentation/watch/widget/video_title.dart';
import 'package:movie_app/presentation/watch/widget/video_vote_average.dart';

class TvWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TvWatchPage({required this.tvEntity, super.key});

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
            VideoPlayer(id: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(
              height: 16,
            ),
            TVKeywords(tvId: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
            VideoVoteAverage(
              voteAverage: tvEntity.voteAverage!,
            ),
            const SizedBox(
              height: 16,
            ),
            VideoOverview(overview: tvEntity.overview!),
            const SizedBox(
              height: 16,
            ),
            RecommendationTvs(tvId: tvEntity.id!),
            const SizedBox(
              height: 16,
            ),
            SimilarTv(tvId: tvEntity.id!),
          ],
        ),
      ),
    );
  }
}
