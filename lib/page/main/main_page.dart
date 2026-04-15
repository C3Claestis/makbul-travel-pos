// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/dashboard/dashboard_agent.dart';
import 'package:makbul_app/page/main/dashboard/dashboard_jamaah.dart';
import 'package:makbul_app/page/main/dashboard/dashboard_travel.dart';

// Import halaman yang sudah ada
//import 'package:makbul_app/page/main/dashboard_page.dart';
import 'package:makbul_app/page/main/jamaah_page.dart';
import 'package:makbul_app/page/main/paketumrah_page.dart';
import 'package:makbul_app/page/main/pembayaran_page.dart';
import 'package:makbul_app/page/main/pengguna_page.dart';

// Import mock backend service untuk mendapatkan data user
import 'package:makbul_app/service/mock_backend_service.dart';

// Provider untuk Bottom Nav
final bottomNavIndeProvider = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget {
  const MainPage({super.key}); 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndeProvider);

    // --- LOGIKA OTOMATIS MENDAPATKAN ROLE ---
    final firebaseUser = FirebaseAuth.instance.currentUser;
    final userData = ref.watch(mockBackendProvider).allUsers.firstWhere(
          (u) => u.firebaseUid == firebaseUser?.uid,
          orElse: () => DummyUserModel(id: 0, firebaseUid: '', name: '', email: '', role: 'jamaah', authProvider: ''),
        );
    
    final userRole = userData.role;

    // 1. Siapkan List kosong untuk menampung halaman dan ikon navigasi
    List<Widget> pages = [];
    List<BottomNavigationBarItem> navItems = [];

    // 2. Isi List berdasarkan ROLE
    if (userRole == 'travel') {
      // --- MENU UNTUK BIRO TRAVEL (KODE ASLI ANDA) ---
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
      // --- MENU UNTUK AGEN (Contoh: 4 Menu) ---
      pages = const [
        DashboardAgent(), // Nanti bisa diganti DashboardAgentPage
        JamaahPage(),
        PaketumrahPage(),
        PenggunaPage(), // Sebagai halaman profil agen
      ];

      navItems = [
        _buildNavItem('assets/svgs/icon_dashboard.svg', 'Dashboard'),
        _buildNavItem('assets/svgs/icon_jamaah.svg', 'Jamaah Saya'),
        _buildNavItem('assets/svgs/icon_paketUmrah.svg', 'Katalog'),
        _buildNavItem('assets/svgs/icon_pengguna.svg', 'Profil'),
      ];
    } else {
      // --- MENU UNTUK JAMAAH (Contoh: 3 Menu) ---
      pages = const [
        DashboardJamaah(), // Nanti diganti DashboardJamaahPage
        PembayaranPage(), // Sebagai halaman riwayat transaksi
        PenggunaPage(), // Sebagai halaman profil jamaah
      ];

      navItems = [
        _buildNavItem('assets/svgs/icon_dashboard.svg', 'Beranda'),
        _buildNavItem('assets/svgs/icon_pembayaran.svg', 'Riwayat'),
        _buildNavItem('assets/svgs/icon_pengguna.svg', 'Profil'),
      ];
    }

    // 3. Safety Check: Mencegah error jika index melebihi batas halaman
    // (Misal: Pindah akun dari Travel (5 menu) ke Jamaah (3 menu))
    int safeIndex = currentIndex;
    if (currentIndex >= pages.length) {
      safeIndex = 0;
      // Gunakan Future.microtask agar tidak error saat merubah state di dalam build
      Future.microtask(() => ref.read(bottomNavIndeProvider.notifier).state = 0);
    }

    // 4. Return Scaffold utama
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[safeIndex], // Gunakan safeIndex
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: safeIndex, // Gunakan safeIndex
          onTap: (index) {
            ref.read(bottomNavIndeProvider.notifier).state = index;
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: const Color(0xFF23762C),
          unselectedItemColor: Colors.black87,
          selectedLabelStyle: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF23762C),
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          items: navItems, // Masukkan variabel dinamis di sini
        ),
      ),
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