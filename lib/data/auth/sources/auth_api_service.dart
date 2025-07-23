import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signin_req_param.dart';
import 'package:movie_app/data/auth/models/user_model.dart';
import 'package:movie_app/service_locator.dart';

abstract class AuthService {
  Future<Either<String, String>> getRequestToken();
  Future<Either<String, String>> validateLogin(SignInReqParam params);
  Future<Either<String, UserModel>> createSession(String requestToken);
}

class AuthApiServiceImpl extends AuthService {
  final DioClient _client = sl<DioClient>();

  @override
  Future<Either<String, String>> getRequestToken() async {
    try {
      final res = await _client.get(ApiUrl.requestToken);
      return Right(res.data['request_token']);
    } on DioException catch (e) {
      return Left(e.response?.data['status_message'] ?? 'Failed to get token');
    }
  }

  @override
  Future<Either<String, String>> validateLogin(SignInReqParam params) async {
    try {
      final res = await _client.post(
        ApiUrl.validateTokenWithLogin,
        data: params.toMap(),
      );
      return Right(res.data['request_token']);
    } on DioException catch (e) {
      return Left(e.response?.data['status_message'] ?? 'Invalid credentials');
    }
  }

  @override
  Future<Either<String, UserModel>> createSession(String requestToken) async {
    try {
      final res = await _client.post(
        ApiUrl.createSession,
        data: {"request_token": requestToken},
      );
      return Right(UserModel.fromJson(res.data));
    } on DioException catch (e) {
      return Left(
          e.response?.data['status_message'] ?? 'Session creation failed');
    }
  }
}
