class Detailitinerary {
  String title;
  String waktu;
  String hari;
  final List<String> isi;

  Detailitinerary({
    required this.title,
    required this.waktu,
    required this.hari,
    required this.isi,
  });
}

final List<Detailitinerary> dataItinerary = [
  Detailitinerary(
    title: "Berangkat dari Indonesia",
    waktu: "12 Okt 2026",
    hari: "1",
    isi: [
      "Berkumpul di Bandara Soekarno Hatta",
      "Proses check-in dan bagasi",
      "Penerbangan menuju Jeddah",
      "Tiba di Jeddah, proses imigrasi",
      "Menuju hotel di Makkah",
    ],
  ),

  Detailitinerary(
    title: "Ibadah Umroh Pertama",
    waktu: "13 Okt 2026",
    hari: "2",
    isi: [
      "Persiapan ihram di hotel",
      "Menuju Masjidil Haram",
      "Pelaksanaan thawaf",
      "Sa’i dari Shafa ke Marwah",
      "Tahallul",
    ],
  ),

  Detailitinerary(
    title: "Ziarah Kota Makkah",
    waktu: "14 Okt 2026",
    hari: "3",
    isi: [
      "Kunjungan Jabal Rahmah",
      "Mina dan Arafah",
      "Jabal Tsur",
      "Masjid Ji’ronah",
      "Kembali ke hotel",
    ],
  ),

  Detailitinerary(
    title: "Ibadah di Masjidil Haram",
    waktu: "15 Okt 2026",
    hari: "4",
    isi: [
      "Sholat berjamaah di Masjidil Haram",
      "Tawaf sunnah",
      "Tadarus Al-Qur’an",
      "Istirahat dan persiapan perjalanan",
    ],
  ),

  Detailitinerary(
    title: "Perjalanan ke Madinah",
    waktu: "16 Okt 2026",
    hari: "5",
    isi: [
      "Check-out hotel Makkah",
      "Perjalanan menuju Madinah",
      "Singgah di Bir Ali (miqat)",
      "Tiba di Madinah",
      "Check-in hotel Madinah",
    ],
  ),

  Detailitinerary(
    title: "Ziarah Madinah",
    waktu: "17 Okt 2026",
    hari: "6",
    isi: [
      "Masjid Nabawi",
      "Raudhah (jika memungkinkan)",
      "Makam Rasulullah SAW",
      "Jabal Uhud",
      "Perkebunan Kurma",
    ],
  ),

  Detailitinerary(
    title: "Ibadah di Madinah",
    waktu: "18 Okt 2026",
    hari: "7",
    isi: [
      "Sholat di Masjid Nabawi",
      "Dzikrullah dan tadarus",
      "Kegiatan bebas jamaah",
      "Persiapan pulang",
    ],
  ),

  Detailitinerary(
    title: "Persiapan Kepulangan",
    waktu: "19 Okt 2026",
    hari: "8",
    isi: [
      "Packing barang",
      "Check-out hotel Madinah",
      "Menuju Bandara Madinah",
      "Proses check-in penerbangan",
    ],
  ),

  Detailitinerary(
    title: "Kembali ke Indonesia",
    waktu: "20 Okt 2026",
    hari: "9",
    isi: [
      "Penerbangan menuju Indonesia",
      "Transit (jika ada)",
      "Tiba di Bandara Soekarno Hatta",
      "Penyambutan jamaah",
    ],
  ),
];