class MaskapaiModel {
  final String title;
  final String code;
  final String destination;
  final String time;
  final String linkImg;
  final String status;

  MaskapaiModel({
    required this.title,
    required this.code,
    required this.destination,
    required this.time,
    required this.linkImg,
    required this.status,
  });
}

final dataMaskapai = [
  {
    "title": "Garuda Indonesia",
    "code": "GA-980",
    "icon":
        "https://img.logo.dev/garuda-indonesia.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Jeddah (JED)",
    "time": "08:30 WIB \u2981 21 Mei 2026",
    "status": "Ontime",
  },
  {
    "title": "Saudia",
    "code": "SV-813",
    "icon":
        "https://img.logo.dev/saudia.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Madinah (MED)",
    "time": "10:15 WIB \u2981 21 Mei 2026",
    "status": "Boarding",
  },
  {
    "title": "Lion Air",
    "code": "JT-210",
    "icon":
        "https://img.logo.dev/lionair.co.id?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Surabaya (SUB)",
    "time": "07:45 WIB \u2981 21 Mei 2026",
    "status": "Delayed",
  },
  {
    "title": "Citilink",
    "code": "QG-501",
    "icon":
        "https://img.logo.dev/citilink.co.id?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Bali (DPS)",
    "time": "09:00 WIB \u2981 21 Mei 2026",
    "status": "Ontime",
  },
  {
    "title": "Batik Air",
    "code": "ID-722",
    "icon":
        "https://img.logo.dev/batikair.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Singapore (SIN)",
    "time": "11:20 WIB \u2981 21 Mei 2026",
    "status": "Check-in",
  },
  {
    "title": "AirAsia",
    "code": "AK-381",
    "icon":
        "https://img.logo.dev/airasia.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Kuala Lumpur (KUL)",
    "time": "13:00 WIB \u2981 21 Mei 2026",
    "status": "Ontime",
  },
  {
    "title": "Emirates",
    "code": "EK-359",
    "icon":
        "https://img.logo.dev/emirates.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Dubai (DXB)",
    "time": "17:40 WIB \u2981 21 Mei 2026",
    "status": "Boarding",
  },
  {
    "title": "Qatar Airways",
    "code": "QR-957",
    "icon":
        "https://img.logo.dev/qatarairways.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Doha (DOH)",
    "time": "18:25 WIB \u2981 21 Mei 2026",
    "status": "Ontime",
  },
  {
    "title": "Etihad Airways",
    "code": "EY-475",
    "icon":
        "https://img.logo.dev/etihad.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Abu Dhabi (AUH)",
    "time": "19:10 WIB \u2981 21 Mei 2026",
    "status": "Delayed",
  },
  {
    "title": "Turkish Airlines",
    "code": "TK-057",
    "icon":
        "https://img.logo.dev/turkishairlines.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Istanbul (IST)",
    "time": "21:00 WIB \u2981 21 Mei 2026",
    "status": "Check-in",
  },
  {
    "title": "Singapore Airlines",
    "code": "SQ-965",
    "icon":
        "https://img.logo.dev/singaporeair.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Singapore (SIN)",
    "time": "06:50 WIB \u2981 21 Mei 2026",
    "status": "Ontime",
  },
  {
    "title": "Malaysia Airlines",
    "code": "MH-720",
    "icon":
        "https://img.logo.dev/malaysiaairlines.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Kuala Lumpur (KUL)",
    "time": "12:10 WIB \u2981 21 Mei 2026",
    "status": "Boarding",
  },
  {
    "title": "ANA",
    "code": "NH-872",
    "icon":
        "https://img.logo.dev/ana.co.jp?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Tokyo (HND)",
    "time": "23:15 WIB \u2981 21 Mei 2026",
    "status": "Ontime",
  },
  {
    "title": "Japan Airlines",
    "code": "JL-726",
    "icon":
        "https://img.logo.dev/jal.co.jp?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Tokyo (NRT)",
    "time": "22:30 WIB \u2981 21 Mei 2026",
    "status": "Check-in",
  },
  {
    "title": "Thai Airways",
    "code": "TG-434",
    "icon":
        "https://img.logo.dev/thaiairways.com?token=pk_Iody5AQeTdCsNsPafNQBtg&size=80&retina=true",
    "destination": "Jakarta (CGK) \u2192 Bangkok (BKK)",
    "time": "14:45 WIB \u2981 21 Mei 2026",
    "status": "Ontime",
  },
];