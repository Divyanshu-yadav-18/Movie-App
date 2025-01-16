import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app/service_locator.dart';
import 'package:video_player/video_player.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);
    returedData.fold((error) {
      emit(LoadFailureTrailer(errorMessage: error));
    }, (data) async {
      TrailersEntity trailersEntity = data;
      VideoPlayerController videoPlayerController =
          VideoPlayerController.networkUrl(
              Uri.tryParse(ApiUrl.trailerBase + trailersEntity.key!)!);
      await videoPlayerController.initialize();
      final chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: false,
          looping: false);
      emit(TrailerLoaded(chewieController: chewieController));
    });
  }
}
