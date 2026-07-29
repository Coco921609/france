import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForetFontainebleauPage extends StatefulWidget {
  const ForetFontainebleauPage({super.key});

  @override
  State<ForetFontainebleauPage> createState() => _ForetFontainebleauPageState();
}

class _ForetFontainebleauPageState extends State<ForetFontainebleauPage> {
  @override
  Widget build(BuildContext context) {
    const Color vertForet = Color(0xFF27AE60);

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
                  'assets/images/1136015-les-25-bosses-photos-image00079.jpg',
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
                        'فونتينبلو 🌲',
                        style: GoogleFonts.cinzel(
                          color: vertForet,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      _buildTranslationLine("باريس", "غابات إسكندنافية / السويد", vertForet),

                      const SizedBox(height: 25),

                      Text(
                        "🇫🇷 مسار الـ 25 هضبة الأسطوري",
                        style: GoogleFonts.montserrat(
                          color: vertForet.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تعد هذه واحدة من أكثر رحلات المشي أسطورية في منطقة إيل دو فرانس! رحلة مجانية، شاقة ومذهلة. أنشأها متسلقو الجبال الباريسيون في السبعينيات للتدريب على البعثات الاستكشافية، وهي بمثابة ملعب طبيعي حقيقي.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // TABLEAU
                      _buildSectionTitle('🏃 الإيقاع والمدة (17 كم)'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['المستوى', 'الوقت المتوقع'],
                        ['🏃 سريع', '4 – 5 ساعات'],
                        ['🚶 متوسط', '5 – 6 ساعات'],
                        ['🧘 هادئ', '6 – 7 ساعات'],
                        ['📸 تصوير/نزهة', '7 – 10 ساعات'],
                      ], vertForet),

                      const SizedBox(height: 35),

                      // SAISONS
                      _buildSectionTitle('📅 متى تذهب ؟'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الفصل', 'نصيحة'],
                        ['🍂 الخريف', 'مثالي (ألوان الأشجار مذهلة)'],
                        ['🌸 الربيع', 'مثالي (وقت التزهير)'],
                        ['🚫 الصيف/الشتاء', 'تجنبه (حار جداً أو منزلق)'],
                        ['⏰ عطلة الأسبوع', 'انطلق باكراً لتجنب الزحام'],
                      ], vertForet),

                      const SizedBox(height: 35),

                      // GALERIE
                      _buildSectionTitle('📸 نظرة على المكان'),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/1136007-les-25-bosses-photos-image00086.jpg'),
                            _buildGalleryImage('assets/images/1136009-les-25-bosses-photos-image00081.jpg'),
                            _buildGalleryImage('assets/images/1136011-les-25-bosses-photos-image00082.jpg'),
                            _buildGalleryImage('assets/images/1136015-les-25-bosses-photos-image00079.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // INFOS
                      _buildSectionTitle('🎒 نصائح للرحلة'),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.directions_run, "استعد جيداً: المسار منحدر ومنزلق!", vertForet),
                            _buildTechRow(Icons.water_drop, "1.5 لتر ماء كحد أدنى + وجبات خفيفة", vertForet),
                            _buildTechRow(Icons.map, "نظام تحديد المواقع (GPS) أو خريطة ضروري جداً", vertForet),
                            _buildTechRow(Icons.sync, "الاتجاه المنصوح به: عكس الاتجاه (لتجنب الزحام)", vertForet),
                            _buildTechRow(Icons.delete_outline, "بدون مخلفات: يرجى احترام الغابة 🙏", vertForet),
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
            color: const Color(0xFF27AE60),
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
                style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}