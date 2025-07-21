import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/domain/movie/entites/movie.dart';

abstract class MovieRepository {
  Future<Either<String, List<MovieEntity>>> getTrendingMovies();
  Future<Either<String, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<String, List<TrailersEntity>>> getMoviesTrailer(int movieId);
  Future<Either<String, List<MovieEntity>>> getRecommendationMovies(
      int movieId);
  Future<Either<String, List<MovieEntity>>> getSimilarMovies(int movieId);
  Future<Either<String, List<MovieEntity>>> searchMovie(String query);
}
