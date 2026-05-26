// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/data/paketumroh.dart';

class PenerbanganTab extends StatelessWidget {
  final Paketumroh paketumroh;

  const PenerbanganTab({super.key, required this.paketumroh});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _item("Keberangkatan", true),
        const SizedBox(height: 16),
        _item("Kepulangan", false),
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
                              "${paketumroh.detailpaketumroh.penerbangan[0].bagasiKabin} kg",
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
                              "${paketumroh.detailpaketumroh.penerbangan[0].bagasiTerdaftar} kg",
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

  Column _item(String title, bool kondisi) {
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
                        //nameMaskapai,
                        (kondisi
                                ? paketumroh
                                      .detailpaketumroh
                                      .penerbangan[0]
                                      .berangkat
                                : paketumroh
                                      .detailpaketumroh
                                      .penerbangan[0]
                                      .pulang)
                            .maskapai,
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
                            //kode,
                            (kondisi
                                    ? paketumroh
                                          .detailpaketumroh
                                          .penerbangan[0]
                                          .berangkat
                                    : paketumroh
                                          .detailpaketumroh
                                          .penerbangan[0]
                                          .pulang)
                                .kode,
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
                              //images,
                              (kondisi
                                      ? paketumroh
                                            .detailpaketumroh
                                            .penerbangan[0]
                                            .berangkat
                                      : paketumroh
                                            .detailpaketumroh
                                            .penerbangan[0]
                                            .pulang)
                                  .logo,
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
                          //kelas,
                          (kondisi
                                  ? paketumroh
                                        .detailpaketumroh
                                        .penerbangan[0]
                                        .berangkat
                                  : paketumroh
                                        .detailpaketumroh
                                        .penerbangan[0]
                                        .pulang)
                              .kelas,
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
                      //kodeIsi[0],
                      (kondisi
                              ? paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .berangkat
                              : paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .pulang)
                          .kodeAwal,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      //kodeIsi[1],
                      (kondisi
                              ? paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .berangkat
                              : paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .pulang)
                          .kodeAkhir,
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
                      //waktu[0],
                      (kondisi
                              ? paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .berangkat
                              : paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .pulang)
                          .waktuAwal,
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
                          //waktu[1],
                          (kondisi
                                  ? paketumroh
                                        .detailpaketumroh
                                        .penerbangan[0]
                                        .berangkat
                                  : paketumroh
                                        .detailpaketumroh
                                        .penerbangan[0]
                                        .pulang)
                              .totalWaktu,
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
                      //waktu[2],
                      (kondisi
                              ? paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .berangkat
                              : paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .pulang)
                          .waktuAkhir,
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
                      //date[0],
                      (kondisi
                              ? paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .berangkat
                              : paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .pulang)
                          .tanggalAwal,
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
                      //date[1],
                      (kondisi
                              ? paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .berangkat
                              : paketumroh
                                    .detailpaketumroh
                                    .penerbangan[0]
                                    .pulang)
                          .tanggalAkhir,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        (kondisi
                                ? paketumroh
                                      .detailpaketumroh
                                      .penerbangan[0]
                                      .berangkat
                                : paketumroh
                                      .detailpaketumroh
                                      .penerbangan[0]
                                      .pulang)
                            .bandaraAwal,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Text(
                        (kondisi
                                ? paketumroh
                                      .detailpaketumroh
                                      .penerbangan[0]
                                      .berangkat
                                : paketumroh
                                      .detailpaketumroh
                                      .penerbangan[0]
                                      .pulang)
                            .bandaraAkhir,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
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
