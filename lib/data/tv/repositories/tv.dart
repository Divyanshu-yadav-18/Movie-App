import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/keyword_mapper.dart';
import 'package:movie_app/common/helper/mapper/tv_mapper.dart';
import 'package:movie_app/core/models/keywords.dart';
import 'package:movie_app/data/tv/models/tv.dart';
import 'package:movie_app/data/tv/source/tv.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TVService>().getPopularTv();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getRecommendationTvs(int tvId) async {
    var returnedData = await sl<TVService>().getRecommendationTvs(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarTv(int tvId) async {
    var returnedData = await sl<TVService>().getSimilarTv(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl<TVService>().getKeywords(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }
}
