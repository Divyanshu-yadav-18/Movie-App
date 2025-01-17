import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMoviesTrailer(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
}
