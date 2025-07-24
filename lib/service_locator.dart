import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/reposetories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/movie/repositories/movie.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/data/tv/repositories/tv.dart';
import 'package:movie_app/data/tv/source/tv.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_app/domain/movie/usecases/get_now_trending_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/movie/usecases/search_movie.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_keywords.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_recommendation_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_similar_tv.dart';
import 'package:movie_app/domain/tv/usecases/search_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  final token = dotenv.env['TMDB_BEARER'];
  if (token == null) {
    throw Exception('TMDB_BEARER not found in .env');
  }

  sl.registerSingleton<DioClient>(DioClient(token: token));

  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());
  sl.registerSingleton<TVService>(TVApiServiceImpl());

  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());

  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowTrendingMovies>(GetNowTrendingMovies());
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(
      GetRecommendationMoviesUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
  sl.registerSingleton<GetRecommendationTvUseCase>(
      GetRecommendationTvUseCase());
  sl.registerSingleton<GetSimilarTVsUseCase>(GetSimilarTVsUseCase());
  sl.registerSingleton<GetKeywordsUseCase>(GetKeywordsUseCase());
  sl.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase());
  sl.registerSingleton<SearchTVUseCase>(SearchTVUseCase());
}
