import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RougierCamaresPage extends StatefulWidget {
  const RougierCamaresPage({super.key});

  @override
  State<RougierCamaresPage> createState() => _RougierCamaresPageState();
}

class _RougierCamaresPageState extends State<RougierCamaresPage> {
  @override
  Widget build(BuildContext context) {
    const Color rougeRougier = Color(0xFFB03A2E);

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
                  'assets/images/large_d-sert-du-rougier-de-camar-s.1619435_91a67ef00c.jpg',
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
                        'روجيه دي كاماريس 🏜️',
                        style: GoogleFonts.cinzel(
                          color: rougeRougier,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      _buildTranslationLine("أفيرون", "أجواء من الغرب الأمريكي", rougeRougier),

                      const SizedBox(height: 25),

                      Text(
                        "🇺🇸 كولورادو منطقة أفيرون",
                        style: GoogleFonts.montserrat(
                          color: rougeRougier.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "منظر طبيعي استثنائي يتميز بأراضٍ حمراء قانية نحتتها عوامل التعرية. توفر هذه الصحراء المكونة من صخور 'الروف' مناظر بانورامية مذهلة تذكرنا بأودية أريزونا أو كولورادو.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // TABLEAU CALENDRIER
                      _buildSectionTitle('📅 أفضل وقت للزيارة', rougeRougier),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الوقت', 'نصائح الزيارة'],
                        ['🌅 نهاية اليوم', 'الإضاءة المائلة تبرز جمال اللون الأحمر'],
                        ['🍂 الخريف / الربيع', 'درجات حرارة مثالية للمشي'],
                        ['☀️ الصيف', 'تنبيه: حرارة شديدة على الأرض'],
                      ], rougeRougier),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📸 معرض الصور', rougeRougier),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/dji_0699--_steloweb---copie_w2000.jpg'),
                            _buildGalleryImage('assets/images/rougier-960x640.jpg'),
                            _buildGalleryImage('assets/images/large_d-sert-du-rougier-de-camar-s.1619435_91a67ef00c.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // INFOS PRATIQUES
                      _buildSectionTitle('📋 معلومات عملية', rougeRougier),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.map_outlined, "يقع بالقرب من كاماريس", rougeRougier),
                            _buildTechRow(Icons.directions_walk, "مسارات عديدة للمشي لمسافات طويلة", rougeRougier),
                            _buildTechRow(Icons.wb_sunny_outlined, "يرجى إحضار الماء وقبعة", rougeRougier),
                            _buildTechRow(Icons.camera_alt, "منظر طبيعي فريد للتصوير الفوتوغرافي", rougeRougier),
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