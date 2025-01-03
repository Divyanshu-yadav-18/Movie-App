import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signin_req_param.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/service_locator.dart';

abstract class AuthService {
  Future<Either> signup(SignupReqParam params);
  Future<Either> signin(SignInReqParam params);
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<Either> signup(SignupReqParam params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(SignInReqParam params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toMap(),
      );
      return right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
