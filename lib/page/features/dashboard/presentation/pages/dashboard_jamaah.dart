// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/auth/pages/login_page.dart';
import 'package:makbul_app/page/main/jamaah/jadwal_page.dart';

import '../../../..//main/jamaah/dokumen_page.dart';
import '../../../../main/jamaah/lokasihotel_page.dart';
import '../../../../main/jamaah/paketsaya_page.dart';
import '../../../..//main/jamaah/pembayaran_page.dart';
import '../../../../main/jamaah/jenispenerbangan_page.dart';
import '../../../../main/jamaah/pilihpaket_page.dart';

class DashboardJamaah extends ConsumerWidget {
  const DashboardJamaah({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    final firebaseUser = FirebaseAuth.instance.currentUser;

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser?.uid)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final data = snapshot.data!.data() as Map<String, dynamic>?;
        final name = data?['name'] ?? 'User';

        return Scaffold(
          backgroundColor: const Color(0xffF5F5F5),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // ================= HEADER =================
                _header(context, name),

                // ================= CONTENT =================
                _content(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // ================= RINGKASAN =================
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.12),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ringkasan Perjalanan",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Lihat Detail",
                            style: GoogleFonts.inter(color: Colors.black87),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black87,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: _summaryCard(
                        icon: Icons.calendar_month,
                        iconColor: Colors.blue,
                        title: "Jadwal Berangkat",
                        value: "20 Nov 2024",
                        subtitle: "09:00 WIB",
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: _summaryCard(
                        icon: Icons.check_circle,
                        iconColor: Colors.orange,
                        title: "Status Pembayaran",
                        value: "Belum Lunas",
                        subtitle: "60%",
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: _summaryCard(
                        icon: Icons.description,
                        iconColor: const Color(0xff0B7A2F),
                        title: "Dokumen",
                        value: "2 / 4",
                        subtitle: "Lengkap",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ================= PILIH PAKET UMROH =================
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PilihpaketPage(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Color(0xff0B7A2F),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/img-kabah.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PILIH PAKET UMROH",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Temukan paket terbaik untuk Anda",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff0B7A2F),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ================= MENU =================
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Menu Utama",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 16),

          GridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1,
            children: [
              _menuCard(context, title: "Paket Saya", icon: Icons.home),

              _menuCard(context, title: "Pembayaran", icon: Icons.credit_card),

              _menuCard(context, title: "Jadwal", icon: Icons.calendar_month),

              _menuCard(context, title: "Dokumen", icon: Icons.description),

              _menuCard(
                context,
                title: "Jenis Penerbangan",
                icon: Icons.flight,
              ),

              _menuCard(
                context,
                title: "Lokasi/Hotel",
                icon: Icons.location_on,
              ),
            ],
          ),

          const SizedBox(height: 28),

          // ================= PENGUMUMAN =================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xffEAF4EA),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.campaign, color: Colors.green.shade700, size: 30),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pengumuman Terbaru",
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "Lihat Semua",
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Manasik Umrah akan dilaksanakan pada 10 Nov 2024 via Zoom Meeting.",
                        style: GoogleFonts.inter(fontSize: 14, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Container _header(BuildContext context, name) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      clipBehavior: Clip.none,
      decoration: const BoxDecoration(
        color: Color(0xff0B7A2F),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // top bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dashboard Jamaah",
                  style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    debugPrint("ICON DITEKAN");

                    await FirebaseAuth.instance.signOut();

                    if (!context.mounted) return;

                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                      (route) => false,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.logout, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assalamu'alaikum,",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Jamaah $name",
                        style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        "Semoga perjalanan ibadah Anda menjadi umrah yang mabrur.",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          height: 1.5,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                // image
                Transform.translate(
                  offset: const Offset(20, 0),
                  child: Container(
                    width: 170,
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(0),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            "assets/images/kaba.jpg",
                            fit: BoxFit.cover,
                          ),

                          // overlay gradient biar lebih elegan
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.15),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= MENU CARD =================
  Widget _menuCard(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              switch (title) {
                case 'Paket Saya':
                  return const PaketsayaPage();

                case 'Jenis Penerbangan':
                  return const JenispenerbanganPage();

                case 'Dokumen':
                  return const DokumenPage();

                case 'Pembayaran':
                  return const PembayaranPage();

                case 'Lokasi/Hotel':
                  return const LokasihotelPage();

                case 'Jadwal':
                  return const JadwalPage();

                default:
                  return const DashboardJamaah();
              }
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [Color(0xff0E8B36), Color(0xff066A25)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 36),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= SUMMARY CARD =================
  Widget _summaryCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 30),

          const SizedBox(height: 12),

          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
          ),

          const SizedBox(height: 8),

          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 12, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
