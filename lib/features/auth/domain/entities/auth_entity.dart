import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthEntity extends Equatable {
  final User user;
  const AuthEntity({required this.user});
  @override
  List<Object?> get props => [user];
}
