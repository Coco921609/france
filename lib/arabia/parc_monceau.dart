import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParcMonceauPage extends StatefulWidget {
  const ParcMonceauPage({super.key});

  @override
  State<ParcMonceauPage> createState() => _ParcMonceauPageState();
}

class _ParcMonceauPageState extends State<ParcMonceauPage> {
  @override
  Widget build(BuildContext context) {
    const Color orMonceau = Color(0xFFD4AF37);

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
                  'assets/images/748523-visuel-paris-parc-monceau.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[900]),
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
                        'حديقة مونسو 🌳',
                        style: GoogleFonts.cinzel(
                          color: orMonceau,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      _buildTranslationLine("باريس", "أطلال روما وتوسكانا", orMonceau),

                      const SizedBox(height: 25),

                      Text(
                        "🇮🇹 الأناقة الإيطالية في قلب باريس",
                        style: GoogleFonts.montserrat(
                          color: orMonceau.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تقع هذه الحديقة في مواجهة قوس النصر تماماً، وتشتهر بـ 'الناوماكيا' (مجموعة الأعمدة)، وهرمها وتماثيلها. تعكس الحديقة الأجواء الراقية والأثرية للحدائق الإيطالية في القرن التاسع عشر.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      _buildSectionTitle('📅 أفضل الفصول', orMonceau),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الموسم', 'نصيحة'],
                        ['🍂 الخريف', 'ألوان الأشجار مذهلة'],
                        ['☀️ الصيف', 'مثالية للاستمتاع بالبرودة'],
                        ['🌱 الربيع', 'موسم تفتح الزهور الرائع'],
                        ['❄️ الحور', 'يُفضل تجنبها (شديدة البرودة والرمادية)'],
                      ], orMonceau),

                      const SizedBox(height: 35),

                      _buildSectionTitle('⏰ المواعيد المفضلة', orMonceau),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الوقت', 'الحالة'],
                        ['✨ الصباح الباكر', 'ينصح به: هدوء وإضاءة جميلة'],
                        ['🕛 12 - 2 ظهراً', 'تجنبه: زحام شديد'],
                        ['🌅 المساء', 'مثالية لنزهة راقية'],
                      ], orMonceau),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📸 لمحة عن المكان', orMonceau),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/748523-visuel-paris-parc-monceau.jpg'),
                            _buildGalleryImage('assets/images/a8510b36f4672d921734299f69550e4b.jpg'),
                            _buildGalleryImage('assets/images/monceau-parc-paris.jpg'),
                            _buildGalleryImage('assets/images/597232-visuel-paris-parc-monceau.jpg'),
                            _buildGalleryImage('assets/images/597244-visuel-paris-parc-monceau.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📋 أساسيات ومعلومات', orMonceau),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.location_on_outlined, "أمام قوس النصر مباشرة", orMonceau),
                            _buildTechRow(Icons.photo_camera, "الكاميرا: مثالية لصور البورتريه", orMonceau),
                            _buildTechRow(Icons.directions_run, "مسار مفضل جداً لممارسة الجري", orMonceau),
                            _buildTechRow(Icons.pets, "يُسمح بالكلاب شرط ربطها", orMonceau),
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
          padding: EdgeInsets.symmetric(horizontal: 12),
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
      width: 280,
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