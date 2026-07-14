import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class MeandreQueuillePage extends StatefulWidget {
  const MeandreQueuillePage({super.key});

  @override
  State<MeandreQueuillePage> createState() => _MeandreQueuillePageState();
}

class _MeandreQueuillePageState extends State<MeandreQueuillePage> {
  @override
  Widget build(BuildContext context) {
    // اللون المميز: أخضر الأمازون / الغابة
    const Color vertQueuille = Color(0xFF003E1A);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. صورة الخلفية (العلوية)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. المحتوى القابل للتمرير
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF141619),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'منعطف كوي المائي 🌿',
                      style: GoogleFonts.cinzel(
                        color: vertQueuille,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // التشبيه والمكان
                    _buildTranslationLine(
                        "بوي دي دوم", "أجواء من الأمازون (البرازيل)", vertQueuille),

                    const SizedBox(height: 25),

                    Text(
                      "🇧🇷 إطلالة نهاية العالم",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                        color: vertQueuille.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "منعطف مائي مثالي يشكله نهر 'سيول' في قلب غابة كثيفة وبرية. توفر هذه البانوراما الاستثنائية إحساساً وكأنك تقف أمام ذراع من نهر الأمازون ضائع وسط الغابة الاستوائية.",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('📅 أفضل وقت للزيارة', vertQueuille),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['التوقيت', 'نصائح'],
                      ['🌅 الصباح الباكر', 'ضباب صباحي يضفي أجواءً غامضة'],
                      ['🍂 الخريف', 'الغابة تكتسي بألوان متوهجة'],
                      ['☀️ الصيف', 'لون أخضر مكثف (تأثير الغابة مضمون)'],
                    ], vertQueuille),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 لمحة عن المكان', vertQueuille),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/4f26bf43d724d27dd2d2277f502c8505.jpg'),
                          _buildGalleryImage('assets/images/maxresdefault.jpg'),
                          _buildGalleryImage(
                              'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 معلومات عملية', vertQueuille),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.visibility,
                              "منصة المراقبة متاحة مجاناً", vertQueuille),
                          _buildTechRow(Icons.place,
                              "تقع في قرية كوي (Queuille)", vertQueuille),
                          _buildTechRow(Icons.info_outline,
                              "سهولة الوصول (بالقرب من المواقف)", vertQueuille),
                          _buildTechRow(Icons.camera_alt,
                              "صورة أيقونية من باحة الكنيسة", vertQueuille),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- مساعدو التصميم ---

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville,
            style: GoogleFonts.montserrat(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_back, color: Colors.white24, size: 16),
        ),
        Text(analogie,
            style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16),
            softWrap: true),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      textDirection: TextDirection.rtl,
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        int idx = entry.key;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(
                  color: idx == 0 ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight:
                  idx == 0 ? FontWeight.bold : FontWeight.normal,
                ),
                softWrap: true),
          ))
              .toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(title.toUpperCase(),
          style: GoogleFonts.cinzel(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2)),
    );
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTechRow(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(
              child: Text(label,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 13),
                  softWrap: true)),
        ],
      ),
    );
  }
}