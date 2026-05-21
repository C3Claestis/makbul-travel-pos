// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PenerbanganTab extends StatelessWidget {
  const PenerbanganTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _item(
          "Keberangkatan",
          "Garuda\nIndonesia",
          "GA-981",
          "Ekonomi",
          "https://img.logo.dev/garuda-indonesia.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
          ["CGK", "JED"],
          ["06:30", "10j 35m", "13:05"],
          ["Jumat, 10 Mei 2024", "Jumat, 11 Mei 2024"],
          ["Soekarno Hatta Intl", "King Abullahaziz Intl"],
        ),
        const SizedBox(height: 16),
        _item(
          "Kepulangan",
          "Batik Air",
          "BA-120",
          "Business",
          "https://img.logo.dev/batikair.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
          ["MED", "CGK"],
          ["14:30", "9j 15m", "04:45"],
          ["Sabtu, 18 Mei 2024", "Minggu, 19 Mei 2024"],
          ["Prince Muhammad\nBin Abdulzaiz", "Soekarno Hatta Intl"],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bagasi",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    spreadRadius: 0.5,
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.luggage_outlined,
                          color: Colors.black,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bagasi Kabin",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "7 kg",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work_outline, color: Colors.black, size: 24),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bagasi Terdaftar",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "30 kg",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Column _item(
    String title,
    String nameMaskapai,
    String kode,
    String kelas,
    String images,
    List<String> kodeIsi,
    List<String> waktu,
    List<String> date,
    List<String> bandara,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0.5,
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        nameMaskapai,
                        style: GoogleFonts.notoSansJp(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            kode,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              images,
                              fit: BoxFit.cover,
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Text(
                          kelas,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      kodeIsi[0],
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      kodeIsi[1],
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      waktu[0],
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          waktu[1],
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.black,
                              size: 12,
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              color: Colors.black,
                              width: 75,
                              height: 1.5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      waktu[2],
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date[0],
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Langsung",
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      date[1],
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bandara[0],
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      bandara[1],
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
