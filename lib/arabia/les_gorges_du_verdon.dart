import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GorgesDuVerdonPage extends StatefulWidget {
  const GorgesDuVerdonPage({super.key});

  @override
  State<GorgesDuVerdonPage> createState() => _GorgesDuVerdonPageState();
}

class _GorgesDuVerdonPageState extends State<GorgesDuVerdonPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuVerdon = Color(0xFF40E0D0);

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
                  'assets/images/VERDON.jpg',
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
                        'أخدود فيردون 🛶',
                        style: GoogleFonts.cinzel(
                          color: bleuVerdon,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      _buildTranslationLine("بروفانس", "أجواء من الأخدود العظيم (أمريكا)", bleuVerdon),

                      const SizedBox(height: 25),

                      Text(
                        "🇺🇸 أكبر أخدود في أوروبا",
                        style: GoogleFonts.montserrat(
                          color: bleuVerdon.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "صدع هائل حفره نهر فيردون، توفر هذه المنحدرات شاهقة الارتفاع مياهاً فيروزية تفوق الخيال. إنها محمية طبيعية بجمال بري استثنائي.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // TABLEAU SAISONS
                      _buildSectionTitle('📅 أفضل المواسم', bleuVerdon),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الموسم', 'الأجواء', 'نصيحة'],
                        ['🌸 الربيع', 'مياه جارية', 'مثالي للتجديف والتمتع بالزهور'],
                        ['☀️ الصيف', 'لون فيروزي', 'مثالي للقوارب (مزدحم جداً)'],
                        ['🍂 الخريف', 'هدوء تام', 'إضاءة ساحرة على المنحدرات'],
                        ['❄️ الشتاء', 'أجواء غامضة', 'طريق القمم قد يكون مغطى بالثلوج'],
                      ], bleuVerdon),

                      const SizedBox(height: 35),

                      // TABLEAU ACTIVITÉS
                      _buildSectionTitle('💡 أنشطة مقترحة', bleuVerdon),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['النوع', 'توصية'],
                        ['🛶 مائي', 'استئجار قارب عند جسر جاليتاس'],
                        ['🥾 مشي', 'مسار بلان بلانك مارتل (رياضي وأسطوري)'],
                        ['🚗 إطلالة', 'طريق القمم للوصول إلى أجمل المطلات'],
                      ], bleuVerdon),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📸 لمحة عن المكان', bleuVerdon),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/Visiter-les-Gorges-du-Verdon.jpg'),
                            _buildGalleryImage('assets/images/Gorges-du-VerdonProvence-in-France-Europe.-755x504.jpg'),
                            _buildGalleryImage('assets/images/randonnee_basses_gorges_verdon_2_2a20e72145.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📋 معلومات عملية', bleuVerdon),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.directions_car, "طرق متعرجة جداً وضيقة", bleuVerdon),
                            _buildTechRow(Icons.location_on, "لا يكتمل المشوار بدون: موستير سانت ماري", bleuVerdon),
                            _buildTechRow(Icons.water_drop, "درجة حرارة الماء باردة نوعاً ما", bleuVerdon),
                            _buildTechRow(Icons.camera_alt, "يمكن رؤية النسور السمراء من القمم", bleuVerdon),
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