// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Map<String, String>> data = [
  {
    "title": "Penerbangan",
    "desc": "Garuda GA123\n10 Mar 2026 - 10:00\nCGK → JED",
    "icon": "assets/svgs/icon_plane.svg",
  },
  {
    "title": "Hotel",
    "desc": "Makkah Tower\n 10 - 15 Mar 2026\n Room 1203",
    "icon": "assets/svgs/icon_hotel.svg",
  },
  {
    "title": "Lokasi",
    "desc": "Makkah, Madinah\n Arab Saudi",
    "icon": "assets/svgs/icon_pinlokasi.svg",
  },
  {
    "title": "Dokumen",
    "desc": "Paspor, Visa\n Lenkgkap",
    "icon": "assets/svgs/icon_dokumen.svg",
  },
];

final dataJadwal = [
  {
    "day": "Day 1 - 10 Mar 2026",
    "title": "Berangkat ke Jeddah",
    "icon": Icons.flight_takeoff,
    "desc": [
      "Check-in bandara pukul 07:00 WIB",
      "Briefing bersama tour leader",
      "Penerbangan menuju Jeddah",
      "Imigrasi & pengambilan bagasi",
      "Perjalanan menuju hotel",
      "Istirahat di hotel",
    ],
  },
  {
    "day": "Day 2 - 11 Mar 2026",
    "title": "Umroh & City Tour Makkah",
    "icon": Icons.mosque,
    "desc": [
      "Sarapan pagi di hotel",
      "Persiapan berihram",
      "Pelaksanaan ibadah umroh",
      "Makan siang",
      "City tour area Makkah",
      "Kembali ke hotel",
    ],
  },
  {
    "day": "Day 3 - 12 Mar 2026",
    "title": "Ziarah Makkah",
    "icon": Icons.location_on,
    "desc": [
      "Kunjungan ke Jabal Rahmah",
      "Mengunjungi Padang Arafah",
      "Singgah di Mina & Muzdalifah",
      "Belanja oleh-oleh",
      "Kembali ke hotel",
    ],
  },
];

final expandedScheduleProvider = StateProvider<int>((ref) => -1);

class PaketsayaPage extends ConsumerWidget {
  const PaketsayaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Center(
          child: Text(
            "Paket Saya",
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
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPackageheader(),
            const SizedBox(height: 16),
            _buildNextActivity(),
            const SizedBox(height: 16),
            _buildQuickInfo(),
            const SizedBox(height: 16),
            _buildSchedule(ref),
            const SizedBox(height: 16),
            _buildAnnouncement(),
            const SizedBox(height: 24),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Row _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _bottomButton(
            icon: Icons.list_alt,
            title: "Lihat Detail",
            bgColor: Colors.white,
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          flex: 3,
          child: _bottomButton(
            icon: Icons.call,
            title: "Hubungi Pembimbing",
            bgColor: const Color(0xFF1B5E20),
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          flex: 2,
          child: _bottomButton(
            icon: Icons.download_outlined,
            title: "Download\nDokumen",
            bgColor: Colors.white,
            textColor: Colors.black87,
            iconColor: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _bottomButton({
    required IconData icon,
    required String title,
    required Color bgColor,
    required Color textColor,
    required Color iconColor,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: iconColor),

          const SizedBox(width: 6),

          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: textColor,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildAnnouncement() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF6EC),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: const Color(0xFFD6E6DB), width: 2),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svgs/icon_megaphone.svg',
            color: const Color(0xFF1B5E20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informasi / Pengumuman",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: const Color(0xFF1B5E20),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "\u2022 Jangan lupa kumpul di lobby jam 13:30\n"
                "\u2022 Gunakan pakaian ihram yang nyaman",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildSchedule(WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jadwal Perjalanan",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(
            dataJadwal.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _scheduleItem(
                ref,
                index: index,
                day: dataJadwal[index]["day"] as String,
                title: dataJadwal[index]["title"] as String,
                desc: dataJadwal[index]["desc"] as List<String>,
                icon: dataJadwal[index]["icon"] as IconData,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= WIDGET ITEM =================
  Widget _scheduleItem(
    WidgetRef ref, {
    required int index,
    required String day,
    required String title,
    required IconData icon,
    required List<String> desc,
  }) {
    final expandedIndex = ref.watch(expandedScheduleProvider);
    final isOpen = expandedIndex == index;

    return GestureDetector(
      onTap: () {
        ref.read(expandedScheduleProvider.notifier).state = isOpen ? -1 : index;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAF8),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color(0xFF165C20),
                  child: Icon(icon, size: 18, color: Colors.white),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        day,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                ),
              ],
            ),

            /// DROPDOWN DETAIL POINT
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              crossFadeState: isOpen
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: const SizedBox(),
              secondChild: Column(
                children: [
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),

                  ...desc.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Color(0xFF2E7D32),
                          ),
                          const SizedBox(width: 8),

                          Expanded(
                            child: Text(
                              item,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                height: 1.5,
                                color: Colors.black54,
                              ),
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
      ),
    );
  }

  Container _buildQuickInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Penting",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = (constraints.maxWidth - 12) / 2;

              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: data.map((item) {
                  return SizedBox(
                    width: itemWidth, // 🔥 ini yang kurang
                    child: _cardInformasi(
                      title: item["title"]!,
                      description: item["desc"]!,
                      iconPath: item["icon"]!,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _cardInformasi({
    required String title,
    required String description,
    required String iconPath,
  }) {
    return Card(
      color: const Color(0xFFFEFEFE),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // penting
          children: [
            Column(
              children: [
                const SizedBox(height: 12),
                SvgPicture.asset(
                  iconPath,
                  color: const Color(0xFF1B5E20),
                  height: 32,
                  width: 32,
                ),
              ],
            ),

            const SizedBox(width: 12),

            // Supaya text ikut lebar row
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // ini kunci
                children: [
                  Text(
                    title,
                    style: GoogleFonts.notoSansJp(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description, //"Garuda GA123\n10 Mar 2026 - 10:00\nCGK → JED",
                    style: GoogleFonts.notoSansJp(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      letterSpacing: .5,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left, // pastikan kiri
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildNextActivity() {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Aktivitas Terdekat",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "Lihat Semua",
                style: GoogleFonts.poppins(
                  color: Color(0xFF1B5E20),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// ITEM 1
          _itemAktivitas(
            icon: Icons.calendar_today,
            title: "Check-in Hotel",
            subtitle: "Makkah Tower Hotel, Makkah",
            time: "Hari ini - 14:00",
            isFirst: true,
            isLast: false,
          ),

          /// ITEM 2
          _itemAktivitas(
            icon: Icons.flight,
            title: "Penerbangan ke Madinah",
            subtitle: "Garuda GA123 • Terminal 3",
            time: "Besok - 08:00",
            isFirst: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _itemAktivitas({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required bool isFirst,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TIMELINE (ICON + GARIS)
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xFF1B5E20),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 18),
              ),

              if (!isLast)
                Expanded(child: Container(width: 2, color: Color(0xFF1B5E20))),
            ],
          ),

          const SizedBox(width: 12),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),

                if (!isLast)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Divider(color: Colors.grey[300]),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildPackageheader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1B5E20),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: 1,
            child: Image.asset(
              'assets/images/kabah-img.png',
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A7B36),
                      borderRadius: BorderRadius.circular(12),
                      border: BoxBorder.all(
                        color: const Color(0xFF165C20),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 🔥 penting
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFF7FF175),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "SEDANG BERLANGSUNG",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Umroh Ramadhan 2026",
                    style: GoogleFonts.notoSansJp(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/icon_calender.svg",
                        width: 12,
                        height: 12,
                        color: Colors.white,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "10 Mar - 20 Mar 2026 (11 Hari)",
                        style: GoogleFonts.notoSansJp(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Progress Perjalanan",
                    style: GoogleFonts.notoSansJp(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: 240,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: 0.6, // 60%
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(16),
                            backgroundColor: Colors.greenAccent.withOpacity(
                              0.25,
                            ),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "60%",
                          style: GoogleFonts.notoSansJp(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
