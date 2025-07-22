import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class GetSimilarTVsUseCase
    extends Usecase<Either<String, List<TVEntity>>, int> {
  @override
  Future<Either<String, List<TVEntity>>> call({int? params}) async {
    return await sl<TVRepository>().getSimilarTv(params!);
  }
}
