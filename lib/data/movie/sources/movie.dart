import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class MovieService {
  Future<Either<String, List<dynamic>>> getTrendingMovies();
  Future<Either<String, List<dynamic>>> getNowPlayingMovies();
  Future<Either<String, List<dynamic>>> getMoviesTrailer(int movieId);
  Future<Either<String, List<dynamic>>> getRecommendationMovies(int movieId);
  Future<Either<String, List<dynamic>>> getSimilarMovies(int movieId);
  Future<Either<String, List<dynamic>>> searchMovie(String query);
}

class MovieServiceImpl extends MovieService {
  final Dio _dio = sl<DioClient>()
      .client; // make sure DioClient sets baseUrl='https://api.themoviedb.org/3'
  final _headers = {
    'Authorization':
        'Bearer ${const String.fromEnvironment("TMDB_READ_TOKEN", defaultValue: "dev-token-here")}',
    'Content-Type': 'application/json'
  };

  @override
  Future<Either<String, List<dynamic>>> getTrendingMovies() async {
    try {
      final res = await _dio.get('/trending/movie/day',
          options: Options(headers: _headers));
      return right(res.data['results']); // 👈 TMDb nests array under "results"
    } on DioException catch (e) {
      return left(e.response?.data['status_message'] ?? e.message);
    }
  }

  @override
  Future<Either<String, List<dynamic>>> getNowPlayingMovies() async {
    try {
      final res = await _dio.get('/movie/now_playing',
          options: Options(headers: _headers));
      return right(res.data['results']);
    } on DioException catch (e) {
      return left(e.response?.data['status_message'] ?? e.message);
    }
  }

  @override
  Future<Either<String, List<dynamic>>> getMoviesTrailer(int id) async {
    try {
      final res = await _dio.get('/movie/$id/videos',
          options: Options(headers: _headers));
      return right(res.data['results']); // trailers & teasers are in this list
    } on DioException catch (e) {
      return left(e.response?.data['status_message'] ?? e.message);
    }
  }

  @override
  Future<Either<String, List<dynamic>>> getRecommendationMovies(int id) async {
    try {
      final res = await _dio.get('/movie/$id/recommendations',
          options: Options(headers: _headers));
      return right(res.data['results']);
    } on DioException catch (e) {
      return left(e.response?.data['status_message'] ?? e.message);
    }
  }

  @override
  Future<Either<String, List<dynamic>>> getSimilarMovies(int id) async {
    try {
      final res = await _dio.get('/movie/$id/similar',
          options: Options(headers: _headers));
      return right(res.data['results']);
    } on DioException catch (e) {
      return left(e.response?.data['status_message'] ?? e.message);
    }
  }

  @override
  Future<Either<String, List<dynamic>>> searchMovie(String query) async {
    try {
      final res = await _dio.get(
        '/search/movie',
        queryParameters: {'query': query},
        options: Options(headers: _headers),
      );
      return right(res.data['results']);
    } on DioException catch (e) {
      return left(e.response?.data['status_message'] ?? e.message);
    }
  }
}
