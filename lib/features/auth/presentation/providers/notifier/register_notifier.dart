import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/cores/abstracts/failure.dart';
import 'package:project3/features/auth/domain/usecases/do_register.dart';
import 'package:project3/features/auth/presentation/providers/login_provider.dart';
import 'package:project3/features/auth/presentation/providers/state/register_state.dart';

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  final doRegister = ref.read(doRegisterProvider);
  return RegisterNotifier(doRegister);
});

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier(this._doRegister) : super(RegisterState.initial());
  final DoRegister _doRegister;

  Future<void> handleShowPassword() async {
    state = state.copyWith(isLoading: true, hidePassword: !state.hidePassword);
  }

  Future<void> handleRegister(
      {required String userEmail, required String password}) async {
    state = state.copyWith(isLoading: true);
    final result = await _doRegister(
      DoRegisterParams(
        userEmail: userEmail,
        password: password,
      ),
    );

    result.fold(
      (l) {
        if (l is LoginFailure) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: 'username/password salah',
          );
        } else if (l is NetworkFailure) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: 'Tidak ada koneksi intenet',
          );
        } else {
          state = state.copyWith(
            isLoading: false,
            errorMessage: 'register gagal',
          );
        }
      },
      (r) {
        state = state.copyWith(
          isLoading: false,
          isLogin: true,
          errorMessage: '',
        );
      },
    );
  }
}
