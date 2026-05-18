import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List data = [
  {
    "tab": "Makkah",
    "title": "Hotel Makkah Tower",
    "logo":
        "https://images.unsplash.com/photo-1690314749019-2754cc7bfac9?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "street": "Alyad Street, Makkah",
    "masjid": "Haram",
    "jarak": "650 m",
  },
  {
    "tab": "Madinah",
    "title": "Grand Plaza Madinah",
    "logo":
        "https://images.unsplash.com/photo-1599722585837-c1cb8eea32ff?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "street": "King Fahd Road, Madinah",
    "masjid": "Nabawi",
    "jarak": "300 m",
  },
];

class HotelTab extends StatelessWidget {
  const HotelTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informasi Hotel",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        _item(0),
        const SizedBox(height: 16),
        _item(1),
      ],
    );
  }

  Column _item(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data[index]["tab"],
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xFFFEFEFE),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                     data[index]["logo"],
                      width: 108,
                      height: 144,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]["title"],
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: Color(0xffFDAA0A),
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            data[index]["street"],                            
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jarak ke Masjidil Haram ${data[index]["masjid"]}",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\u00B1 ${data[index]["jarak"]}",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1B5E20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.restaurant_menu_rounded,
                        color: Colors.black,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Sarapan",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 32),
                  Row(
                    children: [
                      Icon(Icons.wifi_outlined, color: Colors.black, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "Wifi",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
