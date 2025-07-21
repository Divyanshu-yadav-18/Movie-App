import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_trailer.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    emit(TrailerLoading());
    final returnedData =
        await sl<GetMovieTrailerUseCase>().call(params: movieId);

    returnedData.fold(
      (error) => emit(LoadFailureTrailer(errorMessage: error)),
      (trailers) {
        if (trailers.isEmpty) {
          emit(LoadFailureTrailer(errorMessage: 'No trailers found'));
          return;
        }

        final trailer = trailers.firstWhere(
          (t) => t.key != null && t.site?.toLowerCase() == 'youtube',
          orElse: () => trailers.first,
        );

        final controller = YoutubePlayerController(
          initialVideoId: trailer.key!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: true,
          ),
        );

        emit(TrailerLoaded(youtubePlayerController: controller));
      },
    );
  }
}
