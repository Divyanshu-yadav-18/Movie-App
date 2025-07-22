import 'package:dartz/dartz.dart';
import 'package:movie_app/core/entity/keyboard.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class GetKeywordsUseCase
    extends Usecase<Either<String, List<KeywordEntity>>, int> {
  @override
  Future<Either<String, List<KeywordEntity>>> call({int? params}) async {
    return await sl<TVRepository>().getKeywords(params!);
  }
}
