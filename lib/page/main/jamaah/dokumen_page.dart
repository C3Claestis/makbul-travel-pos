// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/childpage/detailuploaddokumen_page.dart';

final title = ["Paspor", "Visa Umrah", "KTP", "Kartu Vaksin Meningitis"];
final deskripsi = [
  "Paspor masih berlaku\n(min. 6 bulan sebelum keberangkatan)",
  "Dokumen wajib untuk\nperjalanan umrah/haji",
  "Kartu Tanda Penduduk\n(jika diperlukan)",
  "Vaksin meningitis berlaku\n(max. 3 tahun)",
];
final warna = [
  Color(0xff2A7B36),
  Color(0xffFA9A2C),
  Color(0xff2A7B36),
  Color(0xffFA9A2C),
];
final iconImg = [
  Icons.book,
  Icons.card_membership,
  Icons.contact_emergency_outlined,
  Icons.vaccines,
];

class DokumenPage extends StatelessWidget {
  const DokumenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Center(
          child: Text(
            "Dokumen",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.more_vert, color: Colors.white.withOpacity(0)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 28),
              Text(
                "Daftar Dokumen",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _listItems(),
              const SizedBox(height: 16),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }

  Container _footer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffC3DCC1), width: 2),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Catatan Penting",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "\u2022 Pastikan dokumen terbaca dengan jelas\n\u2022 Gunakan format file JPG, PNG, atau PDF\n\u2022 Ukuran maksimal file 5MB",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _listItems() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _items(context, index, title, deskripsi, warna, iconImg);
      },
      itemCount: title.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }

  Container _items(
    BuildContext context,
    int index,
    List<String> title,
    List<String> deskripsi,
    List<Color> warna,
    List<IconData> iconImg,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: warna[index],
              ),
              child: Icon(iconImg[index], color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title[index],
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    deskripsi[index],
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      letterSpacing: 0.01,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffC3DCC1).withOpacity(0.7),
                  ),
                  child: Text(
                    "Sudah Upload",
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2A7B36),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailuploaddokumenPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(color: Color(0xff2A7B36), width: 1.5),
                    ),
                    child: Text(
                      "Lihat",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2A7B36),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _header() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8F3E9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffC3DCC1), width: 1),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/dokumen_img.png', width: 100, height: 100),          
          Expanded(
            child: Text(
              "Pastikan semua dokumen terupload dengan benar untuk kelancaran perjalanan ibadah Anda.",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
