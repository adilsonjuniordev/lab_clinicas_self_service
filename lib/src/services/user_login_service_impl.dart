// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import 'package:lab_clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:lab_clinicas_self_service/src/services/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository userRepository;

  UserLoginServiceImpl({required this.userRepository});

  @override
  Future<Either<ServiceException, Unit>> execute(String email, String password) async {
    final loginResult = await userRepository.login(email, password);

    switch (loginResult) {
      case Left(value: AuthError()):
        return Left(ServiceException(message: 'Erro ao realizar login'));
      case Left(value: AuthUnauthorizedException()):
        return Left(ServiceException(message: 'Email ou senha inválidos'));
      case Right(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        await sp.setString(LocalStorageConstants.accessToken, accessToken);
        return Right(unit);
    }
  }
}
