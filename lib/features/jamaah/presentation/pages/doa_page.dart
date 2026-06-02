// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_fonts/google_fonts.dart';

final selectedCategoryProvider = StateProvider<int>((ref) => 0);

class DoaPage extends ConsumerWidget {
  const DoaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final selectedIndex = ref.watch(selectedCategoryProvider);

    final selectedCategory = categories[selectedIndex].title;

    final filteredDoa = selectedCategory == 'Semua'
        ? doaList
        : doaList.where((doa) => doa.title == selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 280,
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 24,
                      right: 24,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xffF6F7F2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                    child: Stack(
                      children: [
                        /// BACKGROUND ORNAMENT
                        Positioned(
                          top: -20,
                          right: -30,
                          child: Opacity(
                            opacity: 0.08,
                            child: Icon(
                              Icons.mosque,
                              size: 220,
                              color: Colors.green,
                            ),
                          ),
                        ),

                        /// CONTENT
                        Row(
                          children: [
                            /// TEXT
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),

                                  Icon(
                                    Icons.auto_awesome,
                                    color: Color(0xffC8A95B),
                                    size: 18,
                                  ),

                                  const SizedBox(height: 20),

                                  Text(
                                    'Doa Umroh & Haji',
                                    style: GoogleFonts.lora(
                                      fontSize: width < 360 ? 28 : 34,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff184B2B),
                                      height: 1.2,
                                    ),
                                  ),

                                  const SizedBox(height: 14),

                                  SizedBox(
                                    width: 220,
                                    child: Text(
                                      'Kumpulan doa pilihan untuk perjalanan ibadah yang makbul',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.black54,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// IMAGE
                            Expanded(
                              flex: 4,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.asset(
                                  'assets/images/kabah-img.png',
                                  fit: BoxFit.contain,
                                  height: 180,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// SEARCH BAR
                  Positioned(
                    bottom: -64,
                    left: 24,
                    right: 24,
                    child: Container(
                      height: 62,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey.shade500),

                          const SizedBox(width: 12),

                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Cari doa (contoh: tawaf, ihram...)',
                                hintStyle: GoogleFonts.inter(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xff184B2B),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(
                              Icons.tune,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 84),

              /// CATEGORY
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    final isActive = selectedIndex == index;

                    return _chip(ref, index, isActive, category);
                  },
                ),
              ),

              const SizedBox(height: 24),

              ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredDoa.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 12);
                },
                itemBuilder: (context, index) {
                  final doa = filteredDoa[index];

                  return _item(index, doa);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _item(int index, Doa doa) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xff184B2B),
                  shape: BoxShape.circle,
                ),
                child: Icon(doa.icon, color: Colors.white, size: 24),
              ),
              SizedBox(height: 4),
              Text(
                doa.title,
                style: GoogleFonts.inter(
                  color: Color(0xff184B2B),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Container(width: 1, height: 120, color: Colors.grey.shade300),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doa.arabic,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.notoNaskhArabic(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Color(0xff184B2B),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  doa.latin,
                  style: GoogleFonts.cairo(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Container(width: 240, height: 1, color: Colors.grey.shade300),
                SizedBox(height: 4),
                Text(
                  doa.translation,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _chip(WidgetRef ref, int index, bool isActive, Doa category) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedCategoryProvider.notifier).state = index;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xff184B2B) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),
        child: Row(
          children: [
            Icon(
              category.icon,
              size: 18,
              color: isActive ? Colors.white : Colors.green.shade700,
            ),

            const SizedBox(width: 8),

            Text(
              category.title,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Doa {
  final String title;
  final IconData icon;
  final String arabic;
  final String latin;
  final String translation;

  Doa({
    required this.title,
    required this.icon,
    this.arabic = '',
    this.latin = '',
    this.translation = '',
  });
}

final List<Doa> categories = [
  Doa(title: 'Semua', icon: Icons.grid_view_rounded),
  Doa(title: 'Tawaf', icon: Icons.mosque),
  Doa(title: 'Sai', icon: Icons.landscape),
  Doa(title: 'Ihram', icon: Icons.person),
  Doa(title: 'Perjalanan', icon: Icons.flight),
  Doa(title: 'Ziarah', icon: Icons.location_on),
];

final List<Doa> doaList = [
  Doa(
    title: 'Tawaf',
    icon: Icons.mosque,
    arabic:
        'اللَّهُمَّ إِيمَانًا بِكَ وَتَصْدِيقًا بِكِتَابِكَ وَوَفَاءً بِعَهْدِكَ وَاتِّبَاعًا لِسُنَّةِ نَبِيِّكَ مُحَمَّدٍ',
    latin:
        "Allahumma īmānan bika wa taṣdīqan bikitābika wa wafā’an bi‘ahdika wattibā‘an lisunnati nabiyyika Muḥammad ﷺ",
    translation:
        "Ya Allah, aku bertawaf karena iman kepada-Mu, membenarkan kitab-Mu, memenuhi janji-Mu, dan mengikuti sunnah Nabi-Mu Muhammad ﷺ.",
  ),
  Doa(
    title: 'Sai',
    icon: Icons.landscape,
    arabic: 'إِنَّ الصَّفَا وَالْمَرْوَةَ مِنْ شَعَائِرِ اللَّهِ',
    latin: "Innaṣ-Ṣafā wal-Marwata min sya‘ā’irillāh",
    translation:
        "Sesungguhnya Shafa dan Marwah adalah sebagian dari syiar Allah.",
  ),
  Doa(
    title: 'Ihram',
    icon: Icons.person,
    arabic:
        'لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ، لَبَّيْكَ لَا شَرِيكَ لَكَ لَبَّيْكَ، إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ، لَا شَرِيكَ لَكَ',
    latin:
        "Labbaika Allāhumma labbaik, labbaika lā syarīka laka labbaik. Innal-ḥamda wan-ni‘mata laka wal-mulk, lā syarīka lak.",
    translation:
        "Aku penuhi panggilan-Mu ya Allah, aku penuhi panggilan-Mu. Tiada sekutu bagi-Mu, aku penuhi panggilan-Mu. Sesungguhnya segala puji, nikmat, dan kerajaan adalah milik-Mu. Tiada sekutu bagi-Mu.",
  ),
  Doa(
    title: 'Perjalanan',
    icon: Icons.flight,
    arabic:
        'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ',
    latin:
        "Subḥānallażī sakhkhara lanā hāżā wa mā kunnā lahū muqrinīn wa innā ilā rabbinā lamunqalibūn",
    translation:
        "Maha Suci Allah yang telah menundukkan kendaraan ini untuk kami padahal kami sebelumnya tidak mampu menguasainya, dan sesungguhnya kepada Tuhan kami lah kami akan kembali.",
  ),
  Doa(
    title: 'Ziarah',
    icon: Icons.location_on,
    arabic:
        'السَّلَامُ عَلَيْكَ يَا رَسُولَ اللَّهِ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ',
    latin: "Assalāmu ‘alaika yā Rasūlallāhi wa raḥmatullāhi wa barakātuh",
    translation:
        "Semoga keselamatan tercurah kepadamu wahai Rasulullah, beserta rahmat Allah dan berkah-Nya.",
  ),
];
