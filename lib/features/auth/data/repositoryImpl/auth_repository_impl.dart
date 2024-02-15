import 'package:dartz/dartz.dart';
import 'package:project3/cores/abstracts/exception.dart';
import 'package:project3/cores/abstracts/failure.dart';
import 'package:project3/features/auth/data/datasource/auth_datasource.dart';
import 'package:project3/features/auth/domain/entities/auth_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.datasource});

  final AuthDatasource datasource;

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final User user = await datasource.login(
        userEmail: email,
        password: password,
      );
      return Right(AuthEntity(user: user));
    } on LoginException {
      return Left(LoginFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
