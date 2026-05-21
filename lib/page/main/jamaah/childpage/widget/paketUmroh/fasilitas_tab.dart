import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final data = [
  'Tiket pesawat PP kelas Ekonomi',
  'Akomodasi hotel bintang 4/5',
  'Makan 3x sehari (Menu Indonesia)',
  'Transportasi AC selama di Arab Saudi',
  'Air zam-zam 5 liter (jika diizinkan maskapai)',
  'Muthawwif berpengalaman berbahasa Indonesia',
  'Ziarah sesuai program',
  'Perlengkapan umrah (koper, tas kabin, kain ihram, buku doa, id card, lanyard)',
  'Asuransi perjalanan',
  'Visa umrah',
  'Handling bandara & airport tax',
  'Manasik umrah sebelum keberangkatan',
];

class FasilitasTab extends StatelessWidget {
  const FasilitasTab({super.key});

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
          itemCount: data.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => _item(data[index]),
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
