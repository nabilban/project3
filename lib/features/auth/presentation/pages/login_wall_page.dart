import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/cores/routes/router.dart';
import 'package:project3/features/auth/presentation/widgets/auth_button.dart';

class LoginWallPage extends ConsumerWidget {
  const LoginWallPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 400,
                ),
                AuthButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  text: 'REGISTER',
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  text: 'LOGIN',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
