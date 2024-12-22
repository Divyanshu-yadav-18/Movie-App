import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthApiService authApiService;
  AuthRepositoryImpl({required this.authApiService});
  @override
  Future<Either> signup(SignupReqParam params) async {
    return await authApiService.signup(params);
  }
}
