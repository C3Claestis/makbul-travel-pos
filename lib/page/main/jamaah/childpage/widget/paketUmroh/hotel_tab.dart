// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelTab extends StatelessWidget {
  const HotelTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _item(
          "Hotel Mekkah",
          "(4 Malam)",
          "Pullman ZamZam Makkah",
          "800 m dari Masjidil Haram",
          5,
          'https://plus.unsplash.com/premium_photo-1681429766562-fffa63d382c2?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1661964071015-d97428970584?q=80&w=1620&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1687960116497-0dc41e1808a2?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'Ruang Tamu',
          'Kamar Tidur',
          'Ruang Santai',
        ),
        const SizedBox(height: 16),
        _item(
          "Hotel Madinah",
          "(3 Malam)",
          "Maden Hotel",
          "300 m dari Masjid Nabawi",
          5,
          'https://images.unsplash.com/photo-1535827841776-24afc1e255ac?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1621293954908-907159247fc8?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1631049552057-403cdb8f0658?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1661962769148-fbe587e60fb8?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'Ruang Tamu',
          'Kamar Tidur',
          'Ruang Santai',
        ),
        const SizedBox(height: 16),
        _item(
          "Hotel Transit",
          "(Jeddah)",
          "Ibis Jeddah City Center",
          "Dekat Bandara Jeddah",
          4 ,
          'https://images.unsplash.com/photo-1535827841776-24afc1e255ac?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1621293954908-907159247fc8?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1631049552057-403cdb8f0658?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://plus.unsplash.com/premium_photo-1661962769148-fbe587e60fb8?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'Ruang Tamu',
          'Kamar Tidur',
          'Ruang Santai',
        ),
      ],
    );
  }

  Widget _item(
    String title,
    String subtitle,
    String nameHotel,
    String jarak,
    int star,
    String imagesHotel,
    String imagesRoom1,
    String imagesRoom2,
    String imagesRoom3,
    String titleRoom1,
    String titleRoom2,
    String titleRoom3,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              subtitle,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imagesHotel,
                      width: 80,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            nameHotel,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Row(
                            children: List.generate(
                              star,
                              (index) => const Icon(
                                Icons.star,
                                color: Color(0xffFDAA0A),
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        jarak,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          _itemDisplayHotel(imagesRoom1, titleRoom1),
                          const SizedBox(width: 8),
                          _itemDisplayHotel(imagesRoom2, titleRoom2),
                          const SizedBox(width: 8),
                          _itemDisplayHotel(imagesRoom3, titleRoom3),
                        ],
                      ),
                    ],
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
                  style: TextStyle(
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
}
