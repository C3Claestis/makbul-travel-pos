// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final pembayaranData = [
  {
    "title": "DP (Uang Muka)",
    "value": "Rp 5.000.000",
    "date": "05 Jul 2024",
    "status": "Lunas",
  },
  {
    "title": "Cicilan 1",
    "value": "Rp 10.000.000",
    "date": "05 Agu 2024",
    "status": "Lunas",
  },
  {
    "title": "Cicilan 2",
    "value": "Rp 10.000.000",
    "date": "05 Sep 2024",
    "status": "Menunggu",
  },
  {
    "title": "Pelunasan",
    "value": "Rp 150.000.000",
    "date": "05 Okt 2024",
    "status": "Belum Bayar",
  },
];

class PembayaranPage extends StatelessWidget {
  const PembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Center(
          child: Text(
            "Pembayaran",
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
              _totalTagihan(),
              const SizedBox(height: 16),
              _statusPembayaran(),
              const SizedBox(height: 16),
              Text(
                "Rincian Pembayaran",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _rinciPembayaran(),
              const SizedBox(height: 16),
              Text(
                "Riwayat Pembayaran",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _listRiwayatPembayaran(),
              const SizedBox(height: 24),
              _btnFooter(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _btnFooter() {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1B5E20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 8),
        minimumSize: const Size.fromHeight(50),
      ),
      icon: Icon(Icons.credit_card, color: Colors.white),
      label: Text(
        "Bayar Sekarang",
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Container _listRiwayatPembayaran() {
    return Container(
      padding: EdgeInsets.only(right: 12, left: 12, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFFEFEFE),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _itemRiwayatPembyaran(index);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            height: 16,
            indent: 12,
            endIndent: 12,
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pembayaranData.length,
      ),
    );
  }

  SizedBox _itemRiwayatPembyaran(int index) {
    final data = pembayaranData[index];
    IconData icon;
    Color color;

    final status = data["status"];

    switch (status) {
      case "Lunas":
        icon = Icons.check_circle;
        color = const Color(0xff2A7B36);
        break;

      case "Menunggu":
        icon = Icons.access_time_filled;
        color = const Color(0xffF99C29);
        break;

      default:
        icon = Icons.cancel;
        color = Colors.red;
    }

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data["title"] as String,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      data["value"] as String,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${data["date"] as String} \u2022 Transfer BCA",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff727974),
                      ),
                    ),
                    Text(
                      data["status"] as String,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _rinciPembayaran() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFFEFEFE),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Paket",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Rp 200.000.000",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sudah Dibayar",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Rp 50.000.000",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2A7B36),
                  ),
                ),
              ],
            ),
            Divider(thickness: 0.25, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sisa Pembayaran",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Rp 150.000.000",
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
    );
  }

  Container _totalTagihan() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8F3E9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffC3DCC1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Tagihan",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Rp 200.000.000",
                    style: GoogleFonts.inter(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sisa yang harus dibayar",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff727974),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/pembayaran_img.png',
              width: 128,
              height: 128,
            ),
          ],
        ),
      ),
    );
  }

  Container _statusPembayaran() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFEF1E3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffFA9A2C), width: 1),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Status Pembayaran",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Belum Lunas",
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xffFA9A2C),
                  ),
                  child: Text(
                    "60%",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.6, // 60%
              minHeight: 8,
              borderRadius: BorderRadius.circular(16),
              backgroundColor: Colors.black.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFA9A2C)),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
