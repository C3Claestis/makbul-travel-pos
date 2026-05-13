// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Infoperjalanantab extends StatelessWidget {
  const Infoperjalanantab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informasi Perjalanan",
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
          itemCount: dataInfoPerjalanan.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = dataInfoPerjalanan[index];
            return _buildinfoPerjalananItem(item);
          },
        ),
      ],
    );
  }

  Container _buildinfoPerjalananItem(InfoPerjalananTab item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffE5F6EB),
            ),
            child: Icon(item.icon, color: Color(0xff104F25), size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.subtitle,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoPerjalananTab {
  IconData icon;
  String title;
  String subtitle;

  InfoPerjalananTab({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

final List<InfoPerjalananTab> dataInfoPerjalanan = [
  InfoPerjalananTab(
    icon: Icons.description_outlined,
    title: "Dokumen",
    subtitle: "Paspor (min. 6 bulan berlaku)\nVisa Umroh",
  ),
  InfoPerjalananTab(
    icon: Icons.business_center_outlined,
    title: "Bagasi",
    subtitle: "Bagasi Kabin 7 Kg\nBagasi Checked 23 Kg",
  ),
  InfoPerjalananTab(
    icon: Icons.attach_money_rounded,
    title: "Mata Uang",
    subtitle: "Saudi Riyal (SAR)\nDisarankan membawa uang tunai secukupnya",
  ),
  InfoPerjalananTab(
    icon: Icons.electric_bolt_rounded,
    title: "Listrik",
    subtitle: "Tipe colokan: Tipe G\nTegangan: 220V",
  ),
  InfoPerjalananTab(
    icon: Icons.cloudy_snowing,
    title: "Cuaca",
    subtitle: "Rata-rata 28°C - 38\u00B0C\nSuhu dapat berubah",
  ),
  InfoPerjalananTab(
    icon: Icons.tips_and_updates_outlined,
    title: "Tips Perjalanan",
    subtitle:
        "Gunakan pakaian sesuai ketentuan\nJaga kesehatan dan perbanyak minum air",
  ),
  InfoPerjalananTab(
    icon: Icons.timelapse_outlined,
    title: "Waktu Sholat",
    subtitle: "Sesuaikan dengan jadwal lokal di Arab Saudi",
  ),
];
