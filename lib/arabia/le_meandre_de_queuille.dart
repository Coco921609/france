import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeandreQueuillePage extends StatefulWidget {
  const MeandreQueuillePage({super.key});

  @override
  State<MeandreQueuillePage> createState() => _MeandreQueuillePageState();
}

class _MeandreQueuillePageState extends State<MeandreQueuillePage> {
  @override
  Widget build(BuildContext context) {
    const Color vertQueuille = Color(0xFF003E1A);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // 1. IMAGE DE HAUT (Intégrée au défilement global)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // 2. CONTENU (Remonté légèrement pour le design)
              Transform.translate(
                offset: const Offset(0, -50),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF141619),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
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

                      _buildTranslationLine("بوي دي دوم", "أجواء من الأمازون (البرازيل)", vertQueuille),

                      const SizedBox(height: 25),

                      Text(
                        "🇧🇷 إطلالة نهاية العالم",
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
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // TABLEAU CALENDRIER
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
                            _buildGalleryImage('assets/images/4f26bf43d724d27dd2d2277f502c8505.jpg'),
                            _buildGalleryImage('assets/images/maxresdefault.jpg'),
                            _buildGalleryImage('assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // INFOS PRATIQUES
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
                            _buildTechRow(Icons.visibility, "منصة المراقبة متاحة مجاناً", vertQueuille),
                            _buildTechRow(Icons.place, "تقع في قرية كوي (Queuille)", vertQueuille),
                            _buildTechRow(Icons.info_outline, "سهولة الوصول (بالقرب من المواقف)", vertQueuille),
                            _buildTechRow(Icons.camera_alt, "صورة أيقونية من باحة الكنيسة", vertQueuille),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
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

  // --- HELPERS ---

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_back, color: Colors.white24, size: 16),
        ),
        Text(analogie, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16), softWrap: true),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        bool isHeader = entry.key == 0;
        return TableRow(
          children: entry.value.map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(
                  color: isHeader ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                )),
          )).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.cinzel(
            color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
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
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Text(label,
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}