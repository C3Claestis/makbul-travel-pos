// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Map<String, dynamic> data = {
  "Data": [
    {
      "id": 1,
      "icon": Icons.person_2_outlined,
      "nama": "Data Pribadi",
      "value": "Lihat dan kelola data diri Anda",
      "logout": false,
    },
    {
      "id": 2,
      "icon": Icons.badge_outlined,
      "nama": "Verifikasi Identitas",
      "value": "Status verifikasi & dokumen",
      "logout": false,
    },
    {
      "id": 3,
      "icon": Icons.location_on_outlined,
      "nama": "Alamat",
      "value": "Kelola alamat domisili Anda",
      "logout": false,
    },
    {
      "id": 4,
      "icon": Icons.favorite_border_outlined,
      "nama": "Preferensi",
      "value": "Pengaturan preferensi Anda",
      "logout": false,
    },
    {
      "id": 5,
      "icon": Icons.lock_outline_rounded,
      "nama": "Keamanan",
      "value": "Ubah password & keamanan akun",
      "logout": false,
    },
    {
      "id": 6,
      "icon": Icons.help_outline_outlined,
      "nama": "Bantuan",
      "value": "Pusat bantuan & FAQ",
      "logout": false,
    },
    {
      "id": 7,
      "icon": Icons.login_outlined,
      "nama": "Keluar",
      "value": "Keluar dari akun Makbul",
      "logout": true,
    },
  ],
};

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
            children: [
              _profilSaya(),
              const SizedBox(height: 16),
              _header(),
              const SizedBox(height: 16),
              _isi(),
            ],
          ),
        ),
      ),
    );
  }

  Container _isi() {
    return Container(
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
          ...List.generate(data["Data"].length, (index) {
            final item = data["Data"][index];
            return _itemIsi(
              item["icon"],
              item["nama"],
              item["value"],
              item["logout"],
            );
          }),
        ],
      ),
    );
  }

  Widget _itemIsi(IconData icon, String nama, String value, bool? logout) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: (logout == false)
                      ? Color(0xff0B7A2F).withOpacity(0.07)
                      : Colors.red.withOpacity(0.07),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: (logout == false) ? Color(0xff0B7A2F) : Colors.red,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB0B3BA),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ],
          ),
        ),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: (logout == false) ? 1 : 0,
            width: 340,
            color: Colors.grey,
          ),
        ),
      ],
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
              Expanded(
                child: _itemHeader(
                  Icons.date_range_outlined,
                  "Bergabung",
                  "12 Jan 2024",
                ),
              ),

              const SizedBox(width: 8),

              Container(width: 1, height: 32, color: Colors.grey.shade300),

              const SizedBox(width: 8),

              Expanded(child: _itemHeader(Icons.person, "Status", "Aktif")),

              const SizedBox(width: 8),

              Container(width: 1, height: 32, color: Colors.grey.shade300),

              const SizedBox(width: 8),

              Expanded(
                child: _itemHeader(
                  Icons.star_border_outlined,
                  "Poin Makbul",
                  "9.999",
                ),
              ),
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

  Widget _itemHeader(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff0B7A2F).withOpacity(0.07),
          ),
          child: Icon(icon, size: 16, color: const Color(0xff0B7A2F)),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffB0B3BA),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
