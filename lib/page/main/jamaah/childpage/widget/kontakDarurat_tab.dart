// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List data = [
  {
    "name": "Ust. Ahmad Fauzi",
    "title": "Pembimbing Utama",
    "foto": "assets/images/person/pembimbing-1.png",
    "telp": "+62 812-3456-7890",
  },
  {
    "name": "Ust. Luthfi Hakim",
    "title": "Pembimbing Pendamping",
    "foto": "assets/images/person/pembimbing-2.png",
    "telp": "+62 812-9876-5432",
  },
  {
    "name": "Syaikh Ibrahim",
    "title": "Musthawif (Arab Saudi)",
    "foto": "assets/images/person/syekh.png",
    "telp": "+966 50 123 4567",
  },
  {
    "name": "Rizky Ananda",
    "title": "Tour Leader",
    "foto": "assets/images/person/travel.png",
    "telp": "+62 812-1111-2222",
  },
  {
    "name": "Makbul Travel",
    "title": "Agen / Kantor",
    "foto": "assets/images/person/makbul.png",
    "telp": "+62 21 1234 5678",
  },
];

class KontakdaruratTab extends StatelessWidget {
  const KontakdaruratTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kontak Darurat",
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
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _item(index),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: data.length,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xFFFEFEFE),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/person/location.png",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kedutaan Besar RI-Riyadh",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "+966 50 123 4567",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "24 Jam",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _item(int index) {
    final item = data[index];

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFFEFEFE),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(64),
            child: Image.asset(
              item["foto"],
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item["title"],
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item["name"],
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item["telp"],
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffE5F6EB),
            ),
            child: Icon(
              Icons.phone_callback_outlined,
              color: Color(0xff104F25),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
