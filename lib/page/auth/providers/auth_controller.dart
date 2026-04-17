import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'auth_service.dart';
import 'auth_provider.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<User?>>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthController(authService);
});

class AuthController extends StateNotifier<AsyncValue<User?>> {
  final AuthService _authService;

  AuthController(this._authService) : super(const AsyncData(null));

  Future<void> loginEmail(String email, String password) async {
    state = const AsyncLoading();
    try {
      final user = await _authService.loginWithEmail(email, password);
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> loginGoogle() async {
    state = const AsyncLoading();
    try {
      final user = await _authService.loginGoogle();
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    state = const AsyncData(null);
  }
}