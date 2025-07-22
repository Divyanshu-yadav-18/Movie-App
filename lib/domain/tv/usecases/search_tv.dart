import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class SearchTVUseCase extends Usecase<Either<String, List<TVEntity>>, String> {
  @override
  Future<Either<String, List<TVEntity>>> call({String? params}) async {
    return await sl<TVRepository>().searchTV(params!);
  }
}
