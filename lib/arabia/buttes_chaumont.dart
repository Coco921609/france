import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtesChaumontPage extends StatefulWidget {
  const ButtesChaumontPage({super.key});

  @override
  State<ButtesChaumontPage> createState() => _ButtesChaumontPageState();
}

class _ButtesChaumontPageState extends State<ButtesChaumontPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique : Bleu Ciel / Eau
    const Color bleuParc = Color(0xFF5DADE2);

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
                  'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg',
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
                        'بوت شومون 🌳',
                        style: GoogleFonts.cinzel(
                          color: bleuParc,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // الموقع والتشبيه
                      _buildTranslationLine("باريس، الدائرة 19", "أجواء إيطالية (تيفولي)", bleuParc),

                      const SizedBox(height: 25),

                      Text(
                        "🇮🇹 ملاذ رومانسي في قلب باريس",
                        style: GoogleFonts.montserrat(
                          color: bleuParc.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "كان في الأصل مقلعاً صخرياً منحدراً، ويقدم اليوم إطلالات خلابة، وكهوفاً سرية، وبحيرة معلقة يطل عليها معبد سيبيل الشهير.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      _buildSectionTitle('📅 دليل الفصول', bleuParc),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الفصل', 'تفاصيل الزيارة'],
                        ['🍂 الخريف', 'ألوان برتقالية رائعة (ينصح به)'],
                        ['🌱 الربيع', 'نباتات مزهرة وأجواء منعشة'],
                        ['☀️ الصيف', 'مثالي للنزهات الخلوية'],
                        ['❄️ الشتاء', 'يُفضل تجنبه: برد ورياح قوية'],
                      ], bleuParc),

                      const SizedBox(height: 35),

                      _buildSectionTitle('🕓 الازدحام والمواعيد', bleuParc),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الوقت', 'التوصية'],
                        ['✨ مثالي', 'في الصباح الباكر أو قبيل الغروب'],
                        ['👥 مزدحم', '12 ظهراً - 2 ظهراً وفي عطلات نهاية الأسبوع'],
                      ], bleuParc),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📸 لمحة عن المكان', bleuParc),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/960042-parc-buttes-chaumont-automne.jpg'),
                            _buildGalleryImage('assets/images/OIP.webp'),
                            _buildGalleryImage('assets/images/istockphoto-1200995129-612x612.jpg'),
                            _buildGalleryImage('assets/images/istockphoto-1206218301-612x612.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📋 معلومات عملية', bleuParc),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.wc, "دورات مياه: نعم", bleuParc),
                            _buildTechRow(Icons.wifi, "إنترنت لاسلكي (WIFI): نعم", bleuParc),
                            _buildTechRow(Icons.child_care, "طاولة تغيير للأطفال: نعم", bleuParc),
                            _buildTechRow(Icons.local_drink, "آلة بيع مشروبات: لا", bleuParc),
                            _buildTechRow(Icons.pets, "حيوانات أليفة: نعم (مع مقود إلزامي)", bleuParc),
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
      width: 180,
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
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13),
                  softWrap: true)),
        ],
      ),
    );
  }
}