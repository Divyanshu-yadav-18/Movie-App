import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

import '../../../data/auth/models/signin_req_param.dart';

class SignInUseCase extends Usecase<Either, SignInReqParam> {
  @override
  Future<Either> call({SignInReqParam? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
