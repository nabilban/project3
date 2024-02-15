import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.isLogin,
    required this.isLoading,
    required this.hidePassword,
    this.errorMessage = '',
  });

  final bool isLoading;
  final bool hidePassword;
  final bool isLogin;
  final String errorMessage;

  @override
  List<Object?> get props => [
        errorMessage,
        hidePassword,
        isLoading,
        isLogin,
      ];

  factory LoginState.initial() {
    return const LoginState(
      isLogin: false,
      isLoading: true,
      hidePassword: true,
    );
  }

  LoginState copyWith({
    bool? isLogin,
    bool? isLoading,
    bool? hidePassword,
    String? errorMessage,
  }) {
    return LoginState(
      isLogin: isLogin ?? this.isLogin,
      isLoading: isLoading ?? this.isLoading,
      hidePassword: hidePassword ?? this.hidePassword,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
