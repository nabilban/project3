import 'package:dartz/dartz.dart';
import 'package:project3/cores/abstracts/failure.dart';
import 'package:project3/cores/abstracts/usecase.dart';
import 'package:project3/features/auth/domain/entities/register_entitiy.dart';
import 'package:project3/features/auth/domain/repositories/auth_repository.dart';

class DoRegister extends UseCase<RegisterEntity, DoRegisterParams> {
  final AuthRepository repository;

  DoRegister({required this.repository});
  @override
  Future<Either<Failure, RegisterEntity>> call(params) async {
    final result = await repository.register(
      email: params.userEmail,
      password: params.password,
    );

    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}

class DoRegisterParams {
  final String userEmail;
  final String password;

  DoRegisterParams({required this.password, required this.userEmail});
}
