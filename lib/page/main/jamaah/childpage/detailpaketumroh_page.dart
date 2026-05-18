// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/childpage/widget/paketUmroh/ringkasan_tab.dart';

final imageIndexProvider = StateProvider<int>((ref) => 0);

final itemProvider = StateProvider<int>((ref) => 0);
final stateName = StateProvider<String>((ref) => "Ringkasan");

class DetailpaketumrohPage extends ConsumerWidget {
  const DetailpaketumrohPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(imageIndexProvider);

    final List<String> images = [
      "assets/images/kaba.jpg",
      "assets/images/kabah-hd.jpg",
      "assets/images/kabah-img.png",
    ];

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
                    itemCount: images.length,
                    onPageChanged: (index) {
                      ref.read(imageIndexProvider.notifier).state = index;
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(images[index], fit: BoxFit.cover);
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
                        "${currentIndex + 1}/${images.length}",
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
                        _circleIcon(Icons.arrow_back_ios_new_rounded),
                        const Spacer(),
                        _circleIcon(Icons.file_upload_outlined),
                        const SizedBox(width: 8),
                        _circleIcon(Icons.favorite_border_outlined),
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
              top: MediaQuery.of(context).size.height * 0.32, // 🔥 RESPONSIVE
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
                            "Umrah Reguler 9 Hari",
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
                                "Rp 28.000.000",
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
                            "Maskapai: Garuda Indonesia",
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Kode: UMH-09RG",
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
                            "9 Hari",
                          ),
                          _itemRowHeader(
                            Icons.mosque_outlined,
                            "Mekkah",
                            "4 Malam",
                          ),
                          _itemRowHeader(
                            Icons.apartment_outlined,
                            "Madinah",
                            "3 Malam",
                          ),
                          _itemRowHeader(
                            Icons.flight_rounded,
                            "Jeddah",
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
                      buildContent(ref),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(WidgetRef ref) {
    final selected = ref.watch(itemProvider);

    switch (selected) {
      case 0:
        return const RingkasanTab();
      // case 1:
      //   return const Infoperjalanantab();
      // case 2:
      //   return const TiketTab();
      // case 3:
      //   return const HotelTab();
      // case 4:
      //   return const PembimbingTab();
      // case 5:
      //   return const KontakdaruratTab();
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

  Widget _circleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(icon, size: 16),
    );
  }
}
