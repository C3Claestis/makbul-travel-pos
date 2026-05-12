import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/detailitinerary.dart';

class ItineraryTab extends StatelessWidget {
  const ItineraryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: dataItinerary.length, // Menghitung total hari di list
      itemBuilder: (context, index) {
        final item = dataItinerary[index];
        // Panggil widget yang sudah kita buat di atas
        return _buildItineraryItem(item);
      },
    );
  }

  Widget _buildItineraryItem(Detailitinerary item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Pastikan sejajar di atas
      children: [
        // --- BAGIAN KIRI (HARI) ---
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xff7FF175),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff104F25),
                ),
                child: Column(
                  children: [
                    Text(
                      "Hari",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      item.hari, // Mengambil hari dari data
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Garis vertikal penghubung (opsional, disesuaikan tingginya)
            Container(width: 1.5, height: 100, color: Colors.grey.shade400),
          ],
        ),
        const SizedBox(width: 12),

        // --- BAGIAN KANAN (SEMUA DETAIL KEGIATAN) ---
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16), // Jarak antar card
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFFEFEFE),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Kegiatan (Misal: Berangkat dari Indonesia)
                Text(
                  item.title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),

                // Waktu / Tanggal
                Row(
                  children: [
                    const Icon(
                      Icons
                          .calendar_today_rounded, // Menggunakan icon kalender lebih cocok
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.waktu,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // List Isi Kegiatan (langsung ditampilkan semua menggunakan Column + Map)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: item.isi.map((kegiatan) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 6,
                      ), // Jarak antar point
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "• $kegiatan",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
