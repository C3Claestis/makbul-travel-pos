// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:makbul_app/page/main/jamaah/data/hotelmodel.dart';
import 'package:makbul_app/page/main/jamaah/provider/provider.dart';

class DetailhotelPage extends ConsumerWidget {
  const DetailhotelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedHotel = ref.watch(selectedHotelProvider);
    if (selectedHotel == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SizedBox.expand(
        child: Stack(
          children: [
            // 🔥 CUSTOM APPBAR
            _appBar(context),

            // 🔥 CONTAINER YANG MENIMPA APPBAR
            Positioned(
              top: 110, // ⬅️ ini kunci overlap (atur sesuai selera)
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                        child: SizedBox(
                          height: 320,
                          width: double.infinity,
                          child: Image.network(
                            "https://images.unsplash.com/photo-1690314749019-2754cc7bfac9?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedHotel.hotelname,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    4,
                                    (index) => const Icon(
                                      Icons.star,
                                      color: Color(0xffFDAA0A),
                                      size: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.star_half_outlined,
                                  color: Colors.grey,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  selectedHotel.rating,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFDAA0A),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '(${selectedHotel.reviewer} ulasan)',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            _contentDetail(
                              Icons.location_on_outlined,
                              '${selectedHotel.location} · ${selectedHotel.jarak}',
                              Color(0xFF1B5E20),
                            ),
                            const SizedBox(height: 16),
                            _contentDetail(
                              Icons.wifi,
                              "Wi-Fi Gratis",
                              Colors.grey,
                            ),
                            const SizedBox(height: 8),
                            _contentDetail(
                              Icons.restaurant,
                              "Restoran",
                              Colors.grey,
                            ),
                            const SizedBox(height: 8),
                            _contentDetail(
                              Icons.work_history_outlined,
                              "Resepsionis 24 jam",
                              Colors.grey,
                            ),
                            const SizedBox(height: 8),
                            _contentDetail(Icons.elevator, "Lift", Colors.grey),
                            const SizedBox(height: 8),
                            _contentDetail(
                              Icons.subdirectory_arrow_right_rounded,
                              "Lihat semua fasilitas",
                              Colors.grey,
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.withOpacity(0.5)),
                            const SizedBox(height: 8),
                            Text(
                              "Deskripsi",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              selectedHotel.description,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Divider(color: Colors.grey.withOpacity(0.5)),
                            const SizedBox(height: 16),
                            Text(
                              "Lokasi",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _mapsLokasi(selectedHotel),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mulai dari",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "SAR ${selectedHotel.price}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          " /malam",
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFF1B5E20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Lihat Ketersediaan",
                                      style: GoogleFonts.notoSansJp(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
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

  Container _mapsLokasi(Hotelmodel selectedHotel) {
    return Container(
      height: 200, // bisa kamu atur
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(21.422487, 39.826206),
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.example.makbul_app',
              ),

              // Marker contoh
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(21.4225, 39.8280),
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_on,
                      color: Color(0xff1B5E20),
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              selectedHotel.jarak,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _contentDetail(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
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
                    "Detail Hotel",
                    style: GoogleFonts.poppins(
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
