// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/auth/pages/login_page.dart';

// Pastikan import ini disesuaikan dengan lokasi file provider Anda
import 'package:cloud_firestore/cloud_firestore.dart';

// 1. Ubah menjadi ConsumerWidget
class DashboardJamaah extends ConsumerWidget {
  const DashboardJamaah({super.key});

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
            title: Text('Dashboard Jamaah'),
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 6),
                      ],
                    ),
                    child: Text(
                      'Selamat Datang Jamaah $name',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff23762C),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      _card('Profile', 'icon_pengguna'),
                      _card('Paket Umrah', 'icon_paketUmrah'),
                      _card('Pembayaran', 'icon_pembayaran'),
                      _card('Dashboard', 'icon_dashboard'),
                      _card('Jamaah Saya', 'icon_jamaah'),
                      _card('Pengguna', 'icon_pengguna'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Paket',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.6, // biar proporsional
                        ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 🔹 Gambar (40%)
                            Expanded(
                              flex: 4,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  'assets/images/kaba.jpg',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            // 🔹 Content (60%)
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Nama Paket
                                    const Text(
                                      "Umroh Reguler 9 Hari",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    // Maskapai
                                    const Text(
                                      "Maskapai: Garuda Indonesia",
                                      style: TextStyle(fontSize: 12),
                                    ),

                                    // Durasi
                                    const Text(
                                      "Durasi: 9 Hari",
                                      style: TextStyle(fontSize: 12),
                                    ),

                                    const SizedBox(height: 4),

                                    // Harga
                                    const Text(
                                      "Rp 28.000.000",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    // Fasilitas
                                    const Text(
                                      "Fasilitas:",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    const Text(
                                      "- Hotel Bintang 5\n- Makan 3x sehari\n- Tour Madinah",
                                      style: TextStyle(fontSize: 11),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // ElevatedButton.icon(
                  //   onPressed: () => _showUsersData(context, ref),
                  //   icon: const Icon(Icons.people, color: Colors.green),
                  //   label: const Text(
                  //     'Lihat Data User',
                  //     style: TextStyle(color: Colors.green),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Card _card(String title, String icon) {
    return Card(
      color: const Color(0xff23762C),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svgs/$icon.svg', color: Colors.white),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
