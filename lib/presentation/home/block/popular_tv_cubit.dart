import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/presentation/home/block/popular_tv_state.dart';
import 'package:movie_app/service_locator.dart';

class PopularTVCubit extends Cubit<PopularTVState> {
  PopularTVCubit() : super(PopularTVLoading());

  void getPopularTV() async {
    var returnedData = await sl<GetPopularTvUseCase>().call();
    returnedData.fold((error) {
      emit(FailureLoadedPopularTV(errorMessage: error));
    }, (data) {
      emit(
        PopularTVLoaded(tv: data),
      );
    });
  }
}
