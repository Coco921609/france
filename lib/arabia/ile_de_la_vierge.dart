import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IleDeLaViergePage extends StatefulWidget {
  const IleDeLaViergePage({super.key});

  @override
  State<IleDeLaViergePage> createState() => _IleDeLaViergePageState();
}

class _IleDeLaViergePageState extends State<IleDeLaViergePage> {
  @override
  Widget build(BuildContext context) {
    const Color turquoiseColor = Color(0xFF40E0D0);

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
                  'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg',
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
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'جزيرة العذراء 🌊',
                          style: GoogleFonts.cinzel(
                            color: turquoiseColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "🏝️ لمسة من الكاريبي في بريتاني",
                          style: GoogleFonts.montserrat(
                            color: turquoiseColor.withOpacity(0.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      Text(
                        "تقع جزيرة العذراء في كرو Zon في بريتاني، وتشتهر بشاطئها الخلاب ذو المياه الكريستالية والرمال البيضاء. هذا المكان، الذي يشبه جزر الكاريبي، غالباً ما يُصنف ضمن أجمل شواطئ أوروبا ويقدم مشهداً طبيعياً بجمال يكاد يكون خيالياً.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // TABLEAU PÉRIODES
                      _buildSectionTitle('📅 أفضل الفترات للزيارة'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الحالة', 'الطقس والألوان'],
                        ['✅ الأفضل', 'من مايو إلى سبتمبر (مياه فيروزية)'],
                        ['🌤️ جيد', 'أبريل وأكتوبر (إضاءة جميلة)'],
                        ['🌧️ حذر', 'الشتاء (رياح قوية وأمطار)'],
                      ], turquoiseColor),

                      const SizedBox(height: 35),

                      // TABLEAU HORAIRES
                      _buildSectionTitle('⏰ الأوقات المنصوح بها'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الوقت', 'نصائح'],
                        ['✨ الصباح', 'مثالي للهدوء (8-10 صباحاً)'],
                        ['☀️ الظهر', 'أقصى إضاءة للمياه الفيروزية'],
                        ['🌅 المساء', 'غروب الشمس فوق المنحدرات'],
                      ], turquoiseColor),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📸 لمحة عن المكان'),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/crique-ile-vierge-crozon.jpg'),
                            _buildGalleryImage('assets/images/1000_F_571714788_cDQWVGIEK8a387ijfVo7Ii6TDqvbT1Ph.jpg'),
                            _buildGalleryImage('assets/images/presqu-ile-de-crozon-1-1200x675.jpeg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📋 إرشادات ومعلومات'),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.cloudy_snowing, "في بريتاني تمطر كثيراً! تحقق جيداً من حالة الطقس ودرجات الحرارة قبل الانطلاق.", turquoiseColor),
                            _buildTechRow(Icons.block, "الوصول إلى الشاطئ ممنوع (لحماية النظام البيئي)", turquoiseColor),
                            _buildTechRow(Icons.waves, "يُمنع السباحة هناك (بسبب عدم استقرار المنحدرات)", turquoiseColor),
                            _buildTechRow(Icons.directions_walk, "يُنصح بارتداء أحذية مشي مريحة", turquoiseColor),
                            _buildTechRow(Icons.camera_alt_outlined, "لا تنسوا إحضار كاميرا التصوير!", turquoiseColor),
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

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: GoogleFonts.cinzel(
            color: const Color(0xFF40E0D0),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Text(label,
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13, height: 1.4)),
          ),
        ],
      ),
    );
  }
}