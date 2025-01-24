import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/search_movie.dart';
import 'package:movie_app/domain/tv/usecases/search_tv.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(String query, SearchType searchtype) {
    emit(SearchLoading());

    switch (searchtype) {
      case SearchType.movie:
        searchMovie(query);
        break;
      case SearchType.tv:
        searchTV(query);
        break;
    }
  }

  Future<void> searchMovie(String query) async {
    var returnedData = await sl<SearchMovieUseCase>().call(params: query);
    returnedData.fold((errorMessage) {
      emit(SearchFailure(errorMessage: errorMessage));
    }, (data) {
      emit(MoviesLoaded(movie: data));
    });
  }

  Future<void> searchTV(String query) async {
    var returnedData = await sl<SearchTVUseCase>().call(params: query);
    returnedData.fold((errorMessage) {
      emit(SearchFailure(errorMessage: errorMessage));
    }, (data) {
      emit(TVLoaded(tv: data));
    });
  }
}
