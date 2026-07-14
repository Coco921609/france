import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class PontDuGardPage extends StatefulWidget {
  const PontDuGardPage({super.key});

  @override
  State<PontDuGardPage> createState() => _PontDuGardPageState();
}

class _PontDuGardPageState extends State<PontDuGardPage> {
  @override
  Widget build(BuildContext context) {
    const Color pierreRomaine = Color(0xFFD4A373);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0C0E),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Image.asset(
                'assets/images/6.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey[900]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.62,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF141619),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'جسر جارد 🏛️',
                        style: GoogleFonts.cairo(
                          color: pierreRomaine,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildTranslationLine(
                          "أوكستيني", "لمسة من الكولوسيوم (إيطاليا)", pierreRomaine),
                      const SizedBox(height: 25),
                      Text(
                        "🇮🇹 تحفة العصر الروماني",
                        style: GoogleFonts.cairo(
                          color: pierreRomaine.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "قناة مائية رومانية استثنائية من ثلاثة مستويات تعبر نهر جاردون. شهادة عظيمة على عبقرية العمارة القديمة.",
                        style: GoogleFonts.cairo(
                            color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),
                      _buildSectionTitle('أفضل الفصول للزيارة', pierreRomaine),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الفصل', 'الجو والنصائح'],
                        ['🍂 الخريف', 'ألوان دافئة وإضاءة مائلة رائعة'],
                        ['☀️ الصيف', 'سباحة ونزهات بجانب الماء'],
                        ['🌱 الربيع', 'مثالي للهدوء والطبيعة'],
                        ['❄️ الشتاء', 'يُفضل تجنبه (رياح وبرد)'],
                      ], pierreRomaine),
                      const SizedBox(height: 35),
                      _buildSectionTitle('التصوير والأوقات', pierreRomaine),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الوقت', 'التوصية'],
                        ['🌅 شروق الشمس', 'إضاءة ذهبية استثنائية'],
                        ['🌇 غروب الشمس', 'انعكاسات رائعة على نهر جاردون'],
                        ['📸 الكاميرا', 'يوصى باستخدام حامل ثلاثي للتعرض الطويل'],
                      ], pierreRomaine),
                      const SizedBox(height: 35),
                      _buildSectionTitle('💡 حقائق ومعلومات', pierreRomaine),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(
                              Icons.architecture,
                              "بُني في القرن الأول الميلادي لتزويد مدينة نيم بالمياه.",
                              pierreRomaine,
                            ),
                            _buildTechRow(
                              Icons.straighten,
                              "يبلغ ارتفاعه 48 متراً، مما يجعله أعلى جسر بقناة مائية رومانية في العالم.",
                              pierreRomaine,
                            ),
                            _buildTechRow(
                              Icons.nature_people,
                              "تحيط به مساحات طبيعية محمية مثالية للاسترخاء.",
                              pierreRomaine,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
                      _buildSectionTitle('نظرة عامة على المكان', pierreRomaine),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/4.jpg'),
                            _buildGalleryImage('assets/images/30.jpg'),
                            _buildGalleryImage('assets/images/35.jpg'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
                      _buildSectionTitle('معلومات أساسية', pierreRomaine),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.camera_enhance_outlined,
                                "الكاميرا ضرورية", pierreRomaine),
                            _buildTechRow(Icons.map_outlined,
                                "يقع بالقرب من فير-بون-دو-جارد", pierreRomaine),
                            _buildTechRow(Icons.directions_car,
                                "رسوم مواقف للسيارات (تُتحقق من الموقع)", pierreRomaine),
                            _buildTechRow(Icons.euro_symbol,
                                "رسوم الدخول: تختلف حسب الموسم", pierreRomaine),
                            _buildTechRow(Icons.auto_awesome,
                                "موقع تراث عالمي لليونسكو", pierreRomaine),
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
      ),
    );
  }

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville,
            style: GoogleFonts.cairo(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
        ),
        Text(analogie,
            style: GoogleFonts.cairo(color: Colors.white70, fontSize: 16),
            softWrap: true),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        int idx = entry.key;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                style: GoogleFonts.cairo(
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
    return Text(title.toUpperCase(),
        style: GoogleFonts.cairo(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 15),
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
                  style: GoogleFonts.cairo(color: Colors.white, fontSize: 13),
                  softWrap: true)),
        ],
      ),
    );
  }
}