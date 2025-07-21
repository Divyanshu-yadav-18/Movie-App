import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  final int id;

  const VideoPlayer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrailerCubit()..getMovieTrailer(id),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadFailureTrailer) {
            return Center(child: Text(state.errorMessage));
          } else if (state is TrailerLoaded) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,
              aspectRatio: 16 / 9,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
