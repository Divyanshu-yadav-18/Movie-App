import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/service_locator.dart';

class AuthApiServiceImpl {
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
}

class AuthFirebaseServiceImpl {
  Future<Either> signup(SignupReqParam params) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
