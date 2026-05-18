import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List data = [
  {    
    "name": "Ust. Ahmad Fauzi",
    "title": "Pembimbing Utama",
    "foto": "assets/images/person/pembimbing-1.png",        
    "telp": "+62 812-3456-7890",
    "email": "ahmad.fauzi@makbul.id",    
  },
  {
    "name": "Ust. Luthfi Hakim",
    "title": "Pembimbing Pendamping",
    "foto": "assets/images/person/pembimbing-2.png",        
    "telp": "+62 812-9876-5432",
    "email": "luthfi.hakim@makbul.id",    
  },
];

class PembimbingTab extends StatelessWidget {
  const PembimbingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pembimbing Perjalanan",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        _item(0),
        const SizedBox(height: 16),
        _item(1),
      ],
    );
  }

  Container _item(int index) {
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
              data[index]["foto"],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data[index]["name"],
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                data[index]["title"],
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1F744A),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.phone_outlined, color: Colors.black, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    data[index]["telp"],
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.mail_outline_rounded,
                    color: Colors.black,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    data[index]["email"],
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
