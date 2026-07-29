import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GorgesDuFierPage extends StatefulWidget {
  const GorgesDuFierPage({super.key});

  @override
  State<GorgesDuFierPage> createState() => _GorgesDuFierPageState();
}

class _GorgesDuFierPageState extends State<GorgesDuFierPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuEau = Color(0xFF2E5A88);

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
                  'assets/images/gorges-du-fier-annecy-4-768x960.jpg',
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
                        'ممرات فيير المائية 🌊',
                        style: GoogleFonts.cinzel(
                          color: bleuEau,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      _buildTranslationLine("آنـسي", "أجواء من مالقة (كامينيتو ديل ري)", bleuEau),

                      const SizedBox(height: 25),

                      Text(
                        "🇪🇸 نسخة 'كامينيتو ديل ري' في سافوا العليا",
                        style: GoogleFonts.montserrat(
                          color: bleuEau.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تجربة مثيرة تحاكي ممرات مالقة الشهيرة. امشِ فوق نهر 'فيير' على جسور معلقة واستمتع بمشاهدة نحت المياه العجيب في الصخور الكلسية عبر آلاف السنين.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      _buildSectionTitle('📅 المواسم والمواعيد'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['التوقيت', 'التفاصيل'],
                        ['🗓️ الافتتاح', 'من منتصف مارس إلى منتصف أكتوبر'],
                        ['⏰ الصباح', '9:30 - 12:00 (يُنصح به)'],
                        ['🕓 المساء', '14:00 - 18:00'],
                      ], bleuEau),

                      const SizedBox(height: 35),

                      _buildSectionTitle('🎟️ أسعار تذاكر الدخول'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الفئة', 'السعر'],
                        ['🎟️ الدخول', '6 يورو (السعر قابل للتغيير)'],
                      ], bleuEau),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📸 لمحة عن المكان'),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/gorges-du-fier-annecy-14-768x960.jpg'),
                            _buildGalleryImage('assets/images/gorges-du-fier-annecy-2-768x960.jpg'),
                            _buildGalleryImage('assets/images/gorges-du-fier-annecy-4-768x960.jpg'),
                            _buildGalleryImage('assets/images/gorges-du-fier-annecy-8-768x960.jpg'),
                            _buildGalleryImage('assets/images/gorges-du-fier-annecy-12.jpg'),
                            _buildGalleryImage('assets/images/gorges-du-fier-annecy-20.jpg'),
                            _buildGalleryImage('assets/images/gorges-du-fier-annecy-17-768x960.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📋 نصائح لا غنى عنها'),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.camera_alt, "يُنصح بشدة بإحضار كاميرا تصوير", bleuEau),
                            _buildTechRow(Icons.euro_symbol, "السعر 6 يورو: قد يتغير بمرور الوقت", bleuEau),
                            _buildTechRow(Icons.warning_amber_rounded, "الجسور ضيقة جداً (اتجاه واحد للمشي)", bleuEau),
                            _buildTechRow(Icons.explore, "تذكير: المكان يشبه كامينيتو ديل ري وأودية كولورادو", bleuEau),
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
        Text(analogie, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16)),
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

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: GoogleFonts.cinzel(
            color: const Color(0xFF2E5A88),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2));
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
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}