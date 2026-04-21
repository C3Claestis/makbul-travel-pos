import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:makbul_app/page/auth/providers/auth_service.dart';

final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authServiceProvider = Provider<AuthService>((ref) {
  final auth = ref.read(authProvider);
  return AuthService(auth);
});

final loginVisibilityProvider = StateProvider<bool>((ref) => true);
final registerVisibilityProvider = StateProvider<bool>((ref) => true);
