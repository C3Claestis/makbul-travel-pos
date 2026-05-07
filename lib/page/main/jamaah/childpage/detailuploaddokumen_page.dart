// ignore_for_file: deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailuploaddokumenPage extends StatelessWidget {
  const DetailuploaddokumenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Center(
          child: Text(
            "Upload Dokumen",
            style: GoogleFonts.poppins(
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
              const SizedBox(height: 16),
              Text(
                "Dokumen yang perlu diupload",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Pastikan dokumen terlihat jelas dan tidak terpotong.",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 0.01,
                ),
              ),
              const SizedBox(height: 8),
              _infoContainer(),
              const SizedBox(height: 16),
              Text(
                "Preview Dokumen",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _tampilanDokumen(),
              const SizedBox(height: 16),
              Text(
                "Upload Dokumen",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _uploadDokumen(),
              const SizedBox(height: 16),
              _footer(),
              const SizedBox(height: 16),              
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff2A7B36),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Upload Dokumen",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Batal",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2A7B36),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _uploadDokumen() {
    return GestureDetector(
      onTap: () {},
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(16),
        dashPattern: [6, 3], // 🔥 putus-putus
        color: Colors.grey,
        strokeWidth: 1,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xFFFBFBFB),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: Color(0xff2A7B36),
                  size: 72,
                ),
                const SizedBox(height: 4),
                Text(
                  textAlign: TextAlign.center,
                  "Klik untuk pilih file atau seret & lepas\nfile di sini",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Format: JPG, PNG, PDF \u2022 Maks. Ukuran 5MB",
                  style: GoogleFonts.poppins(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFFBFBFB),
                    border: Border.all(color: Colors.grey, width: 0.75),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 🔥 ini juga penting
                      children: [
                        const SizedBox(width: 32),
                        Icon(
                          Icons.folder_open_rounded,
                          color: Color(0xff2A7B36),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Pilih File",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2A7B36),
                          ),
                        ),
                        const SizedBox(width: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DottedBorder _tampilanDokumen() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      dashPattern: [6, 3], // 🔥 putus-putus
      color: Color(0xff2A7B36),
      strokeWidth: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFE8F3E9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(
                Icons.description_outlined,
                color: Color(0xff2A7B36),
                size: 72,
              ),
              const SizedBox(height: 8),
              Text(
                "Belum ada Dokumen",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Dokumen yang kamu upload akan\nmuncul disini",
                style: GoogleFonts.poppins(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _infoContainer() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8F3E9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffC3DCC1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.error_outline, color: Color(0xff2A7B36)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Informasi",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Visa umrah/haji masih berlaku minimal 6 bulan sebelum keberangkatan",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _header() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffFA9A2C),
            ),
            child: Icon(Icons.book, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Visa Umrah,",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Dokumen wajib untuk\nperjalanan umrah/haji",
                  style: GoogleFonts.poppins(
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffFEE8D3).withOpacity(0.7),
                ),
                child: Text(
                  "Belum Upload",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFA9A2C),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _footer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFE8F3E9),
        border: Border.all(color: Color(0xffC3DCC1), width: 2),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Catatan Penting",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff2A7B36),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "\u2022 Pastikan dokumen terbaca dengan jelas\n\u2022 Gunakan format file JPG, PNG, atau PDF\n\u2022 Ukuran maksimal file 5MB",
              style: GoogleFonts.poppins(
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
}
