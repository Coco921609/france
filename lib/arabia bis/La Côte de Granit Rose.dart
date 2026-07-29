import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoteGranitRosePage extends StatefulWidget {
  const CoteGranitRosePage({super.key});

  @override
  State<CoteGranitRosePage> createState() => _CoteGranitRosePageState();
}

class _CoteGranitRosePageState extends State<CoteGranitRosePage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: وردي الغرانيت / أزرق البحر
    const Color granitRoseColor = Color(0xFFE5989B);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // 1. صورة الغلاف
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.asset(
                  'assets/ima/34.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // 2. المحتوى
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
                        'ساحل الغرانيت الوردي ⚓',
                        style: GoogleFonts.cinzel(
                          color: granitRoseColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "كوت-د-أرمور (بريتاني)", granitRoseColor),
                      _buildFactLine("الهيكل", "صخور الغرانيت ذات الصبغة الوردية", granitRoseColor),
                      _buildFactLine("تشبه", "سيشل (أفريقيا 🇸🇨)", granitRoseColor),

                      const SizedBox(height: 25),
                      Text(
                        "🪨 فوضى معدنية شكلتها الرياح",
                        style: GoogleFonts.montserrat(
                          color: granitRoseColor.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "يُعد ساحل الغرانيت الوردي أحد أكثر المناظر الطبيعية شهرة في بريتاني. بين بلوماناش وتريبوردين، تغوص صخور ضخمة ذات أشكال غريبة وظلال وردية فريدة في مياه فيروزية. إنه مشهد دائم حيث تلتقي قوة المحيط بصلابة أرض بريتاني.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', granitRoseColor),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: granitRoseColor),
                          _buildTableRow(['🥾 مشي', 'مسار ضباط الجمارك (GR34) لأفضل إطلالة']),
                          _buildTableRow(['🚗 سيارة', 'مواقف السيارات في بلوماناش (مزدحمة جداً في الموسم)']),
                          _buildTableRow(['⛵ بحر', 'جولة بالقارب لرؤية الصخور من زاوية أخرى']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', granitRoseColor),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/ima/35.webp'),
                            _buildGalleryImage('assets/ima/36.webp'),
                            _buildGalleryImage('assets/ima/37.webp'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', granitRoseColor),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.brightness_medium, "الضوء: الصخور تكون رائعة عند الغروب، عندما يشتد اللون الوردي.", granitRoseColor),
                            _buildTechRow(Icons.hiking, "مسار GR34: الجزء بين بلوماناش والمنارة أمر لا بد منه.", granitRoseColor),
                            _buildTechRow(Icons.waves, "المد والجزر: تظهر الصخور وجوهاً مختلفة حسب مستوى البحر.", granitRoseColor),
                            _buildTechRow(Icons.wind_power, "الرياح: جانب البحر معرض للرياح، احضر دائماً سترة حتى في الطقس الجميل.", granitRoseColor),
                            _buildTechRow(Icons.directions_walk, "الاحترام: ابقَ على المسارات المحددة، النباتات الساحلية هشة جداً.", granitRoseColor),
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

  // --- دوال مساعدة ---

  Widget _buildFactLine(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_back, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(value, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16))),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false, Color? hColor}) {
    return TableRow(
      children: cells.map((cell) => Padding(
        padding: const EdgeInsets.all(12),
        child: Text(cell, style: GoogleFonts.montserrat(
          color: isHeader ? hColor : Colors.white70,
          fontSize: 12,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        )),
      )).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cinzel(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsetsDirectional.only(end: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white10,
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
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}