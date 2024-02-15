import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/features/auth/presentation/providers/notifier/register_notifier.dart';
import 'package:project3/features/auth/presentation/providers/state/register_state.dart';
import 'package:project3/features/auth/presentation/widgets/auth_button.dart';
import 'package:project3/features/auth/presentation/widgets/auth_text_field.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerNotifer = ref.read(registerNotifierProvider.notifier);
    final RegisterState state = ref.watch(registerNotifierProvider);

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  child: Text(
                'REGISTER ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 15,
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
                    registerNotifer.handleShowPassword();
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
              registerNotifer.handleRegister(
                  userEmail: _emailController.text,
                  password: _passwordController.text);
            },
            text: 'REGISTER',
          )
        ],
      ),
    );
  }
}
