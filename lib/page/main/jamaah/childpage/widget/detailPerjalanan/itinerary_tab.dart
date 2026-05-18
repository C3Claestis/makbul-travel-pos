import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/detailitinerary.dart';

class ItineraryTab extends StatelessWidget {
  const ItineraryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Itinerary",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: dataItinerary.length, // Menghitung total hari di list
          itemBuilder: (context, index) {
            final item = dataItinerary[index];
            // Panggil widget yang sudah kita buat di atas
            return _buildItineraryItem(item);
          },
        ),
        Container(
          padding: EdgeInsets.all(12),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.date_range_outlined,
                color: Color(0xff104F25),
                size: 24,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informasi Manasik",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Manasik Terakhir",
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            "5 Oktober 2026",
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Waktu",
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            "09:00 WIB",
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Color(0xff104F25), width: 2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.zero,
                          minimumSize: Size(130, 30),
                        ),
                        child: Text(
                          "Lihat Detail Manasik",
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Lokasi",
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "Graham Zamzam",
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Jl Raya Condet No. 10",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),      
      ],
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
