import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makbul_app/page/login_page.dart';

// Pastikan import ini disesuaikan dengan lokasi file provider Anda
import 'package:makbul_app/service/mock_backend_service.dart'; 

// 1. Ubah menjadi ConsumerWidget
class DashboardAgent extends ConsumerWidget {
  const DashboardAgent({super.key});

  // 2. Tambahkan fungsi untuk memunculkan Bottom Sheet
  void _showUsersData(BuildContext context, WidgetRef ref) {
    // Ambil data user dari provider
    final backendService = ref.read(mockBackendProvider);
    final users = backendService.allUsers;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Data User di Database Lokal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              
              // Jika data kosong
              if (users.isEmpty)
                const Expanded(
                  child: Center(child: Text('Belum ada data user.')),
                )
              // Jika ada data, tampilkan dalam bentuk List
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xff23762C),
                            child: Text(
                              user.name[0].toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(user.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.email),
                              Text('Role: ${user.role} | Auth: ${user.authProvider}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  // 3. Tambahkan WidgetRef ref di parameter build
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Dapatkan user yang sedang login dari Firebase
    final firebaseUser = FirebaseAuth.instance.currentUser;

    // 2. Cari data lengkap user di Mock Backend berdasarkan UID Firebase
    final userData = ref.watch(mockBackendProvider).allUsers.firstWhere(
          (u) => u.firebaseUid == firebaseUser?.uid,
          orElse: () => DummyUserModel(id: 0, firebaseUid: '', name: 'Agent', email: '', role: '', authProvider: ''),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Agen'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: const Color(0xff23762C),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang Agent ${userData.name}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            
            // 👇 INI ADALAH TOMBOL UNTUK MELIHAT DATA 👇
            ElevatedButton.icon(
              onPressed: () => _showUsersData(context, ref),
              icon: const Icon(Icons.people, color: Colors.white),
              label: const Text(
                'Lihat Data User',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff23762C),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}