// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/main/jamaah/childpage/detailhotel_page.dart';
import 'package:makbul_app/page/main/jamaah/childpage/detaillokasi_page.dart';
import 'package:makbul_app/page/main/jamaah/data/hotelmodel.dart';
import 'package:makbul_app/page/main/jamaah/data/lokasimodel.dart';
import 'package:makbul_app/page/main/jamaah/provider/provider.dart';

class LokasihotelPage extends ConsumerWidget {
  const LokasihotelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Center(
          child: Text(
            "Lokasi/Hotel",
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _srchandfilter(),
            const SizedBox(height: 24),
            rekomendasiTxt(),
            const SizedBox(height: 16),
            _itemRekomendasi(context, ref, dataLokasi),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Daftar Hotel Populer",
                style: GoogleFonts.notoSansJp(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              itemCount: dataHotel.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final hotel = dataHotel[index];
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
            ),
          ],
        ),
      ),
    );
  }

  GridView _itemRekomendasi(
    BuildContext context,
    WidgetRef ref,
    List<Lokasimodel> data,
  ) {
    final displayData = data.take(3).toList(); // ambil max 3

    return GridView.builder(
      itemCount: displayData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.7,
      ),

      itemBuilder: (context, index) {
        final item = displayData[index];

        return _card(
          context: context,
          ref: ref,
          linkImg: item.linkImg,
          name: item.name,
          lokasi: item.lokasi,
          tempat: item.tempat,
          deskripsi: item.deskripsi,
          jarak: item.jarak,
          waktutempuh: item.waktutempuh,
          area: item.area,
          koordinat: item.koordinat,
        );
      },
    );
  }

  Row rekomendasiTxt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          "Rekomendasi Lokasi",
          style: GoogleFonts.notoSansJp(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "Lihat Semua",
          style: GoogleFonts.notoSansJp(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B5E20),
          ),
        ),
      ],
    );
  }

  Row _srchandfilter() {
    return Row(
      children: [
        Expanded(child: _srchHotel()),
        const SizedBox(width: 8),
        IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_sharp)),
      ],
    );
  }

  Container _srchHotel() {
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
          hintText: "Cari hotel atau lokasi hotel",
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

  Widget _card({
    required BuildContext context,
    required WidgetRef ref,
    required String linkImg,
    required String name,
    required String lokasi,
    required String tempat,
    required String deskripsi,
    required String jarak,
    required String waktutempuh,
    required String area,
    required String koordinat,
  }) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedLokasiProvider.notifier).state = Lokasimodel(
          linkImg: linkImg,
          name: name,
          lokasi: lokasi,
          tempat: tempat,
          deskripsi: deskripsi,
          jarak: jarak,
          waktutempuh: waktutempuh,
          area: area,
          koordinat: koordinat,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const DetaillokasiPage();
            },
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: SizedBox(
          height: 160, // penting biar ada tinggi
          child: Stack(
            children: [
              /// BACKGROUND IMAGE (full)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(linkImg, fit: BoxFit.cover),
                ),
              ),

              /// OVERLAY TEXT (di depan)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lokasi,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
}
