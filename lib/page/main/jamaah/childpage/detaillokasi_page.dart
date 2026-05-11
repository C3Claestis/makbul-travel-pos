// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/childpage/detailhoteldisekitarlokasi_page.dart';
import 'package:makbul_app/page/main/jamaah/data/hotelmodel.dart';
import 'package:makbul_app/page/main/jamaah/data/lokasimodel.dart';
import 'package:makbul_app/page/main/jamaah/provider/provider.dart';

class DetaillokasiPage extends ConsumerWidget {
  const DetaillokasiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLokasi = ref.watch(selectedLokasiProvider);
    if (selectedLokasi == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // 🔥 CUSTOM APPBAR
            _appBar(context),

            _content(selectedLokasi, context, ref),
          ],
        ),
      ),
    );
  }

  Positioned _content(
    Lokasimodel selectedLokasi,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Positioned(
      top: 110, // ⬅️ ini kunci overlap (atur sesuai selera)
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imgContent(selectedLokasi),
              _isiContent(selectedLokasi, context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Padding _isiContent(
    Lokasimodel selectedLokasi,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // 🔥 Meratakan semua anak ke kiri
        children: [
          Text(
            selectedLokasi.name,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${selectedLokasi.lokasi} · ${selectedLokasi.tempat}',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            selectedLokasi.deskripsi,
            textAlign: TextAlign.start,

            softWrap: true,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          _itemCard(selectedLokasi),
          const SizedBox(height: 16),
          Text(
            "Hotel Terdekat",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _itemHotelTerdekat(selectedLokasi),
          const SizedBox(height: 16),
          _btnFooter(
            context,
            ref,
            selectedLokasi.linkImg,
            selectedLokasi.name,
            selectedLokasi.lokasi,
          ),
        ],
      ),
    );
  }

  ClipRRect _imgContent(Lokasimodel selectedLokasi) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      child: SizedBox(
        height: 320,
        width: double.infinity,
        child: Image.network(selectedLokasi.linkImg, fit: BoxFit.cover),
      ),
    );
  }

  TextButton _btnFooter(
    BuildContext context,
    WidgetRef ref,
    String linkImg,
    String name,
    String lokasi,
  ) {
    final route = MaterialPageRoute(
      builder: (context) => const DetailhoteldisekitarlokasiPage(),
    );

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color(0xFF1B5E20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () => {
        ref.read(selectedLokasiProvider.notifier).state = Lokasimodel(
          linkImg: linkImg,
          name: name,
          lokasi: lokasi,
          tempat: "",
          deskripsi: "",
          jarak: "",
          waktutempuh: "",
          area: "",
          koordinat: "",
        ),

        Navigator.push(context, route),
      },
      child: Text(
        "Lihat Hotel di Sekitar",
        style: GoogleFonts.notoSansJp(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  GridView _itemCard(Lokasimodel selectedLokasi) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero, // 🔥 ini penting
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2.25,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _card(selectedLokasi, index);
      },
    );
  }

  ListView _itemHotelTerdekat(Lokasimodel selectedLokasi) {
    final filteredHotel = dataHotel
        .where((e) => e.location == selectedLokasi.lokasi)
        .toList();

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filteredHotel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(height: 24),
      itemBuilder: (context, index) {
        final item = filteredHotel[index];

        return Row(
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.linkImg,
                width: 70,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            // TITLE
            Expanded(
              child: Text(
                item.hotelname,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(width: 8),

            // DISTANCE
            Text(
              item.jarak.split(' dari')[0],
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }

  Container _card(Lokasimodel selectedLokasi, int index) {
    final title = [
      "Jarak dari Hotel Terdekat",
      "Estimasi Waktu Jalan Kaki",
      "Area",
      "Koordinat",
    ];
    final value = [
      selectedLokasi.jarak,
      selectedLokasi.waktutempuh, // kalau ada
      selectedLokasi.area, // kalau ada
      selectedLokasi.koordinat, // kalau ada
    ];
    final logos = [
      Icons.location_on_outlined,
      Icons.directions_walk,
      Icons.pin_invoke_rounded,
      Icons.ssid_chart_rounded,
    ];
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xffF4F7F4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(logos[index], color: Color(0xff1B5E20), size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title[index],
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value[index],
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _appBar(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
      decoration: const BoxDecoration(color: Color(0xFF1B5E20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Detail Lokasi",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 48), // biar title tetap center
            ],
          ),
        ],
      ),
    );
  }
}
