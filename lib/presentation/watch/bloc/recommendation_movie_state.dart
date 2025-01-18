import 'package:movie_app/domain/movie/entites/movie.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity> movie;
  RecommendationMoviesLoaded({required this.movie});
}

class FailureLoadRecommendationMovies extends RecommendationMoviesState {
  final String errorMessage;
  FailureLoadRecommendationMovies({required this.errorMessage});
}
