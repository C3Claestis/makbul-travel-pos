import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Map<String, dynamic>> schedules = [
  {
    "day": "Hari 1",
    "date": "Jumat, 10 Mei 2024",
    "activities": [
      "Berkumpul di Bandara Soekarno Hatta",
      "Check-in & persiapan keberangkatan",
      "Penerbangan menuju Jeddah",
    ],
  },
  {
    "day": "Hari 2",
    "date": "Sabtu, 11 Mei 2024",
    "activities": [
      "Tiba di Jeddah",
      "Proses imigrasi & pengambilan bagasi",
      "City tour Jeddah",
      "Menuju Mekkah & check-in hotel",
      "Umrah pertama",
    ],
  },
  {
    "day": "Hari 3 - 5",
    "date": "Minggu - Selasa, 12 - 14 Mei 2024",
    "activities": [
      "Ibadah di Masjidil Haram",
      "Program bebas dengan bimbingan muthawwif",
    ],
  },
  {
    "day": "Hari 6",
    "date": "Rabu, 15 Mei 2024",
    "activities": [
      "Check-out hotel Mekkah",
      "Perjalanan menuju Madinah",
      "Check-in hotel Madinah",
      "Ziarah Kota Madinah",
    ],
  },
  {
    "day": "Hari 7 - 8",
    "date": "Kamis - Jumat, 16 - 17 Mei 2024",
    "activities": [
      "Ibadah di Masjid Nabawi",
      "Ziarah sekitar Madinah",
      "Program bebas",
    ],
  },
  {
    "day": "Hari 9",
    "date": "Sabtu, 18 Mei 2024",
    "activities": [
      "Check-out hotel Madinah",
      "Menuju Bandara Madinah",
      "Penerbangan kembali ke Indonesia",
    ],
  },
];

class JadwalTab extends StatelessWidget {
  const JadwalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rencana Perjalanan",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 24),

        ...List.generate(schedules.length, (index) {
          final item = schedules[index];
          final isLast = index == schedules.length - 1;

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TIMELINE
                Column(
                  children: [
                    /// BULATAN
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),

                    /// GARIS
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: Colors.grey.shade300,
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 16),

                /// CONTENT
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["day"],
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          item["date"],
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 12),

                        ...List.generate(
                          item["activities"].length,
                          (i) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "• ",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                  ),
                                ),

                                Expanded(
                                  child: Text(
                                    item["activities"][i],
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
