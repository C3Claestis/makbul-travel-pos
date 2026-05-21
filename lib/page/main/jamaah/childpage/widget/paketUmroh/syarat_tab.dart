// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final data = [
  'Paspor masih berlaku minimal 8 bulan dari tanggal keberangkatan.',
  'Foto berwarna terbaru 4x6 denga latar belakang putih (80% wajah).',
  'KTP fotocopy & Kartu Keluarga fotocopy.',
  'Bukti vaksin meningitis (sertifikat internasional).',
  'Pembayaran DP minimal 30% untuk konfirmasi pendaftaran.',
  'Pelunasan maksimal 30 hari sebelum keberangkatan.',
  'Harga dapat berubah sewaktu-waktu mengikuti kebijakan maskapai dan pemerintah Arab Saudi.',
];

class SyaratTab extends StatelessWidget {
  const SyaratTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Syarat & Ketentuan",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => _item(data[index]),
        ),
        const SizedBox(height: 16),
        Text(
          "Pembatalan & Refund",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "> 60 hari sebelum keberangkatan : Refund 90%\n30 - 60 hari sebelum keberangkatan : Refund 50%\n< 30 hari sebelum keberangkatan : Tidak ada refund",
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        _infoTravel(),
        const SizedBox(height: 16),
        _infoAgent(),
      ],
    );
  }

  Container _infoAgent() {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hubungi Agen",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Container(
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset(
                      'assets/images/person/pembimbing-1.png',
                      width: 64,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Aisyah Rahma",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Konsultan Umroh",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff53CE5F),
                    ),
                    child: Image.asset('assets/images/wa.png', width: 16),
                  ),
                  const SizedBox(width: 12),
                  Image.asset('assets/images/phone.png', width: 28),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Container _infoTravel() {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Travel",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Container(
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('assets/images/logo.png', width: 64),
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sahabat Tours & Travel",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Izin PPIU No. 1234 Tahun 2019",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _item(String title) {
    return Row(
      children: [
        Icon(Icons.remove_circle_outline, color: Color(0xff0B7A2F), size: 24),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
