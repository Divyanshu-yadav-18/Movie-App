import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app/service_locator.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);
    returedData.fold((error) {
      emit(LoadFailureTrailer(errorMessage: error));
    }, (data) {
      TrailersEntity trailersEntity = data;
      emit(TrailerLoaded(chewieController: chewieController));
    });
  }
}
