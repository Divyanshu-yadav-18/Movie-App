import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/keyword_mapper.dart';
import 'package:movie_app/common/helper/mapper/tv_mapper.dart';
import 'package:movie_app/core/entity/keyboard.dart';
import 'package:movie_app/core/models/keywords.dart';
import 'package:movie_app/data/tv/models/tv.dart';
import 'package:movie_app/data/tv/source/tv.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  final TVService _tvService = sl<TVService>();

  List<TVEntity> _mapTvList(List<dynamic> jsonList) {
    return jsonList
        .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
        .toList();
  }

  List<KeywordEntity> _mapKeywordList(List<dynamic> jsonList) {
    return jsonList
        .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
        .toList();
  }

  @override
  Future<Either<String, List<TVEntity>>> getPopularTv() async {
    final result = await _tvService.getPopularTv();

    return result.fold(
      (error) => Left(error),
      (data) => Right(_mapTvList(data['result'] as List)),
    );
  }

  @override
  Future<Either<String, List<TVEntity>>> getRecommendationTvs(int tvId) async {
    final result = await _tvService.getRecommendationTvs(tvId);

    return result.fold(
      (error) => Left(error),
      (data) => Right(_mapTvList(data['result'] as List)),
    );
  }

  @override
  Future<Either<String, List<TVEntity>>> getSimilarTv(int tvId) async {
    final result = await _tvService.getSimilarTv(tvId);

    return result.fold(
      (error) => Left(error),
      (data) => Right(_mapTvList(data['result'] as List)),
    );
  }

  @override
  Future<Either<String, List<KeywordEntity>>> getKeywords(int tvId) async {
    final result = await _tvService.getKeywords(tvId);

    return result.fold(
      (error) => Left(error),
      (data) => Right(_mapKeywordList(data['result'] as List)),
    );
  }

  @override
  Future<Either<String, List<TVEntity>>> searchTV(String query) async {
    final result = await _tvService.searchTV(query);

    return result.fold(
      (error) => Left(error),
      (data) => Right(_mapTvList(data['result'] as List)),
    );
  }
}
