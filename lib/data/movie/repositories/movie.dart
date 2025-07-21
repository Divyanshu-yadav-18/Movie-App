import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/common/helper/mapper/trailer.dart';
import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/core/models/trailer.dart';
import 'package:movie_app/data/movie/model/model.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/domain/movie/entites/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either<String, List<MovieEntity>>> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data)
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<String, List<MovieEntity>>> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data)
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<String, List<TrailersEntity>>> getMoviesTrailer(
      int movieId) async {
    var returnedData = await sl<MovieService>().getMoviesTrailer(movieId);

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var trailers = List.from(data)
            .map((item) => TrailerMapper.toEntity(TrailersModel.fromJson(item)))
            .toList();
        return Right(trailers);
      },
    );
  }

  @override
  Future<Either<String, List<MovieEntity>>> getRecommendationMovies(
      int movieId) async {
    var returnedData =
        await sl<MovieService>().getRecommendationMovies(movieId);

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data)
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<String, List<MovieEntity>>> getSimilarMovies(
      int movieId) async {
    var returnedData = await sl<MovieService>().getSimilarMovies(movieId);

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data)
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<String, List<MovieEntity>>> searchMovie(String query) async {
    var returnedData = await sl<MovieService>().searchMovie(query);

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data)
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }
}
