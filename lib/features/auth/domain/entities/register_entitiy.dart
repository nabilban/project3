import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterEntity extends Equatable {
  final User user;
  const RegisterEntity({required this.user});
  @override
  List<Object?> get props => [user];
}
