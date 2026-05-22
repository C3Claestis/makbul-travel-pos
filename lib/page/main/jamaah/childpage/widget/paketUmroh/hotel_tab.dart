// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/paketumroh.dart';

class HotelTab extends StatelessWidget {
  final Paketumroh paketumroh;

  const HotelTab({super.key, required this.paketumroh});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _item(paketumroh, index);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: paketumroh.detailpaketumroh.hotel.length,
      ),
    );
  }
}

Widget _item(
  Paketumroh paketumroh,
  int index,
) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            "Hotel ${paketumroh.detailpaketumroh.hotel[index].city}",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            paketumroh.detailpaketumroh.hotel[index].keterangan,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
      Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 0.5,
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    paketumroh.detailpaketumroh.hotel[index].images[0],
                    width: 80,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              paketumroh.detailpaketumroh.hotel[index].nama,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Row(
                              children: List.generate(
                                int.parse(
                                  paketumroh.detailpaketumroh.hotel[index].rating,
                                ),
                                (index) => const Icon(
                                  Icons.star,
                                  color: Color(0xffFDAA0A),
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        paketumroh.detailpaketumroh.hotel[index].jarak,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          _itemDisplayHotel(
                            paketumroh.detailpaketumroh.hotel[index].images[1],
                            "Ruang Tamu",
                          ),
                          const SizedBox(width: 8),
                          _itemDisplayHotel(
                            paketumroh.detailpaketumroh.hotel[index].images[2],
                            "Kamar Tidur",
                          ),
                          const SizedBox(width: 8),
                          _itemDisplayHotel(
                            paketumroh.detailpaketumroh.hotel[index].images[3],
                            "Ruang Santai",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconHotel(Icons.wifi, "Wifi"),
                _iconHotel(Icons.restaurant, "Restoran"),
                _iconHotel(Icons.elevator_outlined, "Lift"),
                _iconHotel(Icons.ac_unit, "AC"),
                _iconHotel(Icons.room_service_outlined, "Room Service"),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Column _iconHotel(IconData icon, String title) {
  return Column(
    children: [
      Icon(icon, color: Colors.black, size: 24),
      const SizedBox(height: 4),
      Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget _itemDisplayHotel(String images, String title) {
  return Container(
    width: 84,
    height: 56,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    clipBehavior: Clip.hardEdge, // penting agar gambar ikut radius
    child: Stack(
      children: [
        Image.network(
          images,
          fit: BoxFit.cover, // gambar penuh sesuai container
        ),

        // overlay gelap biar text lebih jelas
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(height: 20, color: Colors.black.withOpacity(0.4)),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),

        // text di depan gambar
        Positioned(
          bottom: 0,
          right: 0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 4, bottom: 4),
              child: Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
