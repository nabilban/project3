import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/cores/routes/router.dart';
import 'package:project3/cores/widgets/my_button.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('splash page'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              MyButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.register);
                },
                text: 'REGISTER',
              ),
              const SizedBox(
                height: 15,
              ),
              MyButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                text: 'LOGIN',
              )
            ],
          ),
        ),
      ),
    );
  }
}
