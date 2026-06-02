class Lokasimodel {
  final String linkImg;
  final String name;
  final String lokasi;
  final String tempat;
  final String deskripsi;
  final String jarak;
  final String waktutempuh;
  final String area;
  final String koordinat;

  Lokasimodel({
    required this.linkImg,
    required this.name,
    required this.lokasi,
    required this.tempat,
    required this.deskripsi,
    required this.jarak,
    required this.waktutempuh,
    required this.area,
    required this.koordinat,
  });
}

final List<Lokasimodel> dataLokasi = [
  Lokasimodel(
    linkImg: "https://images.unsplash.com/photo-1592326871020-04f58c1a52f3",
    name: "Masjidil Haram",
    lokasi: "Mekkah",
    tempat: "Tempat Ibadah",
    deskripsi:
        "Masjidil Haram adalah masjid terbesar di dunia dan menjadi pusat ibadah umat Islam. Di dalamnya terdapat Ka'bah yang menjadi kiblat shalat bagi seluruh umat Islam.\n\nTempat ini selalu ramai oleh jamaah dari seluruh dunia yang melaksanakan ibadah haji maupun umrah.",
    jarak: "100 m",
    waktutempuh: "1 - 4 menit",
    area: "Masjid",
    koordinat: "-21.4225, 39.8262",
  ),

  Lokasimodel(
    linkImg:
        "https://images.unsplash.com/photo-1572358899655-f63ece97bfa5?q=80&w=736&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "Masjid Nabawi",
    lokasi: "Madinah",
    tempat: "Tempat Ibadah",
    deskripsi:
        "Masjid Nabawi merupakan masjid yang dibangun oleh Nabi Muhammad SAW dan menjadi salah satu tempat suci bagi umat Islam.\n\nDi dalamnya terdapat Raudhah yang menjadi tempat mustajab untuk berdoa.",
    jarak: "500 m",
    waktutempuh: "7 - 10 menit",
    area: "Masjid",
    koordinat: "24.4672, 39.6111",
  ),
  
  Lokasimodel(
    linkImg:
        "https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "Bandara King Abdulaziz",
    lokasi: "Jeddah",
    tempat: "Bandara",
    deskripsi:
        "Bandara Internasional King Abdulaziz merupakan pintu masuk utama bagi jamaah umrah dan haji yang tiba di Jeddah.\n\nBandara ini memiliki fasilitas modern seperti lounge, area imigrasi khusus jamaah, serta berbagai layanan transportasi menuju Mekkah dan Madinah.\n\nLokasinya strategis dan menjadi transit utama sebelum melanjutkan perjalanan ibadah.",
    jarak: "50 m",
    waktutempuh: "60 - 90 menit",
    area: "Bandara",
    koordinat: "21.6702, 39.1525",
  ),

  Lokasimodel(
    linkImg: "https://plus.unsplash.com/premium_photo-1699535659313-c95cf8111235?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "Jabal Rahmah",
    lokasi: "Arafah",
    tempat: "Wisata Religi",
    deskripsi:
        "Jabal Rahmah adalah bukit tempat bertemunya Nabi Adam dan Hawa.\n\nTempat ini menjadi salah satu destinasi ziarah favorit jamaah umrah dan haji.",
    jarak: "20 km",
    waktutempuh: "30 - 45 menit",
    area: "Gunung",
    koordinat: "-21.3556, 39.9842",
  ),

  Lokasimodel(
    linkImg: "https://plus.unsplash.com/premium_photo-1697729678357-1de9edfce6db?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    name: "Gua Hira",
    lokasi: "Mekkah",
    tempat: "Sejarah Islam",
    deskripsi:
        "Gua Hira adalah tempat Nabi Muhammad SAW menerima wahyu pertama.\n\nTerletak di Jabal Nur dan membutuhkan perjalanan mendaki untuk mencapainya.",
    jarak: "6 km",
    waktutempuh: "20 menit + mendaki",
    area: "Gunung",
    koordinat: "-21.4583, 39.8579",
  ),
];
