// ignore_for_file: non_constant_identifier_names

class MaskapaiModel {
  final String title;
  final String code;
  final String destinationstart;
  final String destinationend;
  final String time;
  final String date;
  final String linkImg;
  final String status;

  MaskapaiModel({
    required this.title,
    required this.code,
    required this.destinationstart,
    required this.destinationend,
    required this.time,
    required this.date,
    required this.linkImg,
    required this.status,
  });
}

final List<MaskapaiModel> dataMaskapai = [
  MaskapaiModel(
    title: "Garuda Indonesia",
    code: "GA-980",
    linkImg:
        "https://img.logo.dev/garuda-indonesia.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Jeddah (JED)",
    time: "08:30 WIB",
    date: "21 Mei 2026",
    status: "Ontime",
  ),
  MaskapaiModel(
    title: "Saudia",
    code: "SV-813",
    linkImg:
        "https://img.logo.dev/saudia.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Madinah (MED)",
    time: "10:15 WIB",
    date: "21 Mei 2026",
    status: "Boarding",
  ),
  MaskapaiModel(
    title: "Lion Air",
    code: "JT-210",
    linkImg:
        "https://img.logo.dev/lionair.co.id?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Surabaya (SUB)",
    time: "07:45 WIB",
    date: "21 Mei 2026",
    status: "Delayed",
  ),
  MaskapaiModel(
    title: "Citilink",
    code: "QG-501",
    linkImg:
        "https://img.logo.dev/citilink.co.id?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Bali (DPS)",
    time: "09:00 WIB",
    date: "21 Mei 2026",
    status: "Ontime",
  ),
  MaskapaiModel(
    title: "Batik Air",
    code: "ID-722",
    linkImg:
        "https://img.logo.dev/batikair.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Singapore (SIN)",
    time: "11:20 WIB",
    date: "21 Mei 2026",
    status: "Check-in",
  ),
  MaskapaiModel(
    title: "AirAsia",
    code: "AK-381",
    linkImg:
        "https://img.logo.dev/airasia.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Kuala Lumpur (KUL)",
    time: "13:00 WIB",
    date: "21 Mei 2026",
    status: "Ontime",
  ),
  MaskapaiModel(
    title: "Emirates",
    code: "EK-359",
    linkImg:
        "https://img.logo.dev/emirates.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Dubai (DXB)",
    time: "17:40 WIB",
    date: "21 Mei 2026",
    status: "Boarding",
  ),
  MaskapaiModel(
    title: "Qatar Airways",
    code: "QR-957",
    linkImg:
        "https://img.logo.dev/qatarairways.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Doha (DOH)",
    time: "18:25 WIB",
    date: "21 Mei 2026",
    status: "Ontime",
  ),
  MaskapaiModel(
    title: "Etihad Airways",
    code: "EY-475",
    linkImg:
        "https://img.logo.dev/etihad.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Abu Dhabi (AUH)",
    time: "19:10 WIB",
    date: "21 Mei 2026",
    status: "Delayed",
  ),
  MaskapaiModel(
    title: "Turkish Airlines",
    code: "TK-057",
    linkImg:
        "https://img.logo.dev/turkishairlines.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    destinationstart: "Jakarta (CGK)",
    destinationend: "Istanbul (IST)",
    time: "21:00 WIB",
    date: "21 Mei 2026",
    status: "Check-in",
  ),
];

class MaskapaiDataLengkap {
  final String duration;
  final String terminal;
  final String gate;
  final String kelas;
  final String airportstart;
  final String airportstartcode;
  final String airportend;
  final String airportendcode;

  MaskapaiDataLengkap({
    required this.duration,
    required this.terminal,
    required this.gate,
    required this.kelas,
    required this.airportstart,
    required this.airportstartcode,
    required this.airportend,
    required this.airportendcode,
  });
}

final List<MaskapaiDataLengkap> data_lengkap_maskapai = [
  MaskapaiDataLengkap(
    duration: "10j 30m",
    terminal: "Terminal 3",
    gate: "A5",
    kelas: "Ekonomi",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "King Abdulaziz",
    airportendcode: "JED",
  ),
  MaskapaiDataLengkap(
    duration: "10j 05m",
    terminal: "Terminal 3",
    gate: "B2",
    kelas: "Ekonomi",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "P Moh Bin Abdulaziz",
    airportendcode: "MED",
  ),
  MaskapaiDataLengkap(
    duration: "1j 35m",
    terminal: "Terminal 2",
    gate: "C1",
    kelas: "Ekonomi",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "Juanda",
    airportendcode: "SUB",
  ),
  MaskapaiDataLengkap(
    duration: "1j 55m",
    terminal: "Terminal 1",
    gate: "D4",
    kelas: "Ekonomi",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "Ngurah Rai",
    airportendcode: "DPS",
  ),
  MaskapaiDataLengkap(
    duration: "1j 50m",
    terminal: "Terminal 2",
    gate: "A8",
    kelas: "Bisnis",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "Changi",
    airportendcode: "SIN",
  ),
  MaskapaiDataLengkap(
    duration: "2j 05m",
    terminal: "Terminal 2",
    gate: "E6",
    kelas: "Ekonomi",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "KLIA 2",
    airportendcode: "KUL",
  ),
  MaskapaiDataLengkap(
    duration: "8j 15m",
    terminal: "Terminal 3",
    gate: "F3",
    kelas: "Bisnis",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "Dubai International",
    airportendcode: "DXB",
  ),
  MaskapaiDataLengkap(
    duration: "8j 40m",
    terminal: "Terminal 3",
    gate: "G7",
    kelas: "Bisnis",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "Hamad International",
    airportendcode: "DOH",
  ),
  MaskapaiDataLengkap(
    duration: "8j 05m",
    terminal: "Terminal 3",
    gate: "H2",
    kelas: "Bisnis",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "Zayed International",
    airportendcode: "AUH",
  ),
  MaskapaiDataLengkap(
    duration: "11j 20m",
    terminal: "Terminal 3",
    gate: "J4",
    kelas: "Bisnis",
    airportstart: "Soekarno-Hatta",
    airportstartcode: "CGK",
    airportend: "Istanbul Airport",
    airportendcode: "IST",
  ),
];

class InfoPenerbangan {
  final String kodebooking;
  final String pesawat;
  final String nopenerbangan;
  final String bagasi;
  final String makan;
  final String program;

  InfoPenerbangan({
    required this.kodebooking,
    required this.pesawat,
    required this.nopenerbangan,
    required this.bagasi,
    required this.makan,
    required this.program,
  });
}

final List<InfoPenerbangan> data_info_penerbangan = [
  InfoPenerbangan(
    kodebooking: "GA980A1",
    pesawat: "Boeing 777-300ER",
    nopenerbangan: "GA-980",
    bagasi: "30 Kg",
    makan: "Tersedia",
    program: "Garuda Indonesia Experience",
  ),
  InfoPenerbangan(
    kodebooking: "SV813B2",
    pesawat: "Airbus A330-300",
    nopenerbangan: "SV-813",
    bagasi: "30 Kg",
    makan: "Tersedia",
    program: "Saudia Hospitality",
  ),
  InfoPenerbangan(
    kodebooking: "JT210C3",
    pesawat: "Boeing 737-900ER",
    nopenerbangan: "JT-210",
    bagasi: "20 Kg",
    makan: "Tidak Tersedia",
    program: "Lion Air Basic Service",
  ),
  InfoPenerbangan(
    kodebooking: "QG501D4",
    pesawat: "Airbus A320",
    nopenerbangan: "QG-501",
    bagasi: "20 Kg",
    makan: "Snack",
    program: "Citilink Green Service",
  ),
  InfoPenerbangan(
    kodebooking: "ID722E5",
    pesawat: "Boeing 737 MAX 8",
    nopenerbangan: "ID-722",
    bagasi: "25 Kg",
    makan: "Tersedia",
    program: "Batik Premium Class",
  ),
  InfoPenerbangan(
    kodebooking: "AK381F6",
    pesawat: "Airbus A320neo",
    nopenerbangan: "AK-381",
    bagasi: "20 Kg",
    makan: "Pre-order",
    program: "AirAsia Value Pack",
  ),
  InfoPenerbangan(
    kodebooking: "EK359G7",
    pesawat: "Boeing 777-300ER",
    nopenerbangan: "EK-359",
    bagasi: "40 Kg",
    makan: "Tersedia",
    program: "Emirates Signature Service",
  ),
  InfoPenerbangan(
    kodebooking: "QR957H8",
    pesawat: "Airbus A350-1000",
    nopenerbangan: "QR-957",
    bagasi: "35 Kg",
    makan: "Tersedia",
    program: "Qatar Privilege Travel",
  ),
  InfoPenerbangan(
    kodebooking: "EY475I9",
    pesawat: "Boeing 787 Dreamliner",
    nopenerbangan: "EY-475",
    bagasi: "35 Kg",
    makan: "Tersedia",
    program: "Etihad Comfort Plus",
  ),
  InfoPenerbangan(
    kodebooking: "TK057J0",
    pesawat: "Airbus A330-300",
    nopenerbangan: "TK-057",
    bagasi: "35 Kg",
    makan: "Tersedia",
    program: "Turkish Airlines Care",
  ),
];

class JadwalPenerbangan {
  final String timeberangkat;
  final String dateberangkat;
  final String kotaberangkat;
  final String terminalberangkat;
  final String timetiba;
  final String datetiba;
  final String kotatiba;
  final String terminaltiba;
  final String durationpenerbangan;

  JadwalPenerbangan({
    required this.timeberangkat,
    required this.dateberangkat,
    required this.timetiba,
    required this.datetiba,
    required this.kotaberangkat,
    required this.kotatiba,
    required this.terminalberangkat,
    required this.terminaltiba,
    required this.durationpenerbangan,
  });
}

final List<JadwalPenerbangan> data_jadwal_penerbangan = [
  JadwalPenerbangan(
    timeberangkat: "08:30 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "14:00 AST",
    datetiba: "21 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Jeddah (JED)",
    terminalberangkat: "Terminal 3 - Gate A5",
    terminaltiba: "Terminal 1",
    durationpenerbangan: "10j 30m",
  ),

  JadwalPenerbangan(
    timeberangkat: "10:15 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "16:20 AST",
    datetiba: "21 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Madinah (MED)",
    terminalberangkat: "Terminal 3 - Gate B2",
    terminaltiba: "Terminal Internasional",
    durationpenerbangan: "10j 05m",
  ),

  JadwalPenerbangan(
    timeberangkat: "07:45 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "09:20 WIB",
    datetiba: "21 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Surabaya (SUB)",
    terminalberangkat: "Terminal 2 - Gate C1",
    terminaltiba: "Terminal 1",
    durationpenerbangan: "1j 35m",
  ),

  JadwalPenerbangan(
    timeberangkat: "09:00 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "10:55 WITA",
    datetiba: "21 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Bali (DPS)",
    terminalberangkat: "Terminal 1 - Gate D4",
    terminaltiba: "Terminal Domestik",
    durationpenerbangan: "1j 55m",
  ),

  JadwalPenerbangan(
    timeberangkat: "11:20 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "14:10 SGT",
    datetiba: "21 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Singapore (SIN)",
    terminalberangkat: "Terminal 2 - Gate A8",
    terminaltiba: "Terminal 4",
    durationpenerbangan: "1j 50m",
  ),

  JadwalPenerbangan(
    timeberangkat: "13:00 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "16:05 MYT",
    datetiba: "21 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Kuala Lumpur (KUL)",
    terminalberangkat: "Terminal 2 - Gate E6",
    terminaltiba: "KLIA 2",
    durationpenerbangan: "2j 05m",
  ),

  JadwalPenerbangan(
    timeberangkat: "17:40 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "22:55 GST",
    datetiba: "21 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Dubai (DXB)",
    terminalberangkat: "Terminal 3 - Gate F3",
    terminaltiba: "Terminal 3",
    durationpenerbangan: "8j 15m",
  ),

  JadwalPenerbangan(
    timeberangkat: "18:25 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "23:05 AST",
    datetiba: "21 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Doha (DOH)",
    terminalberangkat: "Terminal 3 - Gate G7",
    terminaltiba: "Hamad Terminal",
    durationpenerbangan: "8j 40m",
  ),

  JadwalPenerbangan(
    timeberangkat: "19:10 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "23:15 GST",
    datetiba: "21 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Abu Dhabi (AUH)",
    terminalberangkat: "Terminal 3 - Gate H2",
    terminaltiba: "Terminal A",
    durationpenerbangan: "8j 05m",
  ),

  JadwalPenerbangan(
    timeberangkat: "21:00 WIB",
    dateberangkat: "21 Mei 2026",
    timetiba: "05:20 TRT",
    datetiba: "22 Mei 2026",
    kotaberangkat: "Jakarta (CGK)",
    kotatiba: "Istanbul (IST)",
    terminalberangkat: "Terminal 3 - Gate J4",
    terminaltiba: "Main Terminal",
    durationpenerbangan: "11j 20m",
  ),
];
