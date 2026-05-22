// ignore_for_file: deprecated_member_use, unused_element_parameter, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:makbul_app/page/main/jamaah/childpage/detailpaketumroh_page.dart';
import 'package:makbul_app/page/main/jamaah/data/paketumroh.dart';

final selectedDropdown = StateProvider<String?>((ref) => "Popularitas");

class PilihpaketPage extends ConsumerWidget {
  const PilihpaketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 64,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 16),
              _srchPaket(),
              const SizedBox(height: 16),
              _infoPaketdanDropdown(ref),
              const SizedBox(height: 16),
              ...List.generate(
                paketumrohList.length,
                (index) => _itemPaket(
                  context: context,
                  paketumroh: paketumrohList[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _itemPaket({
    required BuildContext context,
    required Paketumroh paketumroh,
  }) {
    final formatCurrency = NumberFormat("#,##0", "id_ID");

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  paketumroh.image[0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff0B7A2F),
                  ),
                  child: Text(
                    paketumroh.duration,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(Icons.favorite_border_outlined, size: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
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
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.flight, color: Color(0xff0B7A2F), size: 16),
                    const SizedBox(width: 4),
                    Text(
                      "Maskapai: ${paketumroh.maskapai}",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.mosque_outlined, color: Colors.black, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      paketumroh.mekkahNights,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.location_city_outlined,
                      color: Colors.black,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      paketumroh.madinahNights,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.flight_takeoff_outlined,
                      color: Colors.black,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      paketumroh.transit,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Rp ${formatCurrency.format(paketumroh.price)}",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0B7A2F),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailpaketumrohPage(
                               paketumroh: paketumroh,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 1.5),
                        ),
                        child: Text(
                          "Lihat Detail",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0B7A2F),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _infoPaketdanDropdown(WidgetRef ref) {
    return Row(
      children: [
        Text(
          "32 Paket tersedia",
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        DropdownButton<String>(
          value: ref.watch(selectedDropdown),

          isExpanded: false, // 🔥 penting biar tidak maksa full width
          isDense: true, // 🔥 hilangkan ruang vertikal berlebih

          underline: const SizedBox(),

          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 20),

          alignment: Alignment.centerRight, // 🔥 bikin value nempel kiri

          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),

          items: ["Popularitas", "Harga Termurah", "Keberangkatan", "Rating"]
              .map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Align(
                    alignment: Alignment
                        .centerLeft, // 🔥 kunci utama biar tidak “ngambang”
                    child: Text(item, overflow: TextOverflow.ellipsis),
                  ),
                );
              })
              .toList(),

          onChanged: (value) {
            ref.read(selectedDropdown.notifier).state = value!;
          },
        ),
      ],
    );
  }

  Row _srchPaket() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Cari paket umroh...",
              hintStyle: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 7,
                spreadRadius: 0.2,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined, color: Color(0xff0B7A2F)),
            label: Text(
              "Filter",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff0B7A2F),
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih Paket Umrah",
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Temukan paket umrah terbaik sesuai kebutuhan Anda",
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const Spacer(),
        Icon(Icons.notifications_none_outlined, color: Colors.black, size: 30),
      ],
    );
  }
}
