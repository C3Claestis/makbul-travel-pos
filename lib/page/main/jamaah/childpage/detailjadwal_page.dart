// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/detailPerjalanan/InfoPerjalanan_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/detailPerjalanan/hotel_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/detailPerjalanan/itinerary_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/detailPerjalanan/kontakDarurat_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/detailPerjalanan/pembimbing_tab.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/detailPerjalanan/tiket_tab.dart';

final itemProvider = StateProvider<int>((ref) => 0);
final stateName = StateProvider<String>((ref) => "Itinerary");

class DetailjadwalPage extends ConsumerWidget {
  const DetailjadwalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xffF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Center(
          child: Text(
            "Detail Perjalanan",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.share_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 16),
              _buildDistanceFilter(ref),
              const SizedBox(height: 16),
              buildContent(ref),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: _btnFooter(),
      ),
    );
  }

  Widget buildContent(WidgetRef ref) {
    final selected = ref.watch(itemProvider);

    switch (selected) {
      case 0:
        return const ItineraryTab();
      case 1:
        return const Infoperjalanantab();
      case 2:
        return const TiketTab();
      case 3:
        return const HotelTab();
      case 4:
        return const PembimbingTab();
      case 5:
        return const KontakdaruratTab();
      default:
        return const SizedBox.shrink();
    }
  }

  SingleChildScrollView _buildDistanceFilter(WidgetRef ref) {
    final itemSelected = ref.watch(itemProvider);

    final List<String> categories = [
      "Itinerary",
      "Info Perjalanan",
      "Tiket",
      "Hotel",
      "Pembimbing",
      "Kontak Darurat",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(categories.length, (index) {
          final bool isActive = itemSelected == index;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => {
                ref.read(itemProvider.notifier).state = index,
                ref.read(stateName.notifier).state = categories[index],
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF1B5E20) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isActive
                        ? const Color(0xFF1B5E20)
                        : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  categories[index],
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    color: isActive ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Container _header() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFFEFEFE),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/kaba.jpg',
              fit: BoxFit.cover,
              width: 80,
              height: 120,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Umroh Reguler 9 Hari",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFFF1F6F2),
                  ),
                  child: Text(
                    "Akan Berangkat",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff104F25),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _templateIsiHeader("12 Okt 2026", "Berangkat"),
                    ),
                    Container(width: 1.5, height: 40, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(child: _templateIsiHeader("21 Okt 2026", "Pulang")),
                    Container(width: 1.5, height: 40, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(child: _templateIsiHeader("9 Hari", "Durasi")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _templateIsiHeader(String title, String keterangan) {
    return Row(
      children: [
        const Icon(Icons.date_range_rounded, color: Colors.black, size: 16),
        const SizedBox(width: 4),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                keterangan,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ElevatedButton _btnFooter() {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1B5E20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size.fromHeight(50),
      ),
      icon: SvgPicture.asset('assets/svgs/icon_wa.svg', color: Colors.white),
      label: Text(
        "Lihat Boarding Pass",
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
