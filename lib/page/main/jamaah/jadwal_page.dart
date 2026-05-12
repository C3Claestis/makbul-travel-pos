// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/childpage/detailjadwal_page.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Center(
          child: Text(
            "Jadwal Perjalanan",
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
            icon: Icon(Icons.notifications_none, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 16),
              _infoBerangkat(),
              const SizedBox(height: 16),
              _infoKeberangkatan(),
              const SizedBox(height: 16),
              _pengumumanPenting(),
              const SizedBox(height: 16),
              _tahapanPerjalanan(),
              const SizedBox(height: 16),
              _menuCepat(context,),
              const SizedBox(height: 16),
              _butuhBantuanfooter(),
            ],
          ),
        ),
      ),
    );
  }

  Container _butuhBantuanfooter() {
    return Container(
      padding: EdgeInsets.all(12),
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
      child: Row(
        children: [
          Icon(Icons.headset_mic_outlined, color: Color(0xff104F25)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Butuh Bantuan",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Hubungi kami untuk informasi lebih lanjut",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF1B5E20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(12),
              minimumSize: Size(0, 0),
            ),
            child: Text(
              "Hubungi CS",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _menuCepat(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Menu Cepat",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          GridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _itemMenuCepat(
                context,
                "Lihat Tiket",
                Icons.confirmation_num_outlined,
              ),
              _itemMenuCepat(context, "Itinerary", Icons.paste_outlined),
              _itemMenuCepat(context, "Hotel", Icons.apartment_outlined),
              _itemMenuCepat(context, "Pembimbing", Icons.person_2_outlined),
              _itemMenuCepat(
                context,
                "Kontak Darurat",
                Icons.support_agent_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemMenuCepat(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailjadwalPage()),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffD9E5DB).withOpacity(0.5),
            ),
            child: Icon(icon, color: Color(0xff104F25), size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              letterSpacing: -0.5,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Container _tahapanPerjalanan() {
    return Container(
      padding: EdgeInsets.all(12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tahapan Perjalanan",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemTahapanJalan("Pendaftaran", Icons.person_add, true),
              Container(
                margin: const EdgeInsets.only(top: 22),
                width: 20,
                height: 1.5,
                color: Colors.grey,
              ),
              _itemTahapanJalan("Pembayaran", Icons.wallet, true),
              Container(
                margin: const EdgeInsets.only(top: 22),
                width: 20,
                height: 1.5,
                color: Colors.grey,
              ),
              _itemTahapanJalan("Dokumen", Icons.description, true),
              Container(
                margin: const EdgeInsets.only(top: 22),
                width: 20,
                height: 1.5,
                color: Colors.grey,
              ),
              _itemTahapanJalan("Manasik", Icons.mosque, true),
              Container(
                margin: const EdgeInsets.only(top: 22),
                width: 20,
                height: 1.5,
                color: Colors.grey,
              ),
              _itemTahapanJalan("Berangkat", Icons.flight, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemTahapanJalan(String title, IconData icon, bool isDone) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffD9E5DB),
            ),
            child: Icon(
              (isDone) ? Icons.check_circle : icon,
              color: Color(0xff104F25),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container _pengumumanPenting() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF4F8F6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffD5E7D7),
                ),
                child: Icon(
                  Icons.campaign_outlined,
                  color: Color(0xff104F25),
                  size: 24,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pengumuman Penting",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Manasik Umrah akan dilaksanakan pada 10 Nov 2024 via Zoom Meeting. Mohon kehadirannya",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Colors.black),
        ],
      ),
    );
  }

  Container _infoKeberangkatan() {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Keberangkatan",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: Colors.grey, thickness: 0.5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _itemInfo(Icons.flight, "Maskapai", "Garuda Indonesia"),

              Container(width: 1.5, height: 90, color: Colors.grey),
              const SizedBox(width: 8),
              _itemInfo(
                Icons.airplane_ticket_outlined,
                "No. Penerbangan",
                "GA 981",
              ),
              const SizedBox(width: 8),
              Container(width: 1.5, height: 90, color: Colors.grey),
              const SizedBox(width: 8),
              _itemInfo(Icons.flight, "Kota Berangkat", "Jakarta (CGK)"),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _itemInfo(Icons.apartment, "Terminal", "3 Ultimate"),
              Container(width: 1.5, height: 90, color: Colors.grey),
              const SizedBox(width: 8),
              _itemInfo(
                Icons.access_time_filled_rounded,
                "Waktu Berangkat",
                "12 Okt 2026\n08:15 WIB",
              ),
              const SizedBox(width: 8),
              Container(width: 1.5, height: 90, color: Colors.grey),
              const SizedBox(width: 8),
              _itemInfo(
                Icons.access_time_filled_rounded,
                "Waktu Tiba",
                "12 Okt 2026\n14:30 WAS",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemInfo(IconData icon, String title, String isi) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Icon(icon, color: Color(0xff104F25), size: 24),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            isi,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container _infoBerangkat() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF165C20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Umroh Reguler 9 Hari",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: Size(0, 0), // hilangkan minimum bawaan
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                child: Text(
                  "Akan Berangkat",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.01,
                  ),
                ),
              ),
            ],
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Berangkat",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "12 Okt 2026",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Container(width: 1.5, height: 40, color: Colors.white),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pulang",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "21 Okt 2026",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(width: 180, height: 1.5, color: Colors.white),
                    const SizedBox(height: 8),
                    Text(
                      "Kode Booking",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "UMR26101289",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            print("COPY");
                          },
                          child: Icon(
                            Icons.copy_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                VerticalDivider(color: Colors.white, thickness: 1.5),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff104F25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "29",
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 32,
                            ),
                          ],
                        ),
                        Text(
                          "Hari Lagi",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _header() {
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
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Assalamu'alaikum",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Selamat menjalankan\nibadah Umroh",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Semoga perjalanan ibadah Bapak/Ibu lancar dan menjadi Umroh yang mabrur.",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 126,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.antiAlias,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerRight,
                  end: AlignmentGeometry.centerLeft,
                  colors: const [
                    Colors.white,
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.6, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'assets/images/kabah-hd.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
