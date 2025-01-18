import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movie_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movie_state.dart';

class NowPlayingMovies extends StatelessWidget {
  final int movieId;
  const NowPlayingMovies({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecommendationMovieCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<RecommendationMovieCubit, RecommendationMoviesState>(
        builder: (context, state) {
          if (state is RecommendationMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RecommendationMoviesLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MovieCard(movieEntity: state.movie[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: state.movie.length),
            );
          }
          if (state is FailureLoadRecommendationMovies) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
