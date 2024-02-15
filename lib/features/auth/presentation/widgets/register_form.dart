import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/cores/routes/router.dart';
import 'package:project3/features/auth/presentation/widgets/auth_button.dart';
import 'package:project3/features/auth/presentation/widgets/auth_text_field.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: AuthTextField(
              prefixIcon: const Icon(Icons.email_outlined),
              hintText: 'email',
              controller: emailController,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: AuthTextField(
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: IconButton(
                  tooltip: 'Show Password',
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off),
                ),
              ),
              hintText: 'password',
              obscureText: true,
              controller: passwordController,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'error',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AuthButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.root);
            },
            text: 'REGISTER',
          )
        ],
      ),
    );
  }
}
