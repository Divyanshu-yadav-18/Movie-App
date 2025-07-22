import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class GetPopularTvUseCase
    extends Usecase<Either<String, List<TVEntity>>, void> {
  @override
  Future<Either<String, List<TVEntity>>> call({void params}) async {
    return await sl<TVRepository>().getPopularTv();
  }
}
