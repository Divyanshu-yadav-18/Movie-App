import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class GetMovieTrailerUseCase
    extends Usecase<Either<String, List<TrailersEntity>>, int> {
  @override
  Future<Either<String, List<TrailersEntity>>> call(
      {required int params}) async {
    return await sl<MovieRepository>().getMoviesTrailer(params);
  }
}
