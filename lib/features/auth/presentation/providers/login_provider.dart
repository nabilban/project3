import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/features/auth/data/datasource/auth_datasource.dart';
import 'package:project3/features/auth/domain/repositories/auth_repository.dart';
import 'package:project3/features/auth/data/repositoryimpl/auth_repository_impl.dart';
import 'package:project3/features/auth/domain/usecases/do_login.dart';
import 'package:project3/features/auth/domain/usecases/do_register.dart';

final loginDatasourceProvider = Provider<AuthDatasource>((ref) {
  return AuthDatasourceImpl();
});

final loginRepositoryProvider = Provider<AuthRepository>((ref) {
  final datasource = ref.read(loginDatasourceProvider);
  return AuthRepositoryImpl(datasource: datasource);
});

final doLoginProvider = Provider((ref) {
  final repository = ref.read(loginRepositoryProvider);
  return DoLogin(repository: repository);
});

final doRegisterProvider = Provider((ref) {
  final repository = ref.read(loginRepositoryProvider);
  return DoRegister(repository: repository);
});
