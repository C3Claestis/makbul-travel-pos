// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';

// --- 1. Model Data Sesuai ERD ---
class DummyUserModel {
  final int id;
  final String firebaseUid; // Kunci penghubung ke Firebase
  final String name;
  final String email;
  final String role;
  final String authProvider;

  DummyUserModel({
    required this.id,
    required this.firebaseUid,
    required this.name,
    required this.email,
    required this.role,
    required this.authProvider,
  });
}

// --- 2. Mock Backend Service ---
class MockBackendService {
  static final MockBackendService instance = MockBackendService._internal();
  MockBackendService._internal();

  final List<DummyUserModel> _usersTable = [];
  int _autoIncrementId = 1;

  List<DummyUserModel> get allUsers => _usersTable;

  Future<void> createUserInDatabase({
    required String firebaseUid,
    required String name,
    required String email,
    required String role,
    required String authProvider,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final existingUser = _usersTable.where((u) => u.firebaseUid == firebaseUid);

    if (existingUser.isEmpty) {
      final newUser = DummyUserModel(
        id: _autoIncrementId++,
        firebaseUid: firebaseUid,
        name: name.isEmpty ? "User Baru" : name,
        email: email,
        role: role,
        authProvider: authProvider,
      );
      _usersTable.add(newUser);
    }
  }

  DummyUserModel? getUserByUid(String uid) {
    try {
      return _usersTable.firstWhere((u) => u.firebaseUid == uid);
    } catch (_) {
      return null;
    }
  }
}

// --- 3. Riverpod Provider ---
// Agar mudah dipanggil dari UI Anda
final mockBackendProvider = Provider<MockBackendService>((ref) {
  return MockBackendService.instance;
});