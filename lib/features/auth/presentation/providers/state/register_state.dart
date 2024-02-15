import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({
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

  factory RegisterState.initial() {
    return const RegisterState(
      isLogin: false,
      isLoading: true,
      hidePassword: true,
    );
  }

  RegisterState copyWith({
    bool? isLogin,
    bool? isLoading,
    bool? hidePassword,
    String? errorMessage,
  }) {
    return RegisterState(
      isLogin: isLogin ?? this.isLogin,
      isLoading: isLoading ?? this.isLoading,
      hidePassword: hidePassword ?? this.hidePassword,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
