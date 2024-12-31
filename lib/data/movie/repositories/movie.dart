import 'package:dartz/dartz.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {});
  }
}
