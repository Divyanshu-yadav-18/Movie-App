import 'package:movie_app/domain/movie/entites/movie.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MoviesLoaded extends SearchState {
  final List<MovieEntity> movie;
  MoviesLoaded({required this.movie});
}

class TVLoaded extends SearchState {
  final List<TVEntity> tv;
  TVLoaded({required this.tv});
}

class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({required this.errorMessage});
}
