import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entity/keyboard.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';

abstract class TVRepository {
  Future<Either<String, List<TVEntity>>> getPopularTv();
  Future<Either<String, List<TVEntity>>> getRecommendationTvs(int tvId);

  Future<Either<String, List<TVEntity>>> getSimilarTv(int tvId);
  Future<Either<String, List<KeywordEntity>>> getKeywords(int tvId);
  Future<Either<String, List<TVEntity>>> searchTV(String query);
}
