class Paketumroh {
  final String id;
  final String title;
  final String maskapai;
  final String duration;
  final String mekkahNights;
  final String madinahNights;
  final String transit;
  final double price;
  final String image;
  final bool isFavorite;
  final Detailpaketumroh detailpaketumroh;

  Paketumroh({
    required this.id,
    required this.title,
    required this.maskapai,
    required this.duration,
    required this.mekkahNights,
    required this.madinahNights,
    required this.transit,
    required this.price,
    required this.image,
    this.isFavorite = false,
    required this.detailpaketumroh,
  });
}

class Detailpaketumroh {
  final String codepaket;
  final String description;
  final List<String> datatravel;
  final List<String> dataagen;
  final List<JadwalHari> jadwal;
  final List<HotelInfo> hotel;
  final List<String> fasilitas;
  final List<String> persyaratan;

  Detailpaketumroh({
    required this.codepaket,
    required this.description,
    required this.datatravel,
    required this.dataagen,
    required this.jadwal,
    required this.hotel,
    required this.fasilitas,
    required this.persyaratan,
  });
}

class JadwalHari {
  final String hari;
  final String tanggal;
  final List<String> aktivitas;

  JadwalHari({
    required this.hari,
    required this.tanggal,
    required this.aktivitas,
  });
}

class HotelInfo {
  final String nama;
  final String jarak;
  final String rating;
  final List<String> images;

  HotelInfo({
    required this.nama,
    required this.jarak,
    required this.rating,
    required this.images,
  });
}

final List<Paketumroh> paketumrohList = [
  Paketumroh(
    id: '1',
    title: 'Umrah Reguler 9 Hari',
    maskapai: 'Garuda Indonesia',
    duration: '9 Hari',
    mekkahNights: 'Mekkah 4N',
    madinahNights: 'Madinah 3N',
    transit: 'Jeddah',
    price: 28000000,
    image:
        'https://images.unsplash.com/photo-1511091734515-e50d46c37240?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

    // =============================================
    // PAKET 1 - Umrah Reguler 9 Hari (UMH-09RG)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-09RG',
      description:
          'Paket umroh reguler dengan pelayanan terbaik, hotel bintang 5 di Mekkah dan Madinah, makan 3x sehari, ziarah sesuai sunnah, dan pembimbing berpengalaman.',
      datatravel: [
        'https://images.unsplash.com/photo-1680015157236-22c554b971a8?q=80&w=1170',
        'Sahabat Tours & Travel',
        'Izin PPIU No. 1234 Tahun 2019',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170',
        'Aisyah Rahma',
        'Konsultan Umrah',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Jumat, 10 Mei 2026',
          aktivitas: [
            'Berkumpul di Bandara Soekarno Hatta',
            'Check-in & briefing keberangkatan',
            'Penerbangan menuju Jeddah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Sabtu, 11 Mei 2026',
          aktivitas: [
            'Tiba di Jeddah',
            'Menuju Mekkah',
            'Check-in hotel & istirahat',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Minggu, 12 Mei 2026',
          aktivitas: [
            'Umrah pertama',
            'Tawaf & Sa\'i',
            'Ibadah Masjidil Haram',
          ],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Senin, 13 Mei 2026',
          aktivitas: [
            'Ibadah Masjidil Haram',
            'Tadarus Al-Qur\'an',
            'Qiyamul Lail',
          ],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Selasa, 14 Mei 2026',
          aktivitas: ['Ziarah Mekkah', 'Jabal Nur', 'Jabal Rahmah'],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Rabu, 15 Mei 2026',
          aktivitas: ['Perjalanan ke Madinah', 'Check-in hotel', 'Istirahat'],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Kamis, 16 Mei 2026',
          aktivitas: ['Masjid Nabawi', 'Raudhah visit', 'Ibadah'],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Jumat, 17 Mei 2026',
          aktivitas: [
            'City tour Madinah',
            'Belanja oleh-oleh',
            'Persiapan pulang',
          ],
        ),
        JadwalHari(
          hari: 'Hari 9',
          tanggal: 'Sabtu, 18 Mei 2026',
          aktivitas: [
            'Check-out hotel',
            'Perjalanan ke bandara',
            'Return ke Indonesia',
          ],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Pullman ZamZam Mekkah',
          jarak: '800 m',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1566073771259-6a8506099945',
            'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
            'https://images.unsplash.com/photo-1631049307264-da0ec9d70304',
            'https://images.unsplash.com/photo-1590490360182-c33d57733427',
            'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
          ],
        ),
        HotelInfo(
          nama: 'Maden Hotel Madinah',
          jarak: '300 m',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9',
            'https://images.unsplash.com/photo-1578683010236-d716f9a3f461',
            'https://images.unsplash.com/photo-1584132967334-10e028bd69f7',
            'https://images.unsplash.com/photo-1600011689032-8b628b8a8747',
            'https://images.unsplash.com/photo-1521783988139-89397d761dce',
          ],
        ),
      ],
      fasilitas: [
        'Hotel bintang 5 Mekkah & Madinah',
        'Makan 3x sehari (full board)',
        'Transport bus AC',
        'Ziarah city tour',
        'Air zamzam 5 liter',
        'Pembimbing berpengalaman',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan',
        'Vaksin meningitis',
        'KTP & KK',
        'Foto 4x6 background putih',
      ],
    ),
  ),

  Paketumroh(
    id: '2',
    title: 'Umrah Plus Turki',
    maskapai: 'Turkish Airlines',
    duration: '12 Hari',
    mekkahNights: 'Mekkah 5N',
    madinahNights: 'Madinah 4N',
    transit: 'Istanbul',
    price: 35000000,
    image:
        'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?q=80&w=1200&auto=format&fit=crop',
    // =============================================
    // PAKET 2 - Umrah Plus Turki (UMH-12TR)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-12TR',
      description:
          'Paket spesial umrah plus wisata religi Istanbul, mengunjungi Masjid Biru, Hagia Sophia, dan Grand Bazaar sebelum melanjutkan ibadah umrah di Tanah Suci.',
      datatravel: [
        'https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?q=80&w=1170',
        'Baitullah Travel',
        'Izin PPIU No. 5678 Tahun 2020',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=1170',
        'Ahmad Fauzi',
        'Senior Travel Consultant',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Senin, 01 Juni 2026',
          aktivitas: [
            'Kumpul di Bandara Soekarno Hatta',
            'Penerbangan Jakarta – Istanbul via Turkish Airlines',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Selasa, 02 Juni 2026',
          aktivitas: [
            'Tiba di Istanbul',
            'Check-in hotel',
            'Istirahat & makan malam',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Rabu, 03 Juni 2026',
          aktivitas: [
            'Blue Mosque (Sultan Ahmet)',
            'Hagia Sophia',
            'Topkapi Palace',
          ],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Kamis, 04 Juni 2026',
          aktivitas: [
            'Grand Bazaar',
            'Bosphorus cruise',
            'Penerbangan Istanbul – Jeddah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Jumat, 05 Juni 2026',
          aktivitas: ['Tiba Jeddah', 'Menuju Mekkah', 'Check-in & miqat'],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Sabtu, 06 Juni 2026',
          aktivitas: ['Pelaksanaan Umrah', 'Tawaf & Sa\'i', 'Tahalul'],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Minggu, 07 Juni 2026',
          aktivitas: [
            'Ibadah Masjidil Haram',
            'Kajian agama bersama pembimbing',
          ],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Senin, 08 Juni 2026',
          aktivitas: ['Ziarah Mekkah', 'Jabal Tsur', 'Museum Kiswah'],
        ),
        JadwalHari(
          hari: 'Hari 9',
          tanggal: 'Selasa, 09 Juni 2026',
          aktivitas: ['Perjalanan Mekkah – Madinah', 'Check-in hotel Madinah'],
        ),
        JadwalHari(
          hari: 'Hari 10',
          tanggal: 'Rabu, 10 Juni 2026',
          aktivitas: ['Masjid Nabawi', 'Ziarah Raudhah', 'Makam Baqi'],
        ),
        JadwalHari(
          hari: 'Hari 11',
          tanggal: 'Kamis, 11 Juni 2026',
          aktivitas: ['Masjid Quba', 'Masjid Qiblatain', 'Belanja oleh-oleh'],
        ),
        JadwalHari(
          hari: 'Hari 12',
          tanggal: 'Jumat, 12 Juni 2026',
          aktivitas: ['Check-out', 'Bandara Madinah', 'Return ke Indonesia'],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Hilton Istanbul Bomonti',
          jarak: '1.2 km dari Blue Mosque',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1549294413-26f195200c16',
            'https://images.unsplash.com/photo-1596436889106-be35e843f974',
            'https://images.unsplash.com/photo-1603034203013-d532350372c4',
            'https://images.unsplash.com/photo-1609766857585-b3929a9c39bd',
            'https://images.unsplash.com/photo-1574643156929-51fa098b0394',
          ],
        ),
        HotelInfo(
          nama: 'Anjum Hotel Mekkah',
          jarak: '600 m',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb',
            'https://images.unsplash.com/photo-1560347876-aeef00ee58a1',
            'https://images.unsplash.com/photo-1568084680786-a84f91d1153c',
            'https://images.unsplash.com/photo-1553653924-39b70295f8da',
            'https://images.unsplash.com/photo-1576354302919-96748cb8299e',
          ],
        ),
      ],
      fasilitas: [
        'Hotel bintang 5 Istanbul, Mekkah & Madinah',
        'Makan 3x sehari',
        'City tour Istanbul (3 hari)',
        'Transport AC khusus grup',
        'Visa Turki & Arab Saudi',
        'Tour guide berbahasa Indonesia',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan',
        'Vaksin meningitis',
        'KTP & KK',
        'Foto 4x6 background putih',
        'Bukti tabungan 3 bulan terakhir',
      ],
    ),
  ),

  Paketumroh(
    id: '3',
    title: 'Umrah Ramadhan Awal',
    maskapai: 'Saudi Airlines',
    duration: '10 Hari',
    mekkahNights: 'Mekkah 5N',
    madinahNights: 'Madinah 3N',
    transit: 'Jeddah',
    price: 32000000,
    image:
        'https://plus.unsplash.com/premium_photo-1670745800247-271e8977da41?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // =============================================
    // PAKET 3 - Umrah Ramadhan Awal (UMH-10RM)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-10RM',
      description:
          'Rasakan keistimewaan ibadah umrah di awal Ramadhan, shalat tarawih di Masjidil Haram, dan tadarus bersama jutaan jamaah dari seluruh dunia di Tanah Suci.',
      datatravel: [
        'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?q=80&w=1170',
        'Haramain Wisata',
        'Izin PPIU No. 9012 Tahun 2021',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1170',
        'Fatimah Zahra',
        'Agen Umrah Berpengalaman 10 Tahun',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Selasa, 17 Maret 2026',
          aktivitas: [
            'Keberangkatan dari Jakarta',
            'Penerbangan via Saudi Airlines',
            'Sahur di pesawat',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Rabu, 18 Maret 2026',
          aktivitas: [
            'Tiba di Jeddah',
            'Menuju Madinah (Madinah first)',
            'Check-in hotel & berbuka',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Kamis, 19 Maret 2026',
          aktivitas: [
            'Shalat Subuh Masjid Nabawi',
            'Ziarah Raudhah',
            'Tarawih berjamaah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Jumat, 20 Maret 2026',
          aktivitas: ['Masjid Quba', 'Masjid Qiblatain', 'Pasar Kurma'],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Sabtu, 21 Maret 2026',
          aktivitas: [
            'Perjalanan Madinah – Mekkah',
            'Miqat di Bir Ali',
            'Tiba Mekkah & check-in',
          ],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Minggu, 22 Maret 2026',
          aktivitas: [
            'Pelaksanaan Umrah malam hari',
            'Tawaf & Sa\'i',
            'Tahalul',
          ],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Senin, 23 Maret 2026',
          aktivitas: [
            'Ibadah di Masjidil Haram',
            'Buka puasa bersama di Masjidil Haram',
            'Tarawih',
          ],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Selasa, 24 Maret 2026',
          aktivitas: [
            'Ziarah Mekkah',
            'Jabal Nur',
            'Jabal Rahmah',
            'Jabal Tsur',
          ],
        ),
        JadwalHari(
          hari: 'Hari 9',
          tanggal: 'Rabu, 25 Maret 2026',
          aktivitas: [
            'Ibadah bebas di Masjidil Haram',
            'Belanja perlengkapan ibadah',
            'Persiapan pulang',
          ],
        ),
        JadwalHari(
          hari: 'Hari 10',
          tanggal: 'Kamis, 26 Maret 2026',
          aktivitas: [
            'Check-out hotel',
            'Menuju bandara Jeddah',
            'Return ke Indonesia',
          ],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Swissotel Al Maqam Mekkah',
          jarak: '50 m dari Masjidil Haram',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4',
            'https://images.unsplash.com/photo-1601701119533-fde78d20f79a',
            'https://images.unsplash.com/photo-1595576508898-0ad5c879a061',
            'https://images.unsplash.com/photo-1625244724120-1fd1d34d00f6',
            'https://images.unsplash.com/photo-1586611292717-f828b167408c',
          ],
        ),
        HotelInfo(
          nama: 'Dallah Taibah Hotel Madinah',
          jarak: '200 m dari Masjid Nabawi',
          rating: '4',
          images: [
            'https://images.unsplash.com/photo-1537432376769-00f5c2f4c8d2',
            'https://images.unsplash.com/photo-1551776235-dde6d482980b',
            'https://images.unsplash.com/photo-1562778612-e1e0cda9915c',
            'https://images.unsplash.com/photo-1605346434674-a440ca4dc4c0',
            'https://images.unsplash.com/photo-1571896349842-33c89424de2d',
          ],
        ),
      ],
      fasilitas: [
        'Hotel sangat dekat Masjidil Haram',
        'Makan sahur & buka puasa (Ramadhan special)',
        'Kurma & air zamzam gratis',
        'Tarawih bersama di Masjidil Haram',
        'Bus khusus AC full AC',
        'Ustadz pembimbing resident',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan',
        'Vaksin meningitis & influenza',
        'KTP & KK',
        'Foto 4x6 background putih',
        'Surat keterangan sehat dari dokter',
      ],
    ),
  ),

  Paketumroh(
    id: '4',
    title: 'Umrah VIP Executive',
    maskapai: 'Emirates',
    duration: '14 Hari',
    mekkahNights: 'Mekkah 6N',
    madinahNights: 'Madinah 5N',
    transit: 'Dubai',
    price: 48000000,
    image:
        'https://images.unsplash.com/photo-1584551246679-0daf3d275d0f?q=80&w=1200&auto=format&fit=crop',
    // =============================================
    // PAKET 4 - Umrah VIP Executive (UMH-14VP)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-14VP',
      description:
          'Pengalaman umrah eksklusif kelas VIP dengan layanan private concierge, kamar suite hotel, penerbangan business class Emirates, dan pembimbing pribadi sepanjang perjalanan.',
      datatravel: [
        'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=1170',
        'Al-Noor Premium Travel',
        'Izin PPIU No. 3344 Tahun 2018',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=1170',
        'Haji Mahmud Salim',
        'Direktur & Senior Muthawwif',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Senin, 06 Juli 2026',
          aktivitas: [
            'Penjemputan dari rumah (private car)',
            'Check-in Business Class Emirates',
            'Penerbangan Jakarta – Dubai',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Selasa, 07 Juli 2026',
          aktivitas: [
            'Transit Dubai – Emirates Lounge',
            'Penerbangan Dubai – Jeddah',
            'Penjemputan VIP & check-in hotel suite',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Rabu, 08 Juli 2026',
          aktivitas: [
            'Miqat private',
            'Pelaksanaan Umrah (jalur khusus VIP)',
            'Tawaf & Sa\'i',
          ],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Kamis, 09 Juli 2026',
          aktivitas: [
            'Ibadah di Masjidil Haram',
            'Kajian eksklusif bersama ulama',
            'Dinner di restoran hotel',
          ],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Jumat, 10 Juli 2026',
          aktivitas: [
            'Shalat Jumat Masjidil Haram (VIP section)',
            'Free time & ibadah pribadi',
          ],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Sabtu, 11 Juli 2026',
          aktivitas: [
            'Ziarah Mekkah private tour',
            'Jabal Nur & Jabal Rahmah',
            'Arafah & Muzdalifah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Minggu, 12 Juli 2026',
          aktivitas: [
            'Free time ibadah & persiapan',
            'Shopping di Abraj Al-Bait Mall',
          ],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Senin, 13 Juli 2026',
          aktivitas: [
            'Transfer VIP ke Madinah (private van)',
            'Check-in hotel suite Madinah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 9',
          tanggal: 'Selasa, 14 Juli 2026',
          aktivitas: [
            'Masjid Nabawi sesi pagi & malam',
            'Ziarah Raudhah (slot khusus)',
          ],
        ),
        JadwalHari(
          hari: 'Hari 10',
          tanggal: 'Rabu, 15 Juli 2026',
          aktivitas: [
            'Private tour Masjid Quba',
            'Kebun Kurma',
            'Museum Madinah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 11',
          tanggal: 'Kamis, 16 Juli 2026',
          aktivitas: ['Ibadah & free time', 'Farewell dinner eksklusif'],
        ),
        JadwalHari(
          hari: 'Hari 12',
          tanggal: 'Jumat, 17 Juli 2026',
          aktivitas: ['Shalat Jumat Masjid Nabawi', 'Persiapan kepulangan'],
        ),
        JadwalHari(
          hari: 'Hari 13',
          tanggal: 'Sabtu, 18 Juli 2026',
          aktivitas: [
            'Check-out & transfer VIP ke bandara',
            'Penerbangan ke Jakarta via Dubai',
          ],
        ),
        JadwalHari(
          hari: 'Hari 14',
          tanggal: 'Minggu, 19 Juli 2026',
          aktivitas: ['Tiba di Jakarta', 'Penjemputan ke rumah (private car)'],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Raffles Makkah Palace',
          jarak: '0 m (terhubung langsung ke Masjidil Haram)',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1618773928121-c32242e63f39',
            'https://images.unsplash.com/photo-1611892440504-42a792e24d32',
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
            'https://images.unsplash.com/photo-1613490493576-7fde63acd811',
            'https://images.unsplash.com/photo-1643914855986-43e99f9f04c7',
          ],
        ),
        HotelInfo(
          nama: 'Al Safwah Royale Orchid Madinah',
          jarak: '50 m dari Masjid Nabawi',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1619292069270-aa4e62de4b84',
            'https://images.unsplash.com/photo-1616594039964-ae9021a400a0',
            'https://images.unsplash.com/photo-1629140727571-9b5c6f6267b4',
            'https://images.unsplash.com/photo-1598928636135-d146006ff4be',
            'https://images.unsplash.com/photo-1611048267451-e6ed879985cd',
          ],
        ),
      ],
      fasilitas: [
        'Business Class Emirates (PP)',
        'Hotel suite bintang 5 (kamar terbaik)',
        'Private concierge 24 jam',
        'Private van ber-AC seluruh perjalanan',
        'All inclusive (makan, snack, minuman premium)',
        'Pembimbing pribadi (muthawwif khusus)',
        'Souvenir eksklusif & perlengkapan ibadah premium',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan',
        'Vaksin meningitis',
        'KTP & KK',
        'Foto 4x6 background putih',
      ],
    ),
  ),

  Paketumroh(
    id: '5',
    title: 'Umrah Hemat',
    maskapai: 'Lion Air',
    duration: '9 Hari',
    mekkahNights: 'Mekkah 4N',
    madinahNights: 'Madinah 3N',
    transit: 'Jakarta',
    price: 24000000,
    image:
        'https://images.unsplash.com/photo-1590273089302-ebbc53986b6e?q=80&w=758&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // =============================================
    // PAKET 5 - Umrah Hemat (UMH-09HM)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-09HM',
      description:
          'Paket umrah terjangkau tanpa mengurangi kualitas ibadah. Cocok untuk jamaah pertama kali yang ingin menunaikan umrah dengan biaya minimal namun tetap terbimbing.',
      datatravel: [
        'https://images.unsplash.com/photo-1590273089302-ebbc53986b6e?q=80&w=1170',
        'Rezeki Umrah Travel',
        'Izin PPIU No. 7890 Tahun 2022',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=1170',
        'Budi Santoso',
        'Agen Perjalanan Umrah & Haji',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Minggu, 05 April 2026',
          aktivitas: [
            'Kumpul di Bandara Soekarno Hatta',
            'Penerbangan Jakarta – Kuala Lumpur (Lion Air)',
            'Transit KL',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Senin, 06 April 2026',
          aktivitas: [
            'Penerbangan KL – Jeddah',
            'Tiba Jeddah',
            'Menuju Mekkah & check-in',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Selasa, 07 April 2026',
          aktivitas: ['Umrah pertama', 'Tawaf & Sa\'i', 'Tahalul'],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Rabu, 08 April 2026',
          aktivitas: [
            'Ibadah Masjidil Haram sepanjang hari',
            'Ceramah agama malam',
          ],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Kamis, 09 April 2026',
          aktivitas: [
            'Ziarah Mekkah',
            'Jabal Nur',
            'Masjid Jin',
            'Masjid Syajarah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Jumat, 10 April 2026',
          aktivitas: [
            'Shalat Jumat Masjidil Haram',
            'Perjalanan ke Madinah',
            'Check-in hotel',
          ],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Sabtu, 11 April 2026',
          aktivitas: [
            'Shalat berjamaah di Masjid Nabawi',
            'Ziarah Raudhah',
            'Makam Baqi',
          ],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Minggu, 12 April 2026',
          aktivitas: [
            'Masjid Quba',
            'Belanja kurma & oleh-oleh',
            'Persiapan pulang',
          ],
        ),
        JadwalHari(
          hari: 'Hari 9',
          tanggal: 'Senin, 13 April 2026',
          aktivitas: [
            'Check-out',
            'Bandara Madinah',
            'Penerbangan via KL – Jakarta',
          ],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Al Massa Hotel Mekkah',
          jarak: '1.2 km dari Masjidil Haram',
          rating: '3',
          images: [
            'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3',
            'https://images.unsplash.com/photo-1551632811-561732d1e306',
            'https://images.unsplash.com/photo-1481277542470-605612bd2d61',
            'https://images.unsplash.com/photo-1541123437800-1bb1317badc2',
            'https://images.unsplash.com/photo-1467987506553-8f3916508521',
          ],
        ),
        HotelInfo(
          nama: 'Al Ansar Hotel Madinah',
          jarak: '900 m dari Masjid Nabawi',
          rating: '3',
          images: [
            'https://images.unsplash.com/photo-1515362778563-6a8d0e44bc0b',
            'https://images.unsplash.com/photo-1505692952047-1a78307da8f2',
            'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd',
            'https://images.unsplash.com/photo-1493809842364-78817add7ffb',
            'https://images.unsplash.com/photo-1499696010180-025ef6e1a8f9',
          ],
        ),
      ],
      fasilitas: [
        'Hotel bintang 3 Mekkah & Madinah',
        'Makan 3x sehari (menu Indonesia)',
        'Transport bus bersama',
        'Ziarah Mekkah & Madinah',
        'Pembimbing grup (1:25)',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan',
        'Vaksin meningitis',
        'KTP & KK',
        'Foto 4x6 background putih',
      ],
    ),
  ),

  Paketumroh(
    id: '6',
    title: 'Umrah Syawal',
    maskapai: 'Qatar Airways',
    duration: '11 Hari',
    mekkahNights: 'Mekkah 5N',
    madinahNights: 'Madinah 4N',
    transit: 'Doha',
    price: 36000000,
    image:
        'https://images.unsplash.com/photo-1519817650390-64a93db51149?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9zcXVlfGVufDB8fDB8fHww',
    // =============================================
    // PAKET 6 - Umrah Syawal (UMH-11SW)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-11SW',
      description:
          'Paket umrah di bulan Syawal, setara pahala haji bagi yang langsung menunaikan setelah Ramadhan. Nikmati suasana Tanah Suci pasca Lebaran yang lebih tenang dan khusyuk.',
      datatravel: [
        'https://images.unsplash.com/photo-1519817650390-64a93db51149?q=80&w=1170',
        'Safina Wisata Islami',
        'Izin PPIU No. 1122 Tahun 2020',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1170',
        'Siti Nurhaliza',
        'Konsultan Haji & Umrah',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Kamis, 09 April 2026',
          aktivitas: [
            'Keberangkatan dari Jakarta',
            'Penerbangan via Qatar Airways',
            'Transit Doha',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Jumat, 10 April 2026',
          aktivitas: [
            'Tiba di Jeddah',
            'Menuju Madinah',
            'Check-in hotel & istirahat',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Sabtu, 11 April 2026',
          aktivitas: [
            'Masjid Nabawi (Shalat 40 waktu)',
            'Ziarah Raudhah pagi hari',
            'Ibadah sunnah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Minggu, 12 April 2026',
          aktivitas: [
            'Ziarah Madinah',
            'Masjid Quba',
            'Makam Baqi',
            'Pasar Kurma',
          ],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Senin, 13 April 2026',
          aktivitas: [
            'Free ibadah Masjid Nabawi',
            'Persiapan pindah ke Mekkah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Selasa, 14 April 2026',
          aktivitas: [
            'Perjalanan ke Mekkah',
            'Miqat di Bir Ali',
            'Check-in hotel & miqat ihram',
          ],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Rabu, 15 April 2026',
          aktivitas: [
            'Pelaksanaan Umrah Syawal',
            'Tawaf & Sa\'i malam hari',
            'Tahalul',
          ],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Kamis, 16 April 2026',
          aktivitas: [
            'Ibadah Masjidil Haram (pahala 100.000x)',
            'Kajian bersama ustadz',
          ],
        ),
        JadwalHari(
          hari: 'Hari 9',
          tanggal: 'Jumat, 17 April 2026',
          aktivitas: [
            'Shalat Jumat di Masjidil Haram',
            'Ziarah Mekkah',
            'Belanja oleh-oleh',
          ],
        ),
        JadwalHari(
          hari: 'Hari 10',
          tanggal: 'Sabtu, 18 April 2026',
          aktivitas: ['Free time', 'Thawaf sunnah', 'Persiapan kepulangan'],
        ),
        JadwalHari(
          hari: 'Hari 11',
          tanggal: 'Minggu, 19 April 2026',
          aktivitas: [
            'Check-out',
            'Menuju bandara Jeddah',
            'Return ke Indonesia via Doha',
          ],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Movenpick Hotel Madinah',
          jarak: '250 m dari Masjid Nabawi',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1414235077428-338989a2e8c0',
            'https://images.unsplash.com/photo-1584132915807-fd1f5fbc078f',
            'https://images.unsplash.com/photo-1543968996-ee822b8176ba',
            'https://images.unsplash.com/photo-1540518614846-7eded433c457',
            'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af',
          ],
        ),
        HotelInfo(
          nama: 'Grand Zam Zam Hotel Mekkah',
          jarak: '400 m dari Masjidil Haram',
          rating: '4',
          images: [
            'https://images.unsplash.com/photo-1445019980597-93fa8acb246c',
            'https://images.unsplash.com/photo-1506059612708-99d6c258160e',
            'https://images.unsplash.com/photo-1533090368676-1fd25485db88',
            'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a',
            'https://images.unsplash.com/photo-1531088009183-5ff5b7c5acbd',
          ],
        ),
      ],
      fasilitas: [
        'Hotel bintang 4-5 Madinah & Mekkah',
        'Makan 3x sehari',
        'Transport AC eksklusif',
        'Ziarah Madinah & Mekkah',
        'Kajian khusus umrah Syawal',
        'Sertifikat umrah Syawal',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan',
        'Vaksin meningitis',
        'KTP & KK',
        'Foto 4x6 background putih',
      ],
    ),
  ),

  Paketumroh(
    id: '7',
    title: 'Umrah Akhir Tahun',
    maskapai: 'Etihad Airways',
    duration: '13 Hari',
    mekkahNights: 'Mekkah 6N',
    madinahNights: 'Madinah 4N',
    transit: 'Abu Dhabi',
    price: 39000000,
    image:
        'https://images.unsplash.com/photo-1590075865003-e48277faa558?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // =============================================
    // PAKET 7 - Umrah Akhir Tahun (UMH-13AK)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-13AK',
      description:
          'Tutup tahun dengan ibadah bermakna di Tanah Suci. Paket umrah akhir tahun dengan suasana spesial menyambut tahun baru di Mekkah dan Madinah.',
      datatravel: [
        'https://images.unsplash.com/photo-1590075865003-e48277faa558?q=80&w=1170',
        'Nusantara Umrah Tour',
        'Izin PPIU No. 4455 Tahun 2019',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?q=80&w=1170',
        'Rizky Ardiansyah',
        'Tour Leader & Pembimbing Ibadah',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Senin, 21 Desember 2026',
          aktivitas: [
            'Keberangkatan Jakarta',
            'Penerbangan via Etihad – Abu Dhabi',
            'Transit Abu Dhabi',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Selasa, 22 Desember 2026',
          aktivitas: [
            'Penerbangan Abu Dhabi – Madinah',
            'Tiba & check-in hotel',
            'Ibadah Masjid Nabawi malam',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Rabu, 23 Desember 2026',
          aktivitas: [
            'Ibadah Masjid Nabawi',
            'Raudhah visit pagi',
            'Ziarah makam Nabi & Baqi',
          ],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Kamis, 24 Desember 2026',
          aktivitas: [
            'Masjid Quba',
            'Masjid Qiblatain',
            'Kebun Kurma & belanja',
          ],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Jumat, 25 Desember 2026',
          aktivitas: [
            'Shalat Jumat Masjid Nabawi',
            'Free time',
            'Persiapan ke Mekkah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Sabtu, 26 Desember 2026',
          aktivitas: [
            'Perjalanan Madinah – Mekkah',
            'Miqat',
            'Check-in hotel Mekkah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Minggu, 27 Desember 2026',
          aktivitas: ['Pelaksanaan Umrah', 'Tawaf & Sa\'i', 'Tahalul'],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Senin, 28 Desember 2026',
          aktivitas: [
            'Ibadah Masjidil Haram',
            'Ziarah Mekkah: Jabal Nur, Tsur',
          ],
        ),
        JadwalHari(
          hari: 'Hari 9',
          tanggal: 'Selasa, 29 Desember 2026',
          aktivitas: ['Free ibadah', 'Thawaf sunnah', 'Belanja oleh-oleh'],
        ),
        JadwalHari(
          hari: 'Hari 10',
          tanggal: 'Rabu, 30 Desember 2026',
          aktivitas: [
            'Ibadah khusyuk menyambut tahun baru Islam & Masehi',
            'Doa bersama',
          ],
        ),
        JadwalHari(
          hari: 'Hari 11',
          tanggal: 'Kamis, 31 Desember 2026',
          aktivitas: ['Thawaf wada\'', 'Perjalanan ke bandara Jeddah'],
        ),
        JadwalHari(
          hari: 'Hari 12',
          tanggal: 'Jumat, 01 Januari 2027',
          aktivitas: ['Penerbangan ke Jakarta via Abu Dhabi', 'Tiba Jakarta'],
        ),
        JadwalHari(
          hari: 'Hari 13',
          tanggal: 'Sabtu, 02 Januari 2027',
          aktivitas: ['Tiba di tanah air', 'Sambutan keluarga & syukuran'],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Elaf Taibah Hotel Madinah',
          jarak: '350 m dari Masjid Nabawi',
          rating: '4',
          images: [
            'https://images.unsplash.com/photo-1455587734955-081b22074882',
            'https://images.unsplash.com/photo-1464146072230-91cabc968266',
            'https://images.unsplash.com/photo-1519974719765-e6559eac2575',
            'https://images.unsplash.com/photo-1498503182468-3b51cbb6cb24',
            'https://images.unsplash.com/photo-1504280390367-361c6d9f38f4',
          ],
        ),
        HotelInfo(
          nama: 'Conrad Mekkah',
          jarak: '700 m dari Masjidil Haram',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1444201983204-c43cbd584d93',
            'https://images.unsplash.com/photo-1445019980597-93fa8acb246c',
            'https://images.unsplash.com/photo-1488872773522-4661eea94c57',
            'https://images.unsplash.com/photo-1445019980597-93fa8acb246c',
            'https://images.unsplash.com/photo-1462730461406-89cd1fe9a114',
          ],
        ),
      ],
      fasilitas: [
        'Hotel bintang 4-5 Madinah & Mekkah',
        'Makan 3x sehari (menu spesial akhir tahun)',
        'Transport AC eksklusif',
        'Ziarah lengkap Madinah & Mekkah',
        'Acara doa bersama menyambut tahun baru',
        'Souvenir khas akhir tahun',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan',
        'Vaksin meningitis',
        'KTP & KK',
        'Foto 4x6 background putih',
      ],
    ),
  ),

  Paketumroh(
    id: '8',
    title: 'Umrah Backpacker',
    maskapai: 'AirAsia',
    duration: '8 Hari',
    mekkahNights: 'Mekkah 3N',
    madinahNights: 'Madinah 3N',
    transit: 'Kuala Lumpur',
    price: 22000000,
    image:
        'https://images.unsplash.com/photo-1519818187420-8e49de7adeef?q=80&w=627&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // =============================================
    // PAKET 8 - Umrah Backpacker (UMH-08BP)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-08BP',
      description:
          'Umrah efisien untuk jiwa muda dan petualang. Paket ringkas 8 hari dengan harga paling terjangkau, cocok untuk solo traveler atau jamaah muda yang ingin pengalaman ibadah mandiri.',
      datatravel: [
        'https://images.unsplash.com/photo-1519818187420-8e49de7adeef?q=80&w=1170',
        'Muda Berumrah Travel',
        'Izin PPIU No. 6677 Tahun 2023',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1170',
        'Dimas Prasetyo',
        'Youth Travel Consultant',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Sabtu, 02 Mei 2026',
          aktivitas: [
            'Keberangkatan Jakarta – KL (AirAsia)',
            'Transit & penerbangan KL – Jeddah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Minggu, 03 Mei 2026',
          aktivitas: [
            'Tiba Jeddah dini hari',
            'Menuju Mekkah',
            'Langsung miqat & umrah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Senin, 04 Mei 2026',
          aktivitas: [
            'Ibadah Masjidil Haram sepanjang hari',
            'Eksplorasi area sekitar Haram',
          ],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Selasa, 05 Mei 2026',
          aktivitas: [
            'Ziarah mandiri Mekkah',
            'Jabal Nur',
            'Jabal Rahmah',
            'Tan\'im',
          ],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Rabu, 06 Mei 2026',
          aktivitas: [
            'Perjalanan Mekkah – Madinah (bus umum)',
            'Check-in & ibadah Masjid Nabawi',
          ],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Kamis, 07 Mei 2026',
          aktivitas: [
            'Raudhah visit',
            'Masjid Quba (jalan kaki)',
            'Pasar Hurra',
          ],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Jumat, 08 Mei 2026',
          aktivitas: [
            'Shalat Jumat Masjid Nabawi',
            'Belanja oleh-oleh pasar murah',
            'Persiapan pulang',
          ],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Sabtu, 09 Mei 2026',
          aktivitas: [
            'Check-out',
            'Bandara Madinah',
            'Penerbangan balik via KL – Jakarta',
          ],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Al Bait Al Aqeeq Mekkah',
          jarak: '1.5 km dari Masjidil Haram',
          rating: '3',
          images: [
            'https://images.unsplash.com/photo-1501117716987-c8e1ecb2103a',
            'https://images.unsplash.com/photo-1486325212027-8081e485255e',
            'https://images.unsplash.com/photo-1445019980597-93fa8acb246c',
            'https://images.unsplash.com/photo-1520637836862-4d197d17c93a',
            'https://images.unsplash.com/photo-1484154218962-a197022b5858',
          ],
        ),
        HotelInfo(
          nama: 'Rose Garden Hotel Madinah',
          jarak: '1 km dari Masjid Nabawi',
          rating: '3',
          images: [
            'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688',
            'https://images.unsplash.com/photo-1507652313519-d4e9174996dd',
            'https://images.unsplash.com/photo-1554995207-c18c203602cb',
            'https://images.unsplash.com/photo-1489171078254-c3365d6e359f',
            'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
          ],
        ),
      ],
      fasilitas: [
        'Hotel bintang 3 Mekkah & Madinah',
        'Sarapan & makan malam (2x sehari)',
        'Transport bus reguler',
        'Peta & panduan ziarah mandiri',
        'WhatsApp group support 24 jam',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan',
        'Vaksin meningitis',
        'KTP & KK',
        'Foto 4x6 background putih',
        'Usia min. 18 tahun (diutamakan)',
      ],
    ),
  ),

  Paketumroh(
    id: '9',
    title: 'Umrah Plus Aqsa',
    maskapai: 'Royal Jordanian',
    duration: '15 Hari',
    mekkahNights: 'Mekkah 5N',
    madinahNights: 'Madinah 4N',
    transit: 'Amman',
    price: 52000000,
    image:
        'https://images.unsplash.com/photo-1758458045183-7e7c453a0580?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // =============================================
    // PAKET 9 - Umrah Plus Aqsa (UMH-15AQ)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-15AQ',
      description:
          'Paket umrah paling komprehensif: Masjidil Haram, Masjid Nabawi, dan Masjidil Aqsa dalam satu perjalanan suci. Lengkapi ibadah di tiga masjid paling mulia dalam Islam.',
      datatravel: [
        'https://images.unsplash.com/photo-1758458045183-7e7c453a0580?q=80&w=1170',
        'Al-Quds Wisata Islami',
        'Izin PPIU No. 8899 Tahun 2017',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1170',
        'Ummu Kultsum',
        'Spesialis Paket Tiga Masjid',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Rabu, 08 Juli 2026',
          aktivitas: [
            'Keberangkatan Jakarta',
            'Penerbangan via Royal Jordanian',
            'Transit Amman',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Kamis, 09 Juli 2026',
          aktivitas: [
            'Tiba Amman, Yordania',
            'Check-in hotel',
            'City tour Amman singkat',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Jumat, 10 Juli 2026',
          aktivitas: [
            'Perjalanan Amman – Yerusalem',
            'Masuk komplek Masjidil Aqsa',
            'Shalat di Masjidil Aqsa',
          ],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Sabtu, 11 Juli 2026',
          aktivitas: [
            'Ibadah & ziarah Masjidil Aqsa',
            'Dome of the Rock',
            'Old City Jerusalem',
          ],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Minggu, 12 Juli 2026',
          aktivitas: [
            'Hebron – Masjid Ibrahim',
            'Bethlehem',
            'Kembali ke Amman',
          ],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Senin, 13 Juli 2026',
          aktivitas: [
            'Penerbangan Amman – Jeddah',
            'Menuju Madinah',
            'Check-in hotel',
          ],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Selasa, 14 Juli 2026',
          aktivitas: ['Masjid Nabawi', 'Raudhah visit', 'Makam Nabi & Baqi'],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Rabu, 15 Juli 2026',
          aktivitas: ['Masjid Quba', 'Masjid Qiblatain', 'Jabal Uhud'],
        ),
        JadwalHari(
          hari: 'Hari 9',
          tanggal: 'Kamis, 16 Juli 2026',
          aktivitas: ['Free ibadah Masjid Nabawi', 'Belanja kurma & oleh-oleh'],
        ),
        JadwalHari(
          hari: 'Hari 10',
          tanggal: 'Jumat, 17 Juli 2026',
          aktivitas: [
            'Perjalanan Madinah – Mekkah',
            'Miqat',
            'Check-in hotel Mekkah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 11',
          tanggal: 'Sabtu, 18 Juli 2026',
          aktivitas: [
            'Pelaksanaan Umrah',
            'Tawaf & Sa\'i malam hari',
            'Tahalul',
          ],
        ),
        JadwalHari(
          hari: 'Hari 12',
          tanggal: 'Minggu, 19 Juli 2026',
          aktivitas: [
            'Ibadah Masjidil Haram',
            'Ziarah Mekkah: Jabal Nur, Tsur, Rahmah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 13',
          tanggal: 'Senin, 20 Juli 2026',
          aktivitas: ['Thawaf sunnah', 'Belanja souvenir', 'Persiapan pulang'],
        ),
        JadwalHari(
          hari: 'Hari 14',
          tanggal: 'Selasa, 21 Juli 2026',
          aktivitas: [
            'Thawaf wada\'',
            'Menuju Jeddah',
            'Penerbangan ke Jakarta via Amman',
          ],
        ),
        JadwalHari(
          hari: 'Hari 15',
          tanggal: 'Rabu, 22 Juli 2026',
          aktivitas: ['Tiba di Jakarta', 'Alhamdulillah – Mabrur!'],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Kempinski Hotel Amman',
          jarak: 'Pusat kota Amman',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1587213811864-ef90d89b5f5d',
            'https://images.unsplash.com/photo-1560448204-603b3fc33ddc',
            'https://images.unsplash.com/photo-1445019980597-93fa8acb246c',
            'https://images.unsplash.com/photo-1568495248636-6432b97bd949',
            'https://images.unsplash.com/photo-1558618666-fcd25c85cd64',
          ],
        ),
        HotelInfo(
          nama: 'Oberoi Madinah',
          jarak: '100 m dari Masjid Nabawi',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1551918120-9739cb430c6d',
            'https://images.unsplash.com/photo-1563911302283-d2bc129e7570',
            'https://images.unsplash.com/photo-1560185007-cde436f6a4d0',
            'https://images.unsplash.com/photo-1586105251261-72a756497a11',
            'https://images.unsplash.com/photo-1611048267451-e6ed879985cd',
          ],
        ),
        HotelInfo(
          nama: 'Fairmont Mekkah Clock Royal Tower',
          jarak: '0 m (dalam kompleks Abraj Al-Bait)',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1592229505726-ca121723b8ef',
            'https://images.unsplash.com/photo-1549294413-26f195200c16',
            'https://images.unsplash.com/photo-1566073771259-6a8506099945',
            'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9',
            'https://images.unsplash.com/photo-1578683010236-d716f9a3f461',
          ],
        ),
      ],
      fasilitas: [
        'Hotel bintang 5 di 3 negara (Yordania, Arab Saudi)',
        'Makan 3x sehari full board',
        'Visa Yordania & Arab Saudi',
        'Transport AC eksklusif antar negara',
        'Guide khusus Palestina/Yerusalem',
        'Pembimbing umrah berpengalaman',
        'Asuransi perjalanan internasional',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan',
        'Vaksin meningitis',
        'KTP & KK',
        'Foto 4x6 background putih',
        'Surat izin suami/wali (untuk wanita di bawah 45 tahun)',
        'Dokumen pendukung visa Yordania',
      ],
    ),
  ),

  Paketumroh(
    id: '10',
    title: 'Umrah Keluarga',
    maskapai: 'Garuda Indonesia',
    duration: '10 Hari',
    mekkahNights: 'Mekkah 5N',
    madinahNights: 'Madinah 3N',
    transit: 'Jeddah',
    price: 30000000,
    image:
        'https://images.pexels.com/photos/35332420/pexels-photo-35332420.jpeg',
    // =============================================
    // PAKET 10 - Umrah Keluarga (UMH-10KL)
    // =============================================
    detailpaketumroh: Detailpaketumroh(
      codepaket: 'UMH-10KL',
      description:
          'Paket umrah dirancang khusus untuk keluarga. Kamar family room, fasilitas ramah anak, dan jadwal ibadah yang fleksibel agar seluruh anggota keluarga bisa beribadah dengan nyaman dan bermakna.',
      datatravel: [
        'https://images.unsplash.com/photo-1511091734515-e50d46c37240?q=80&w=1170',
        'Barakah Family Travel',
        'Izin PPIU No. 2233 Tahun 2021',
      ],
      dataagen: [
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?q=80&w=1170',
        'Ummi Rahayu',
        'Konsultan Umrah Keluarga & Anak',
      ],
      jadwal: [
        JadwalHari(
          hari: 'Hari 1',
          tanggal: 'Senin, 15 Juni 2026',
          aktivitas: [
            'Kumpul di bandara bersama keluarga',
            'Boarding family priority (Garuda Indonesia)',
            'Penerbangan Jakarta – Jeddah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 2',
          tanggal: 'Selasa, 16 Juni 2026',
          aktivitas: [
            'Tiba Jeddah',
            'Menuju Madinah',
            'Check-in family room & istirahat',
          ],
        ),
        JadwalHari(
          hari: 'Hari 3',
          tanggal: 'Rabu, 17 Juni 2026',
          aktivitas: [
            'Shalat berjamaah di Masjid Nabawi',
            'Edukasi sejarah Nabi untuk anak',
            'Raudhah (dewasa & anak terpisah)',
          ],
        ),
        JadwalHari(
          hari: 'Hari 4',
          tanggal: 'Kamis, 18 Juni 2026',
          aktivitas: [
            'Ziarah keluarga: Masjid Quba & Kebun Kurma',
            'Makan bersama keluarga',
            'Istirahat & bermain (anak-anak)',
          ],
        ),
        JadwalHari(
          hari: 'Hari 5',
          tanggal: 'Jumat, 19 Juni 2026',
          aktivitas: [
            'Shalat Jumat Masjid Nabawi (keluarga)',
            'Perjalanan ke Mekkah',
            'Check-in hotel Mekkah',
          ],
        ),
        JadwalHari(
          hari: 'Hari 6',
          tanggal: 'Sabtu, 20 Juni 2026',
          aktivitas: [
            'Miqat & persiapan ihram bersama keluarga',
            'Pelaksanaan Umrah keluarga',
            'Tawaf & Sa\'i bersama',
          ],
        ),
        JadwalHari(
          hari: 'Hari 7',
          tanggal: 'Minggu, 21 Juni 2026',
          aktivitas: [
            'Ibadah Masjidil Haram bersama keluarga',
            'Edukasi anak: mengenal Ka\'bah & sejarah Islam',
          ],
        ),
        JadwalHari(
          hari: 'Hari 8',
          tanggal: 'Senin, 22 Juni 2026',
          aktivitas: [
            'Ziarah keluarga: Jabal Nur',
            'Abraj Al-Bait Mall (belanja & istirahat)',
            'Makan malam keluarga',
          ],
        ),
        JadwalHari(
          hari: 'Hari 9',
          tanggal: 'Selasa, 23 Juni 2026',
          aktivitas: [
            'Free time keluarga',
            'Thawaf sunnah',
            'Persiapan oleh-oleh',
          ],
        ),
        JadwalHari(
          hari: 'Hari 10',
          tanggal: 'Rabu, 24 Juni 2026',
          aktivitas: [
            'Thawaf wada\' bersama keluarga',
            'Menuju bandara Jeddah',
            'Penerbangan pulang ke Indonesia',
          ],
        ),
      ],
      hotel: [
        HotelInfo(
          nama: 'Doubletree by Hilton Madinah',
          jarak: '500 m dari Masjid Nabawi',
          rating: '4',
          images: [
            'https://images.unsplash.com/photo-1561501900-3701fa6a0864',
            'https://images.unsplash.com/photo-1598928506311-c55ded91a20c',
            'https://images.unsplash.com/photo-1611048267451-e6ed879985cd',
            'https://images.unsplash.com/photo-1590490359683-658d3d23f972',
            'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00',
          ],
        ),
        HotelInfo(
          nama: 'Marriott Hotel Mekkah',
          jarak: '900 m dari Masjidil Haram',
          rating: '5',
          images: [
            'https://images.unsplash.com/photo-1603034203013-d532350372c4',
            'https://images.unsplash.com/photo-1609766857585-b3929a9c39bd',
            'https://images.unsplash.com/photo-1596436889106-be35e843f974',
            'https://images.unsplash.com/photo-1574643156929-51fa098b0394',
            'https://images.unsplash.com/photo-1560347876-aeef00ee58a1',
          ],
        ),
      ],
      fasilitas: [
        'Kamar family room (connecting room)',
        'Makan 3x sehari (menu anak tersedia)',
        'Transport bus family friendly',
        'Stroller & kursi roda tersedia',
        'Pembimbing khusus edukasi anak',
        'Ziarah Madinah & Mekkah',
        'Dokumen anak diurus oleh travel',
      ],
      persyaratan: [
        'Paspor aktif min. 6 bulan (termasuk anak)',
        'Vaksin meningitis (dewasa & anak ≥2 tahun)',
        'KTP, KK & Akta Kelahiran anak',
        'Foto 4x6 background putih',
        'Buku nikah (untuk pasangan)',
      ],
    ),
  ),
];
