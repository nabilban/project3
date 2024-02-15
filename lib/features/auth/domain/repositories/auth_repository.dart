import 'package:dartz/dartz.dart';
import 'package:project3/cores/abstracts/failure.dart';
import 'package:project3/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  });
}
