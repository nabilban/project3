import 'package:dartz/dartz.dart';
import 'package:project3/cores/abstracts/failure.dart';
import 'package:project3/cores/abstracts/usecase.dart';
import 'package:project3/features/auth/domain/entities/auth_entity.dart';
import 'package:project3/features/auth/domain/repositories/auth_repository.dart';

class DoLogin extends UseCase<AuthEntity, DoLoginParams> {
  final AuthRepository repository;

  DoLogin({required this.repository});
  @override
  Future<Either<Failure, AuthEntity>> call(params) async {
    final result = await repository.login(
      email: params.userEmail,
      password: params.password,
    );

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}

class DoLoginParams {
  final String userEmail;
  final String password;

  DoLoginParams({required this.password, required this.userEmail});
}
