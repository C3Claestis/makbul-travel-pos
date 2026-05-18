// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RingkasanTab extends StatelessWidget {
  const RingkasanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tentang Paket",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        _deskripsiPaket(),
        const SizedBox(height: 16),
        _rowIsi(),
        const SizedBox(height: 16),
        _infoTravel(),
        const SizedBox(height: 16),
        _infoAgent(),
      ],
    );
  }

  Text _deskripsiPaket() {
    return Text(
      "Paket umroh reguler dengan pelayanan terbaik, hotel bintang 5 di Mekkah dan Madinah, makan 3x sehari, ziarah sesuai sunnah, dan pembimbing berpengalaman",
      style: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }

  Row _rowIsi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconrol(Icons.apartment_rounded, "Hotel", "Bintang 5"),
        _iconrol(Icons.restaurant, "Makan", "3x Sehari"),
        _iconrol(Icons.place_outlined, "Ziarah", "Lengkap"),
        _iconrol(Icons.person, "Pembimbing", "Berpengalaman"),
        _iconrol(Icons.library_add_check_outlined, "Asuransi", "Perjalanan"),
      ],
    );
  }

  Container _infoAgent() {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
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
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
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

  Column _iconrol(IconData icon, String text, String value) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff0B7A2F).withOpacity(0.1),
          ),
          child: Icon(icon, color: Color(0xff0B7A2F), size: 24),
        ),
        const SizedBox(height: 8),
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
    );
  }
}
