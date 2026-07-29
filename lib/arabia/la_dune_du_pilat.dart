import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DuneDuPilatPage extends StatefulWidget {
  const DuneDuPilatPage({super.key});

  @override
  State<DuneDuPilatPage> createState() => _DuneDuPilatPageState();
}

class _DuneDuPilatPageState extends State<DuneDuPilatPage> {
  @override
  Widget build(BuildContext context) {
    const Color goudDune = Color(0xFFD4AC0D);

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
                  'assets/images/sudouest-photo-1-32378160-1600.jpg',
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
                        'كثيب بيلات 🏖️',
                        style: GoogleFonts.cinzel(
                          color: goudDune,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      _buildTranslationLine("حوض أركاشون", "أجواء من الصحراء الكبرى (إفريقيا)", goudDune),

                      const SizedBox(height: 25),

                      Text(
                        "🏜️ أعلى كثيب رملي في أوروبا",
                        style: GoogleFonts.montserrat(
                          color: goudDune.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "ظاهرة طبيعية ضخمة تقع بين المحيط الأطلسي وغابة لاند. يبلغ ارتفاعها أكثر من 100 متر، وتوفر مشهداً صحراوياً مذهلاً وإطلالة فريدة على ممر أركاشون المائي.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // TABLEAU SAISONS
                      _buildSectionTitle('📅 أفضل المواسم', goudDune),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الفصل', 'الأجواء', 'نصيحة'],
                        ['🌸 الربيع', 'اعتدال', 'مثالي لتجنب الحشود'],
                        ['☀️ الصيف', 'حرارة', 'يُفضل وقت الشروق أو الغروب'],
                        ['🍂 الخريف', 'إضاءة ذهبية', 'الفترة الأكثر ملاءمة للتصوير'],
                        ['❄️ الشتاء', 'طبيعة برية', 'مثالي للاستمتاع بهدوء تام'],
                      ], goudDune),

                      const SizedBox(height: 35),

                      // TABLEAU CONSEILS
                      _buildSectionTitle('💡 نصائح للزيارة', goudDune),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['النوع', 'التوصية'],
                        ['🌅 وقت الغروب', 'أكثر اللحظات سحراً في اليوم'],
                        ['🏃 الصعود', 'يتوفر درج خشبي من أبريل إلى أكتوبر'],
                        ['🌬️ الرياح', 'الرمال قد تكون مزعجة في أيام الرياح القوية'],
                      ], goudDune),

                      const SizedBox(height: 35),

                      // GALERIE
                      _buildSectionTitle('📸 لمحة عن المكان', goudDune),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/photo-aerienne-dune-du-pilat-277.jpg'),
                            _buildGalleryImage('assets/images/de-zonsondergang-vanaf-de-dune-du-pilat-frankrijk_32968_ml.jpg'),
                            _buildGalleryImage('assets/images/panorama-over-de-dune-du-pilat-frankrijk_13655_ml.jpg'),
                            _buildGalleryImage('assets/images/sudouest-photo-1-32378160-1600.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // INFOS PRATIQUES
                      _buildSectionTitle('📋 معلومات عملية', goudDune),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.hiking, "الدخول للكثيب حر ومجاني", goudDune),
                            _buildTechRow(Icons.wb_sunny, "منطقة مكشوفة: يرجى إحضار الماء", goudDune),
                            _buildTechRow(Icons.camera_alt, "بانوراما 360 درجة: غابة ومحيط", goudDune),
                            _buildTechRow(Icons.pets, "يُسمح باصطحاب الكلاب مع ربطها", goudDune),
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

  Widget _buildTranslationLine(String lieu, String analogie, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(lieu, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
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
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}