// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/features/dashboard/presentation/pages/dashboard_agent.dart';
import 'package:makbul_app/page/features/dashboard/presentation/pages/dashboard_jamaah.dart';
import 'package:makbul_app/page/features/dashboard/presentation/pages/dashboard_travel.dart';

// Import halaman yang sudah ada
//import 'package:makbul_app/page/main/dashboard_page.dart';
import 'package:makbul_app/page/main/jamaah_page.dart';
import 'package:makbul_app/page/main/paketumrah_page.dart';
import 'package:makbul_app/page/main/pembayaran_page.dart';
import 'package:makbul_app/page/main/pengguna_page.dart';

// Import mock backend service untuk mendapatkan data user
import 'package:cloud_firestore/cloud_firestore.dart';

// Provider untuk Bottom Nav
final bottomNavIndeProvider = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndeProvider);
    final firebaseUser = FirebaseAuth.instance.currentUser;

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser?.uid)
          .get(),
      builder: (context, snapshot) {
        // 🔄 loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // ❌ kalau tidak ada data
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Scaffold(
            body: Center(child: Text("User tidak ditemukan")),
          );
        }

        final userData = snapshot.data!.data() as Map<String, dynamic>;
        final userRole = userData['role'] ?? 'jamaah';

        // ============================
        // 🔥 LOGIKA ROLE KAMU (SAMA)
        // ============================

        List<Widget> pages = [];
        List<BottomNavigationBarItem> navItems = [];

        if (userRole == 'travel') {
          pages = const [
            DashboardTravel(),
            JamaahPage(),
            PaketumrahPage(),
            PembayaranPage(),
            PenggunaPage(),
          ];

          navItems = [
            _buildNavItem('assets/svgs/icon_dashboard.svg', 'Dashboard'),
            _buildNavItem('assets/svgs/icon_jamaah.svg', 'Jamaah'),
            _buildNavItem('assets/svgs/icon_paketUmrah.svg', 'Paket Umrah'),
            _buildNavItem('assets/svgs/icon_pembayaran.svg', 'Pembayaran'),
            _buildNavItem('assets/svgs/icon_pengguna.svg', 'Pengguna'),
          ];
        } else if (userRole == 'agent') {
          pages = const [
            DashboardAgent(),
            JamaahPage(),
            PaketumrahPage(),
            PenggunaPage(),
          ];

          navItems = [
            _buildNavItem('assets/svgs/icon_dashboard.svg', 'Dashboard'),
            _buildNavItem('assets/svgs/icon_jamaah.svg', 'Jamaah Saya'),
            _buildNavItem('assets/svgs/icon_paketUmrah.svg', 'Katalog'),
            _buildNavItem('assets/svgs/icon_pengguna.svg', 'Profil'),
          ];
        } else {
          pages = const [DashboardJamaah(), PembayaranPage(), PenggunaPage()];

          navItems = [
            _buildNavItem('assets/svgs/icon_dashboard.svg', 'Beranda'),
            _buildNavItem('assets/svgs/icon_pembayaran.svg', 'Riwayat'),
            _buildNavItem('assets/svgs/icon_pengguna.svg', 'Profil'),
          ];
        }

        int safeIndex = currentIndex;
        if (currentIndex >= pages.length) {
          safeIndex = 0;
          Future.microtask(
            () => ref.read(bottomNavIndeProvider.notifier).state = 0,
          );
        }

        return Scaffold(
          body: pages[safeIndex],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2), // shadow ke atas
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: safeIndex,
              onTap: (index) {
                ref.read(bottomNavIndeProvider.notifier).state = index;
              },

              type: BottomNavigationBarType.fixed, // ⬅️ penting!
              backgroundColor: Colors.transparent,
              elevation: 0,

              selectedItemColor: Color(0xFF23762C), // hijau
              unselectedItemColor: Colors.black87,

              selectedLabelStyle: GoogleFonts.notoSansJp(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: GoogleFonts.notoSansJp(fontSize: 11),

              items: navItems,
            ),
          ),
        );
      },
    );
  }

  // Fungsi bantuan agar kode BottomNavigationBarItem tidak terlalu panjang dan berulang
  BottomNavigationBarItem _buildNavItem(String svgPath, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        svgPath,
        colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        svgPath,
        colorFilter: const ColorFilter.mode(Color(0xFF23762C), BlendMode.srcIn),
      ),
      label: label,
    );
  }
}
