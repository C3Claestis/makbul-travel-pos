import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/data/paketumroh.dart';

class FasilitasTab extends StatelessWidget {
  final Paketumroh paketumroh;

  const FasilitasTab({super.key, required this.paketumroh});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fasilitas yang Didapatkan",
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
          itemCount: paketumroh.detailpaketumroh.fasilitas.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => _item(paketumroh.detailpaketumroh.fasilitas[index]),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _item(String title) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline_outlined,
          color: Color(0xff0B7A2F),
          size: 24,
        ),
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
