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
  // Ini bertindak sebagai "tabel users" sementara di lokal memori
  final List<DummyUserModel> _usersTable = [];
  int _autoIncrementId = 1;

  List<DummyUserModel> get allUsers => _usersTable;

  // Fungsi untuk mensimulasikan API Insert/Register
  Future<void> createUserInDatabase({
    required String firebaseUid,
    required String name,
    required String email,
    required String role,
    required String authProvider,
  }) async {
    // Simulasi loading API internet (jeda 1.5 detik)
    await Future.delayed(const Duration(milliseconds: 1500));

    // Cek apakah user sudah ada (untuk kasus Google/FB Login)
    final existingUser = _usersTable
        .where((u) => u.firebaseUid == firebaseUid)
        .toList();

    if (existingUser.isEmpty) {
      // Simpan data ke "database lokal"
      final newUser = DummyUserModel(
        id: _autoIncrementId++,
        firebaseUid: firebaseUid,
        name: name.isEmpty
            ? "User Baru"
            : name, // Default jika nama kosong dari sosmed
        email: email,
        role: role,
        authProvider: authProvider,
      );
      _usersTable.add(newUser);

      print("✅ [MOCK API] User berhasil disimpan ke database lokal!");
    } else {
      print("ℹ️ [MOCK API] User sudah terdaftar di database lokal.");
    }

    // --- BAGIAN PRINT DATA USER ---
    print("📊 Total user di DB lokal sekarang: ${_usersTable.length}");
    print("📝 Daftar Data User:");
    for (var user in _usersTable) {
      print("   -> ID: ${user.id} | Nama: ${user.name} | Email: ${user.email} | Role: ${user.role} | Provider: ${user.authProvider}");
    }
    print("---------------------------------------------------");
  }
}

// --- 3. Riverpod Provider ---
// Agar mudah dipanggil dari UI Anda
final mockBackendProvider = Provider<MockBackendService>((ref) {
  return MockBackendService();
});