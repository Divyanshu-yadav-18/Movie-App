import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/get_now_trending_movies.dart';
import 'package:movie_app/presentation/home/block/now_playing_state.dart';
import 'package:movie_app/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetNowTrendingMovies>().call();
    returnedData.fold((error) {
      emit(FailureLoadNowPlayingMovies(errorMessage: error));
    }, (data) {
      emit(
        NowPlayingMoviesLoaded(movies: data),
      );
    });
  }
}
