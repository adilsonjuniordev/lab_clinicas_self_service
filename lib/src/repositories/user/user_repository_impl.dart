// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/core/constants/app_api_path.dart';

import 'package:lab_clinicas_self_service/src/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthException, String>> login(String email, String password) async {
    try {
      var Response(data: {'access_token': accessToken}) = await restClient.unAuth.post(AppApiPath.auth, data: {
        'email': email,
        'password': password,
        'admin': true,
      });

      return Right(accessToken);
    } on DioException catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      return switch (e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) => Left(AuthUnauthorizedException()),
        _ => Left(AuthError(message: 'Erro ao realizar login')),
      };
    }
  }
}
