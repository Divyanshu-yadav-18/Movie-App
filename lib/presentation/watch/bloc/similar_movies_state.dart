import 'package:movie_app/domain/movie/entites/movie.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieEntity> movie;
  SimilarMoviesLoaded({required this.movie});
}

class FailureLoadSimilarMovies extends SimilarMoviesState {
  final String errorMessage;
  FailureLoadSimilarMovies({required this.errorMessage});
}
