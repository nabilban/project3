import 'package:project3/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../cores/abstracts/exception.dart';

abstract class AuthDatasource {
  Future<User> login({
    required String userEmail,
    required String password,
  });
}

class AuthDatasourceImpl extends AuthDatasource {
  @override
  Future<User> login({
    required String userEmail,
    required String password,
  }) async {
    try {
      final email = userEmail.trim();
      final result = await supabase.auth
          .signInWithPassword(password: password, email: email);

      if (result.user != null) {
        throw LoginException();
      }
      return result.user!;
    } catch (e) {
      throw UnknownException();
    }
  }
}
