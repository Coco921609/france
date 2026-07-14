import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class RougierCamaresPage extends StatefulWidget {
  const RougierCamaresPage({super.key});

  @override
  State<RougierCamaresPage> createState() => _RougierCamaresPageState();
}

class _RougierCamaresPageState extends State<RougierCamaresPage> {
  @override
  Widget build(BuildContext context) {
    // اللون المميز: أحمر طوبي / أوكر عميق
    const Color rougeRougier = Color(0xFFB03A2E);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. صورة الخلفية (العلوية)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/large_d-sert-du-rougier-de-camar-s.1619435_91a67ef00c.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. المحتوى القابل للتمرير
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF141619),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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

                    // التشبيه والمكان
                    _buildTranslationLine(
                        "أفيرون", "أجواء من الغرب الأمريكي", rougeRougier),

                    const SizedBox(height: 25),

                    Text(
                      "🇺🇸 كولورادو منطقة أفيرون",
                      textDirection: TextDirection.rtl,
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
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

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
                          _buildGalleryImage(
                              'assets/images/dji_0699--_steloweb---copie_w2000.jpg'),
                          _buildGalleryImage(
                              'assets/images/rougier-960x640.jpg'),
                          _buildGalleryImage(
                              'assets/images/large_d-sert-du-rougier-de-camar-s.1619435_91a67ef00c.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

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
                          _buildTechRow(Icons.map_outlined,
                              "يقع بالقرب من كاماريس", rougeRougier),
                          _buildTechRow(Icons.directions_walk,
                              "مسارات عديدة للمشي لمسافات طويلة", rougeRougier),
                          _buildTechRow(Icons.wb_sunny_outlined,
                              "يرجى إحضار الماء وقبعة", rougeRougier),
                          _buildTechRow(Icons.camera_alt,
                              "منظر طبيعي فريد للتصوير الفوتوغرافي", rougeRougier),
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
    );
  }

  // --- مساعدو التصميم ---

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville,
            style: GoogleFonts.montserrat(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_back, color: Colors.white24, size: 16),
        ),
        Text(analogie,
            style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16),
            softWrap: true),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      textDirection: TextDirection.rtl,
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        int idx = entry.key;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(
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
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(title.toUpperCase(),
          style: GoogleFonts.cinzel(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2)),
    );
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
        textDirection: TextDirection.rtl,
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(
              child: Text(label,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 13),
                  softWrap: true)),
        ],
      ),
    );
  }
}