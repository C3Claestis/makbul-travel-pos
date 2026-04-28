// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/data/maskapaimodel.dart';
import 'package:makbul_app/page/main/jamaah/jenispenerbangan_page.dart';
import 'package:makbul_app/page/main/jamaah/provider/maskapai_provider.dart';
import 'package:makbul_app/service/dotted_line.dart';

class DetailpenerbanganPage extends ConsumerWidget {
  const DetailpenerbanganPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMaskapai = ref.watch(selectedMaskapaiProvider);
    final selectedMaskapaiDataLengkap = ref.watch(
      selectedMaskapaiDataLengkapProvider,
    );
    final selectedInfoPenerbangan = ref.watch(selectedInfoPenerbanganProvider);

    if (selectedMaskapai == null ||
        selectedMaskapaiDataLengkap == null ||
        selectedInfoPenerbangan == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Text(
          "Detail Penerbangan",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailPenerbangan(
                selectedMaskapai,
                selectedMaskapaiDataLengkap,
                ref,
              ),
              const SizedBox(height: 24),
              Text(
                "Informasi Penerbangan",
                style: GoogleFonts.notoSansJp(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1B5E20),
                ),
              ),
              const SizedBox(height: 16),
              _informasiPenerbangan(ref),
              const SizedBox(height: 24),
              Text(
                "Jadwal Penerbangan",
                style: GoogleFonts.notoSansJp(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1B5E20),
                ),
              ),
              const SizedBox(height: 16),
              _jadwalPenerbangan(),
            ],
          ),
        ),
      ),
    );
  }

  Container _jadwalPenerbangan() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _itemTimeline(
            isLast: false,
            time: "08:30 WIB",
            date: "21 Mei 2024",
            title: "Berangkat",
            city: "Jakarta (CGK)",
            desc: "Terminal 3 - Gate A5",
          ),

          const Divider(height: 28),

          _itemTimeline(
            isLast: false,
            time: "14:00 AST",
            date: "21 Mei 2024",
            title: "Tiba",
            city: "Jeddah (JED)",
            desc: "Terminal 1",
          ),

          const Divider(height: 28),

          _itemTimelineBottom(
            label: "Durasi Penerbangan",
            value: "10 jam 30 menit",
          ),
        ],
      ),
    );
  }

  Widget _itemTimeline({
    required bool isLast,
    required String time,
    required String date,
    required String title,
    required String city,
    required String desc,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // kiri titik + garis
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: Color(0xFF11823B),
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.grey.shade300,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // waktu
          SizedBox(
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: Colors.grey.shade300,
          ),

          // detail kanan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(city),
                const SizedBox(height: 4),
                Text(desc),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemTimelineBottom({required String label, required String value}) {
    return Row(
      children: [
        const SizedBox(width: 6),
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(child: Text(label, style: GoogleFonts.poppins(fontSize: 14))),

        Container(width: 1, height: 24, color: Colors.grey.shade300),

        const SizedBox(width: 16),

        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Container _informasiPenerbangan(WidgetRef ref) {
    final data = ref.watch(selectedInfoPenerbanganProvider);
    return Container(
      padding: const EdgeInsets.all(8),
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
        children: [
          _isiInfoPenerbangan("Kode Booking (PNR)", data?.kodebooking ?? "-"),
          Divider(thickness: 1),
          _isiInfoPenerbangan("Pesawat", data?.pesawat ?? "-"),
          Divider(thickness: 1),
          _isiInfoPenerbangan("Nomor Penerbangan", data?.nopenerbangan ?? "-"),
          Divider(thickness: 1),
          _isiInfoPenerbangan("Bagasi", data?.bagasi ?? "-"),
          Divider(thickness: 1),
          _isiInfoPenerbangan("Makan", data?.makan ?? "-"),
          Divider(thickness: 1),
          _isiInfoPenerbangan("Program", data?.program ?? "-"),
        ],
      ),
    );
  }

  Padding _isiInfoPenerbangan(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Container _detailPenerbangan(
    MaskapaiModel selectedMaskapai,
    MaskapaiDataLengkap selectedMaskapaiDataLengkap,
    WidgetRef ref,
  ) {
    final data = ref.watch(selectedMaskapaiDataLengkapProvider);
    final data2 = ref.watch(selectedMaskapaiProvider);

    return Container(
      padding: const EdgeInsets.all(8),
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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _header(selectedMaskapai),
                const SizedBox(height: 8),
                Divider(thickness: 1),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedMaskapaiDataLengkap.airportstartcode,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1B5E20),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: DashedLine(height: 2, color: Colors.grey)),
                    const SizedBox(width: 16),
                    SvgPicture.asset(
                      'assets/svgs/icon_plane_flat.svg',
                      height: 18,
                      width: 18,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: DashedLine(height: 2, color: Colors.grey)),
                    const SizedBox(width: 16),
                    Text(
                      selectedMaskapaiDataLengkap.airportendcode,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1B5E20),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedMaskapai.destinationstart.split('(').first.trim(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      selectedMaskapai.destinationend.split('(').first.trim(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        selectedMaskapaiDataLengkap.airportstart,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        selectedMaskapaiDataLengkap.airportend,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Divider(thickness: 1),
              ],
            ),
          ),
          Row(
            children: [
              _detail("Tanggal", data2?.date ?? "-", Icons.calendar_month),
              Container(
                width: 0.5,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
              _detail(
                "Berangkat",
                data2?.time ?? "-",
                Icons.access_time_rounded,
              ),
              Container(
                width: 0.5,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
              _detail("Durasi", data?.duration ?? "-", Icons.timer_outlined),
            ],
          ),
          Divider(thickness: 1),
          Row(
            children: [
              _detail("Terminal", data?.terminal ?? "_", Icons.margin_outlined),
              Container(
                width: 0.5,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
              _detail("Gate", data?.gate ?? "-", Icons.gas_meter_sharp),
              Container(
                width: 0.5,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),
              ),
              _detail("Kelas", data?.kelas ?? "-", Icons.shopify_sharp),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detail(String title, String value, IconData icons) {
    return Expanded(
      child: Container(
        // color: Colors.amber,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icons, size: 24, color: Color(0xFF1B5E20)),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _header(MaskapaiModel selectedMaskapai) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(selectedMaskapai.linkImg),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                selectedMaskapai.title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                selectedMaskapai.code,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1B5E20),
                ),
              ),
            ],
          ),
        ),
        StatusBadge(status: selectedMaskapai.status),
      ],
    );
  }
}
