// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/dashboard_page.dart';
import 'package:makbul_app/page/main/jamaah_page.dart';
import 'package:makbul_app/page/main/paketumrah_page.dart';
import 'package:makbul_app/page/main/pembayaran_page.dart';
import 'package:makbul_app/page/main/pengguna_page.dart';

final bottomNavIndeProvider = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndeProvider);

    final List<Widget> pages = [
      const DashboardPage(),
      const JamaahPage(),
      const PaketumrahPage(),
      const PembayaranPage(),
      const PenggunaPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
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
          currentIndex: currentIndex,
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
          items: [
            BottomNavigationBarItem(
              // Icon saat tidak dipilih (unselected)
              icon: SvgPicture.asset(
                'assets/svgs/icon_dashboard.svg',
                colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
              ),
              // Icon saat dipilih (selected)
              activeIcon: SvgPicture.asset(
                'assets/svgs/icon_dashboard.svg',
                colorFilter: const ColorFilter.mode(Color(0xFF23762C), BlendMode.srcIn),
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/icon_jamaah.svg',
                colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/svgs/icon_jamaah.svg',
                colorFilter: const ColorFilter.mode(Color(0xFF23762C), BlendMode.srcIn),
              ),
              label: 'Jamaah',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/icon_paketUmrah.svg',
                colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/svgs/icon_paketUmrah.svg',
                colorFilter: const ColorFilter.mode(Color(0xFF23762C), BlendMode.srcIn),
              ),
              label: 'Paket Umrah',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/icon_pembayaran.svg',
                colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/svgs/icon_pembayaran.svg',
                colorFilter: const ColorFilter.mode(Color(0xFF23762C), BlendMode.srcIn),
              ),
              label: 'Pembayaran',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/icon_pengguna.svg',
                colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/svgs/icon_pengguna.svg',
                colorFilter: const ColorFilter.mode(Color(0xFF23762C), BlendMode.srcIn),
              ),
              label: 'Pengguna',
            )
          ],
        ),
      ),
    );
  }
}
