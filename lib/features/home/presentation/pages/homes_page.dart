import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/cores/routes/router.dart';
import 'package:project3/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () {
            supabase.auth.signOut();
            Navigator.pushReplacementNamed(context, Routes.loginWall);
          },
          child: const Text('test')),
    );
  }
}
