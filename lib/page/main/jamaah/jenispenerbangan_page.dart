// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/data/maskapaimodel.dart';
import 'package:makbul_app/page/main/jamaah/childpage/detailpenerbangan_page.dart';
import 'package:makbul_app/page/main/jamaah/provider/maskapai_provider.dart';

class JenispenerbanganPage extends ConsumerWidget {
  const JenispenerbanganPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Center(
          child: Text(
            "Jenis Penerbangan",
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
            children: [
              _srchMaskapai(),
              const SizedBox(height: 16),
              ...List.generate(
                dataMaskapai.length,
                (index) => _listMaskapai(
                  ref: ref,
                  context: context,
                  tittle: dataMaskapai[index]["title"] as String,
                  linkImg: dataMaskapai[index]["icon"] as String,
                  code: dataMaskapai[index]["code"] as String,
                  destinationstart:
                      dataMaskapai[index]["destinationstart"] as String,
                  destinationend:
                      dataMaskapai[index]["destinationend"] as String,
                  time: dataMaskapai[index]["time"] as String,
                  date: dataMaskapai[index]["date"] as String,
                  status: dataMaskapai[index]["status"] as String,
                  terminal: dataMaskapai[index]["terminal"] as String,
                  gate: dataMaskapai[index]["gate"] as String,
                  kelas: dataMaskapai[index]["kelas"] as String,
                  airportstart: dataMaskapai[index]["airportstart"] as String,
                  airportstartcode:
                      dataMaskapai[index]["airportstartcode"] as String,
                  airportend: dataMaskapai[index]["airportend"] as String,
                  airportendcode:
                      dataMaskapai[index]["airportendcode"] as String,
                  duration: dataMaskapai[index]["duration"] as String,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listMaskapai({
    required BuildContext context,
    required WidgetRef ref,
    required String tittle,
    required String code,
    required String destinationstart,
    required String destinationend,
    required String time,
    required String date,
    required String linkImg,
    required String status,
    required String terminal,
    required String gate,
    required String kelas,
    required String airportstart,
    required String airportstartcode,
    required String airportend,
    required String airportendcode,
    required String duration,
  }) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedMaskapaiProvider.notifier).state = MaskapaiModel(
          title: tittle,
          code: code,
          destinationstart: destinationstart,
          destinationend: destinationend,
          time: time,
          date: date,
          linkImg: linkImg,
          status: status,
          duration: duration,
          terminal: terminal,
          gate: gate,
          kelas: kelas,
          airportstart: airportstart,
          airportstartcode: airportstartcode,
          airportend: airportend,
          airportendcode: airportendcode,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const DetailpenerbanganPage();
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(radius: 40, backgroundImage: NetworkImage(linkImg)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tittle,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        code,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1B5E20),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "$destinationstart \u2192 $destinationend",
                        style: GoogleFonts.poppins(fontSize: 10),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.access_time_sharp, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            "$time \u2981 $date",
                            style: GoogleFonts.poppins(fontSize: 10),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              StatusBadge(status: status),
              Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Container _srchMaskapai() {
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
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Cari maskapai atau rute penerbangan",
          hintStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

class StatusStyle {
  final Color bgColor;
  final Color textColor;

  StatusStyle({required this.bgColor, required this.textColor});
}

class StatusBadge extends ConsumerWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = ref.watch(statusColorProvider(status));

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: style.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: GoogleFonts.notoSansJp(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: style.textColor,
        ),
      ),
    );
  }
}
