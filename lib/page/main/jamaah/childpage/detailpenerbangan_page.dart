// ignore_for_file: deprecated_member_use

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
    if (selectedMaskapai == null) {
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
            children: [
              Container(
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
                  children: [
                    _header(selectedMaskapai),
                    const SizedBox(height: 8),
                    Divider(thickness: 1),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedMaskapai.airportstartcode,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1B5E20),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DashedLine(height: 2, color: Colors.grey),
                        ),
                        const SizedBox(width: 16),
                        SvgPicture.asset(
                          'assets/svgs/icon_plane_flat.svg',
                          height: 18,
                          width: 18,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DashedLine(height: 2, color: Colors.grey),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          selectedMaskapai.airportendcode,
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
                          selectedMaskapai.destinationstart
                              .split('(')
                              .first
                              .trim(),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          selectedMaskapai.destinationend
                              .split('(')
                              .first
                              .trim(),
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
                        Text(
                          selectedMaskapai.airportstart,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          selectedMaskapai.airportend,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Divider(thickness: 1),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
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
