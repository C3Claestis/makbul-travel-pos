import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:makbul_app/page/auth/pages/login_page.dart';

// Pastikan import ini disesuaikan dengan lokasi file provider Anda
import 'package:cloud_firestore/cloud_firestore.dart';

// 1. Ubah menjadi ConsumerWidget
class DashboardAgent extends ConsumerWidget {
  const DashboardAgent({super.key});

  // 2. Tambahkan fungsi untuk memunculkan Bottom Sheet
  void _showUsersData(BuildContext context, WidgetRef ref) {
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
                'Data User dari Firestore',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),

              /// 🔥 STREAM FIRESTORE
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context, snapshot) {
                    // Loading
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // Error
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    // Tidak ada data
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('Belum ada data user'));
                    }

                    final users = snapshot.data!.docs;

                    // List user
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final data =
                            users[index].data() as Map<String, dynamic>;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xff23762C),
                              child: Text(
                                (data['name'] ?? 'U')[0].toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(data['name'] ?? '-'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data['email'] ?? '-'),
                                Text(
                                  'Role: ${data['role']} | Auth: ${data['authProvider']}',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser?.uid)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!.data() as Map<String, dynamic>?;

        final name = data?['name'] ?? 'User';

        return Scaffold(
          appBar: AppBar(
            title: Text('Dashboard Agent'),
            actions: [
              IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
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
                Text('Selamat Datang Agent $name'),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => _showUsersData(context, ref),
                  icon: const Icon(Icons.people, color: Colors.green),
                  label: const Text(
                    'Lihat Data User',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
