import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/data/tv/source/tv.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TVService>().getPopularTv();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content']).map((item) => MovieMapper());
      return Right(movies);
    });
  }
}
