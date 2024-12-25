import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';

class SignUpUseCase extends Usecase<Either, SignupReqParam> {
  final AuthRepository authRepository;
  SignUpUseCase({required this.authRepository});

  @override
  Future<Either> call({SignupReqParam? params}) async {
    return await authRepository.signup(params!);
  }
}
