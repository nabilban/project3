import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/cores/routes/router.dart';
import 'package:project3/features/auth/presentation/providers/notifier/login_notifier.dart';
import 'package:project3/features/auth/presentation/providers/state/login_state.dart';
import 'package:project3/features/auth/presentation/widgets/auth_button.dart';
import 'package:project3/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:project3/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<LoginForm> {
  bool _redirecting = false;

  late final StreamSubscription<AuthState> _authStateSubscription;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    final LoginState state = ref.watch(loginNotifierProvider);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 40,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          // ignore: prefer_const_constructors
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(
                  child: Text(
                'LOGIN ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ],
          ),
          SizedBox(
            child: AuthTextfield(
              prefixIcon: const Icon(Icons.email_outlined),
              hintText: 'email',
              controller: _emailController,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: AuthTextfield(
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: IconButton(
                  tooltip: 'Show Password',
                  onPressed: () {
                    loginNotifier.handleShowPassword();
                  },
                  icon: state.hidePassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
              hintText: 'password',
              obscureText: state.hidePassword,
              controller: _passwordController,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (state.errorMessage != '')
            Text(
              state.errorMessage,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          AuthButton(
            onTap: () {
              loginNotifier.handleLogin(
                  userEmail: _emailController.text,
                  password: _passwordController.text);
            },
            text: 'LOGIN',
          )
        ],
      ),
    );
  }
}
