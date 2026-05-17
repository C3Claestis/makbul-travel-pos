// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [_profilSaya(), const SizedBox(height: 16), _header()],
          ),
        ),
      ),
    );
  }

  Container _header() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/person/pembimbing-1.png',
                      fit: BoxFit.cover,
                      width: 72,
                      height: 72,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Suisei",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff0B7A2F).withOpacity(0.07),
                    ),
                    child: Text(
                      "Jamaah",
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0B7A2F),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "suichan@holo.jp",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "+81 8882 1111",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ],
          ),
          const SizedBox(height: 16),
          Divider(height: 1, thickness: 0.25, color: Colors.grey),
          const SizedBox(height: 16),
          Row(
            children: [
              _itemHeader(
                Icons.date_range_outlined,
                "Bergabung",
                "12 Jan 2024",
              ),
              const SizedBox(width: 8),
              Container(width: 1, height: 32, color: Colors.grey),
              const SizedBox(width: 8),
              _itemHeader(Icons.person, "Status", "Aktif"),
              const SizedBox(width: 8),
              Container(width: 1, height: 32, color: Colors.grey),
              const SizedBox(width: 8),
              _itemHeader(Icons.star_border_outlined, "Poin Makbul", "9.999"),
            ],
          ),
        ],
      ),
    );
  }

  Row _profilSaya() {
    return Row(
      children: [
        Text(
          "Profil Saya",
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xff000000),
          ),
        ),
        const Spacer(),
        Icon(Icons.notifications_none_outlined, color: Colors.black, size: 30),
        const SizedBox(width: 16),
        Icon(Icons.settings_outlined, color: Colors.black, size: 30),
      ],
    );
  }

  Row _itemHeader(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff0B7A2F).withOpacity(0.07),
          ),
          child: Icon(icon, size: 16, color: Color(0xff0B7A2F)),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xffB0B3BA),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
