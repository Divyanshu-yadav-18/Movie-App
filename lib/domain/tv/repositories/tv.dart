import 'package:dartz/dartz.dart';

abstract class TVRepository {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTvs(int tvId);

  Future<Either> getSimilarTv(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTV(String query);
}
