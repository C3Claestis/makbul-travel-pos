// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/childpage/detailhotel_page.dart';
import 'package:makbul_app/page/main/jamaah/data/hotelmodel.dart';
import 'package:makbul_app/page/main/jamaah/data/lokasimodel.dart';
import 'package:makbul_app/page/main/jamaah/provider/provider.dart';

final filterJarakProvider = StateProvider<int>((ref) => 0);

class DetailhoteldisekitarlokasiPage extends ConsumerWidget {
  const DetailhoteldisekitarlokasiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLokasi = ref.watch(selectedLokasiProvider);
    final selectedHotel = ref.watch(selectedHotelProvider);

    if (selectedLokasi == null || selectedHotel == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final selectedIndex = ref.watch(filterJarakProvider);
    final filteredHotel = dataHotel.where((hotel) {
      // 1. Filter Lokasi (Mekkah/Madinah)
      final matchLokasi =
          hotel.location.trim().toLowerCase() ==
          selectedLokasi.lokasi.trim().toLowerCase();

      // 2. Filter Jarak (Logika sederhana)
      // Anda perlu mengambil angka saja dari string "50 m dari..."
      // menggunakan trik split yang kita bahas tadi.
      int angkaJarak = int.tryParse(hotel.jarak.split(' ')[0]) ?? 0;

      bool matchJarak = true;
      if (selectedIndex == 0) matchJarak = angkaJarak <= 30;
      if (selectedIndex == 1) matchJarak = angkaJarak > 30 && angkaJarak <= 60;
      if (selectedIndex == 2) matchJarak = angkaJarak > 60 && angkaJarak <= 100;
      if (selectedIndex == 3) matchJarak = angkaJarak > 100;

      return matchLokasi && matchJarak; // Harus memenuhi keduanya
    }).toList();

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // 🔥 CUSTOM APPBAR
            _appBar(context),

            // 🔥 CONTAINER YANG MENIMPA APPBAR
            _content(selectedLokasi, ref, filteredHotel),
          ],
        ),
      ),
    );
  }

  Positioned _content(
    Lokasimodel selectedLokasi,
    WidgetRef ref,
    List<Hotelmodel> filteredHotel,
  ) {
    return Positioned(
      top: 110, // ⬅️ ini kunci overlap (atur sesuai selera)
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _imgContent(selectedLokasi),
              const SizedBox(height: 16),
              _buildDistanceFilter(ref),
              const SizedBox(height: 16),
              _listContentHotel(filteredHotel, ref),
            ],
          ),
        ),
      ),
    );
  }

  ListView _listContentHotel(List<Hotelmodel> filteredHotel, WidgetRef ref) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: filteredHotel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final hotel = filteredHotel[index];
        return _cardHotel(
          context,
          ref,
          hotel.linkImg,
          hotel.hotelname,
          hotel.location,
          hotel.jarak,
          hotel.rating,
          hotel.reviewer,
          hotel.price,
          hotel.description,
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 12),
    );
  }

  Widget _buildDistanceFilter(WidgetRef ref) {
    // Ambil indeks yang sedang aktif
    final selectedIndex = ref.watch(filterJarakProvider);

    final List<String> categories = [
      "≤ 30 m",
      "30 - 60 m",
      "60 - 100 m",
      "> 100 m",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(categories.length, (index) {
          final bool isActive = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                // Ubah state saat ditekan
                ref.read(filterJarakProvider.notifier).state = index;
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF1B5E20) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isActive
                        ? const Color(0xFF1B5E20)
                        : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  categories[index],
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    color: isActive ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _cardHotel(
    BuildContext context,
    WidgetRef ref,
    String linkImage,
    String hotelname,
    String location,
    String jarak,
    String rating,
    String reviewer,
    int price,
    String desc,
  ) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedHotelProvider.notifier).state = Hotelmodel(
          linkImg: linkImage,
          hotelname: hotelname,
          location: location,
          jarak: jarak,
          rating: rating,
          reviewer: reviewer,
          price: price,
          description: desc,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailhotelPage()),
        );
      },
      child: Card(
        color: const Color(0xffF5F7FA),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              /// IMAGE
              Container(
                width: 75,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(linkImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 16),

              /// CONTENT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// HOTEL NAME
                    Text(
                      hotelname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// LOCATION
                    Text(
                      '$location · $jarak',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),

                    /// RATING + PRICE ROW
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// LEFT SIDE (RATING)
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),

                        const SizedBox(width: 4),

                        Text(
                          '($reviewer ulasan)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const Spacer(),

                        /// RIGHT SIDE (PRICE)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              'Mulai dari',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'SAR $price',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1B5E20),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  '/malam',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect _imgContent(Lokasimodel selectedLokasi) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      child: Stack(
        children: [
          // 🔥 IMAGE
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Image.network(selectedLokasi.linkImg, fit: BoxFit.cover),
          ),
          Positioned(
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
          ),

          Positioned(
            top: 62,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedLokasi.name,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  selectedLokasi.lokasi,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _appBar(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
      decoration: const BoxDecoration(color: Color(0xFF1B5E20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Hotel di Sekitar Lokasi",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 48), // biar title tetap center
            ],
          ),
        ],
      ),
    );
  }
}
