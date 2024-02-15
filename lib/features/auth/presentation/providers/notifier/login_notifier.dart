import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/cores/abstracts/failure.dart';
import 'package:project3/features/auth/domain/usecases/do_login.dart';
import 'package:project3/features/auth/presentation/providers/login_provider.dart';
import 'package:project3/features/auth/presentation/providers/state/login_state.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final doLogin = ref.read(doLoginProvider);
  return LoginNotifier(doLogin);
});

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this._doLogin) : super(LoginState.initial());

  final DoLogin _doLogin;

  Future<void> handleShowPassword() async {
    state = state.copyWith(isLoading: true, hidePassword: !state.hidePassword);
  }

  Future<void> handleLogin(
      {required String userEmail, required String password}) async {
    state = state.copyWith(isLoading: true);
    final result = await _doLogin(
      DoLoginParams(
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
            errorMessage: 'login gagal',
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
