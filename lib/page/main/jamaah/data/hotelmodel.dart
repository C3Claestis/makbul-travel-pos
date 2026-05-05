class Hotelmodel {
  final String linkImg;
  final String hotelname;
  final String location;
  final String jarak;
  final String rating;
  final String reviewer;
  final int price;
  final String description;

  Hotelmodel({
    required this.linkImg,
    required this.hotelname,
    required this.location,
    required this.jarak,
    required this.rating,
    required this.reviewer,
    required this.price,
    required this.description,
  });
}

final List<Hotelmodel> dataHotel = [
  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1690314749019-2754cc7bfac9?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Swissotel Makkah",
    location: "Mekkah",
    jarak: "50 m dari Masjidil Haram",
    rating: "4.8",
    reviewer: "12.5k",
    price: 850,
    description:
        "Hotel ini menawarkan pengalaman menginap yang sangat dekat dengan Masjidil Haram sehingga memudahkan jamaah dalam beribadah setiap waktu. Dengan akses langsung ke area utama, hotel ini menjadi pilihan favorit bagi banyak tamu.\n\nFasilitas yang tersedia sangat lengkap mulai dari restoran internasional, layanan kamar 24 jam, hingga ruang istirahat yang nyaman. Setiap kamar dirancang modern dengan sentuhan elegan untuk memberikan kenyamanan maksimal.\n\nSelain itu, staf hotel dikenal ramah dan responsif dalam membantu kebutuhan tamu. Lokasinya yang strategis membuat hotel ini cocok untuk perjalanan ibadah maupun keluarga.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1549875648-357fef68fec7?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Pullman ZamZam Makkah",
    location: "Mekkah",
    jarak: "100 m dari Masjidil Haram",
    rating: "4.7",
    reviewer: "10.2k",
    price: 720,
    description:
        "Hotel ini berada di kawasan premium dengan akses mudah menuju Masjidil Haram. Banyak jamaah memilih hotel ini karena kenyamanan dan kedekatannya dengan pusat ibadah.\n\nInterior hotel didesain mewah dengan fasilitas lengkap seperti restoran, lounge, dan pusat layanan tamu. Kamar-kamarnya luas dan bersih sehingga cocok untuk keluarga.\n\nPelayanan hotel sangat profesional dengan staf yang siap membantu kapan saja. Pengalaman menginap di sini memberikan kenyamanan maksimal selama beribadah.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1518873247959-ccfbaecd34d9?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Hilton Suites Makkah",
    location: "Mekkah",
    jarak: "150 m dari Masjidil Haram",
    rating: "4.9",
    reviewer: "15.3k",
    price: 930,
    description:
        "Hotel ini menghadirkan konsep suite modern dengan pemandangan kota suci yang indah. Lokasinya sangat strategis untuk jamaah yang ingin akses cepat ke Masjidil Haram.\n\nFasilitas premium seperti restoran internasional, ruang keluarga, dan layanan concierge tersedia untuk kenyamanan tamu. Setiap kamar dirancang luas dan elegan.\n\nDengan pelayanan kelas atas dan lokasi terbaik, hotel ini menjadi pilihan ideal untuk perjalanan ibadah yang nyaman.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1599722585837-c1cb8eea32ff?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Anwar Al Madinah Mövenpick",
    location: "Madinah",
    jarak: "50 m dari Masjid Nabawi",
    rating: "4.8",
    reviewer: "11.7k",
    price: 680,
    description:
        "Hotel ini terletak sangat dekat dengan Masjid Nabawi sehingga memudahkan jamaah dalam beribadah. Lokasinya menjadi salah satu keunggulan utama.\n\nFasilitas lengkap seperti restoran, pusat perbelanjaan, dan layanan kamar tersedia untuk kenyamanan tamu. Interior hotel terasa hangat dan elegan.\n\nStaf hotel memberikan pelayanan terbaik sehingga pengalaman menginap menjadi lebih menyenangkan dan berkesan.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1528266542126-d64713949918?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Pullman ZamZam Madinah",
    location: "Madinah",
    jarak: "100 m dari Masjid Nabawi",
    rating: "4.7",
    reviewer: "9.8k",
    price: 650,
    description:
        "Hotel ini menawarkan kenyamanan dengan lokasi strategis dekat Masjid Nabawi. Banyak jamaah memilih hotel ini karena aksesnya yang mudah.\n\nFasilitas modern tersedia termasuk restoran dan ruang santai yang nyaman. Kamar dirancang dengan desain minimalis elegan.\n\nPelayanan staf yang ramah menjadikan pengalaman menginap lebih menyenangkan dan tenang.",
  ),

  Hotelmodel(
    linkImg: "https://plus.unsplash.com/premium_photo-1681429766562-fffa63d382c2?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Dar Al Taqwa Hotel",
    location: "Jeddah",
    jarak: "30 m dari Masjid Nabawi",
    rating: "4.9",
    reviewer: "13.1k",
    price: 900,
    description:
        "Hotel ini dikenal sebagai salah satu yang paling dekat dengan Masjid Nabawi. Lokasinya sangat ideal untuk jamaah.\n\nFasilitas premium tersedia dengan pelayanan kelas atas. Kamar luas dan nyaman untuk keluarga maupun individu.\n\nPengalaman menginap di sini memberikan kenyamanan maksimal selama menjalankan ibadah.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1472510771109-39b92752a6b9?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Al Safwah Royale Orchid",
    location: "Mekkah",
    jarak: "80 m dari Masjidil Haram",
    rating: "4.6",
    reviewer: "8.2k",
    price: 610,
    description:
        "Hotel ini menawarkan lokasi strategis yang dekat dengan Masjidil Haram sehingga memudahkan akses ibadah bagi para jamaah setiap saat.\n\nFasilitas hotel cukup lengkap dengan kamar yang nyaman dan area umum yang bersih. Desain interior memberikan nuansa modern dan hangat.\n\nPelayanan yang ramah dan cepat menjadikan hotel ini pilihan tepat untuk perjalanan ibadah yang praktis.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1568229988520-4bc288da81f7?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Elaf Kinda Hotel",
    location: "Jeddah",
    jarak: "120 m dari Masjidil Haram",
    rating: "4.5",
    reviewer: "7.9k",
    price: 580,
    description:
        "Hotel ini berada di pusat kota Mekkah dengan akses mudah ke Masjidil Haram sehingga cocok untuk jamaah umroh.\n\nFasilitas yang tersedia meliputi restoran, layanan kamar, dan area santai yang nyaman. Kamar dirancang sederhana namun fungsional.\n\nPelayanan staf yang profesional membuat pengalaman menginap menjadi lebih menyenangkan.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1677087492979-faae85702d1e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Saja Al Madinah Hotel",
    location: "Madinah",
    jarak: "200 m dari Masjid Nabawi",
    rating: "4.6",
    reviewer: "6.5k",
    price: 560,
    description:
        "Hotel ini menawarkan kenyamanan dengan lokasi yang tidak terlalu jauh dari Masjid Nabawi sehingga tetap mudah dijangkau.\n\nFasilitas cukup lengkap dengan kamar bersih dan nyaman. Area hotel juga tertata rapi dan modern.\n\nPelayanan yang baik menjadikan hotel ini pilihan ekonomis namun tetap nyaman.",
  ),

  Hotelmodel(
    linkImg: "https://plus.unsplash.com/premium_photo-1671196048754-03a77d051dcb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Al Aqeeq Madinah Hotel",
    location: "Madinah",
    jarak: "90 m dari Masjid Nabawi",
    rating: "4.7",
    reviewer: "9.1k",
    price: 670,
    description:
        "Hotel ini memiliki lokasi yang sangat strategis dekat Masjid Nabawi sehingga memudahkan jamaah dalam beribadah.\n\nFasilitas modern tersedia dengan kamar luas dan nyaman. Interior hotel terlihat elegan dan bersih.\n\nPelayanan staf yang profesional memberikan pengalaman menginap yang menyenangkan.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1690314754158-7287f2022d9d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Jabal Omar Hyatt Regency",
    location: "Jeddah",
    jarak: "250 m dari Masjidil Haram",
    rating: "4.8",
    reviewer: "14.2k",
    price: 910,
    description:
        "Hotel ini menawarkan pengalaman menginap premium dengan fasilitas lengkap dan lokasi strategis.\n\nKamar dirancang modern dengan kenyamanan maksimal serta fasilitas kelas atas.\n\nPelayanan hotel sangat profesional dan cocok untuk perjalanan ibadah maupun bisnis.",
  ),

  Hotelmodel(
    linkImg: "https://plus.unsplash.com/premium_photo-1680157072795-e283e74dec79?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Frontel Al Harithia",
    location: "Madinah",
    jarak: "300 m dari Masjid Nabawi",
    rating: "4.5",
    reviewer: "5.8k",
    price: 520,
    description:
        "Hotel ini cocok untuk jamaah yang mencari kenyamanan dengan harga terjangkau.\n\nFasilitas cukup lengkap dengan kamar bersih dan area umum nyaman.\n\nPelayanan ramah menjadikan pengalaman menginap lebih menyenangkan.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1775208000121-d23d92dc54dc?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Conrad Makkah",
    location: "Jeddah",
    jarak: "180 m dari Masjidil Haram",
    rating: "4.9",
    reviewer: "13.7k",
    price: 950,
    description:
        "Hotel ini menawarkan kemewahan dan kenyamanan dengan lokasi strategis dekat Masjidil Haram.\n\nFasilitas premium tersedia lengkap dengan layanan kelas atas.\n\nPengalaman menginap sangat eksklusif dan nyaman.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1764625918885-6003f199c158?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Dallah Taibah Hotel",
    location: "Jeddah",
    jarak: "70 m dari Masjid Nabawi",
    rating: "4.7",
    reviewer: "8.6k",
    price: 640,
    description:
        "Hotel ini memiliki lokasi dekat dengan Masjid Nabawi sehingga memudahkan jamaah.\n\nFasilitas lengkap dan kamar nyaman membuat tamu betah.\n\nPelayanan yang baik memberikan pengalaman menginap yang menyenangkan.",
  ),

  Hotelmodel(
    linkImg: "https://images.unsplash.com/photo-1762421028657-347de51e7707?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    hotelname: "Makkah Clock Royal Tower",
    location: "Mekkah",
    jarak: "20 m dari Masjidil Haram",
    rating: "5.0",
    reviewer: "20k",
    price: 990,
    description:
        "Hotel ini merupakan salah satu ikon di Mekkah dengan lokasi sangat dekat Masjidil Haram.\n\nFasilitas sangat lengkap dengan standar internasional.\n\nPengalaman menginap sangat mewah dan tak terlupakan.",
  ),
];
