// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/paketUmroh/fasilitas_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/paketUmroh/hotel_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/paketUmroh/jadwal_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/paketUmroh/penerbangan_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/paketUmroh/ringkasan_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/paketUmroh/syarat_tab.dart';
import 'package:makbul_app/page/main/jamaah/data/paketumroh.dart';

final imageIndexProvider = StateProvider<int>((ref) => 0);

final itemProvider = StateProvider<int>((ref) => 0);
final stateName = StateProvider<String>((ref) => "Ringkasan");

String formatMalam(String text) {
  final match = RegExp(r'(\d+)N').firstMatch(text);

  if (match != null) {
    return '${match.group(1)} Malam';
  }

  return text;
}

class DetailpaketumrohPage extends ConsumerWidget {
  final Paketumroh paketumroh;

  const DetailpaketumrohPage({super.key, required this.paketumroh});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    final currentIndex = ref.watch(imageIndexProvider);
    final formatCurrency = NumberFormat("#,##0", "id_ID");

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      extendBodyBehindAppBar: true,

      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            /// =========================
            /// IMAGE SLIDER (HEADER)
            /// =========================
            SizedBox(
              height: 320,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: paketumroh.image.length,
                    onPageChanged: (index) {
                      ref.read(imageIndexProvider.notifier).state = index;
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        paketumroh.image[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),

                  /// GRADIENT STATUS BAR
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).padding.top + 28,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// INDICATOR
                  Positioned(
                    right: 16,
                    bottom: 42,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${currentIndex + 1}/${paketumroh.image.length}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  /// BUTTON ROW ATAS
                  Positioned(
                    top: 48,
                    left: 16,
                    right: 16,
                    child: Row(
                      children: [
                        _circleIcon(Icons.arrow_back_ios_new_rounded, context),
                        const Spacer(),
                        _circleIcon(Icons.file_upload_outlined, context),
                        const SizedBox(width: 8),
                        _circleIcon(Icons.favorite_border_outlined, context),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// =========================
            /// CONTENT OVERLAY (FIX)
            /// =========================
            Positioned(
              top: MediaQuery.of(context).size.height * 0.36, // 🔥 RESPONSIVE
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),

                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            paketumroh.title,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Rp ${formatCurrency.format(paketumroh.price)}",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff0B7A2F),
                                ),
                              ),
                              Text(
                                "/ jamaah",
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/icon_pesawat_biru.svg',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Maskapai: ${paketumroh.maskapai}",
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Kode: ${paketumroh.detailpaketumroh.codepaket}",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                        thickness: 1,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _itemRowHeader(
                            Icons.timer_outlined,
                            "Durasi",
                            paketumroh.duration,
                          ),
                          _itemRowHeader(
                            Icons.mosque_outlined,
                            "Mekkah",
                            formatMalam(paketumroh.mekkahNights),
                          ),
                          _itemRowHeader(
                            Icons.apartment_outlined,
                            "Madinah",
                            formatMalam(paketumroh.madinahNights),
                          ),
                          _itemRowHeader(
                            Icons.flight_rounded,
                            paketumroh.transit,
                            "Transit/PP",
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                        thickness: 1,
                      ),
                      const SizedBox(height: 8),
                      _buildDistanceFilter(ref),
                      const SizedBox(height: 16),
                      buildContent(ref, paketumroh),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              spreadRadius: 1,
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rp ${formatCurrency.format(paketumroh.price)}",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff0B7A2F),
                      ),
                    ),
                    Text(
                      "/ jamaah",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: SizedBox(
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF6D28D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Pilih Paket Ini",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent(WidgetRef ref, Paketumroh paketumroh) {
    final selected = ref.watch(itemProvider);

    switch (selected) {
      case 0:
        return RingkasanTab(paketumroh: paketumroh);
      case 1:
        return JadwalTab(paketumroh: paketumroh);
      case 2:
        return HotelTab(paketumroh: paketumroh);
      case 3:
        return PenerbanganTab(paketumroh: paketumroh);
      case 4:
        return FasilitasTab(paketumroh: paketumroh);
      case 5:
        return SyaratTab(paketumroh: paketumroh);
      default:
        return const SizedBox.shrink();
    }
  }

  SingleChildScrollView _buildDistanceFilter(WidgetRef ref) {
    final itemSelected = ref.watch(itemProvider);

    final List<String> categories = [
      "Ringkasan",
      "Jadwal",
      "Hotel",
      "Penerbangan",
      "Fasilitas",
      "Syarat",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(categories.length, (index) {
          final bool isActive = itemSelected == index;

          return GestureDetector(
            onTap: () {
              ref.read(itemProvider.notifier).state = index;
              ref.read(stateName.notifier).state = categories[index];
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// TEXT TAB
                  Text(
                    categories[index],
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                      color: isActive
                          ? const Color(0xff0B7A2F) // ungu active
                          : Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// UNDERLINE INDICATOR
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 3,
                    width: isActive ? 30 : 0,
                    decoration: BoxDecoration(
                      color: const Color(0xff0B7A2F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Row _itemRowHeader(IconData icon, String text, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 24),
        const SizedBox(width: 4),
        Column(
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _circleIcon(IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
