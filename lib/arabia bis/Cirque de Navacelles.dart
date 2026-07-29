import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CirqueNavacellesPage extends StatefulWidget {
  const CirqueNavacellesPage({super.key});

  @override
  State<CirqueNavacellesPage> createState() => _CirqueNavacellesPageState();
}

class _CirqueNavacellesPageState extends State<CirqueNavacellesPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: رمادي كلسي / أخضر الوادي
    const Color navacellesColor = Color(0xFF7F8C8D);

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
                  'assets/ima/26.jpg',
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
                        'سيرك نافاسيل 🍃',
                        style: GoogleFonts.cinzel(
                          color: navacellesColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "غارد / هيرولت (سيفين)", navacellesColor),
                      _buildFactLine("الهيكل", "تعرج أحفوري لوادي فيس", navacellesColor),
                      _buildFactLine("تشبه", "مضيق فيردون (فرنسا 🇫🇷)", navacellesColor),

                      const SizedBox(height: 25),
                      Text(
                        "🌊 التحفة التي نحتها النهر",
                        style: GoogleFonts.montserrat(
                          color: navacellesColor.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "يُعد سيرك نافاسيل تعرجاً قديماً لنهر فيس، وهو موقع جيولوجي فريد. من خلال اختراق الحجر الجيري، ترك النهر مجراه القديم ليخلق هذا المدرج الطبيعي المذهل. تبدو قرية نافاسيل، التي تقع في قلب هذا السيرك، وكأنها محمية من الزمن بفضل جدرانها الشاهقة والمنحدرة.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', navacellesColor),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: navacellesColor),
                          _buildTableRow(['🚗 سيارة', 'شرفات بلانداس للحصول على إطلالة بانورامية']),
                          _buildTableRow(['🥾 مشي', 'مسارات شديدة الانحدار تنزل إلى النهر (فيس)']),
                          _buildTableRow(['🚲 دراجة', 'مسارات على هضبة لارزاك']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', navacellesColor),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/ima/26.jpg'),
                            _buildGalleryImage('assets/ima/25.jpg'),
                            _buildGalleryImage('assets/ima/28.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', navacellesColor),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.camera_alt, "الشرفات: لا تفوت إطلالات بلانداس، فهي ضرورية لفهم حجم السيرك.", navacellesColor),
                            _buildTechRow(Icons.terrain, "النزول: الصعود مرة أخرى من القرية شاق، أحضر أحذية جيدة.", navacellesColor),
                            _buildTechRow(Icons.waves, "نهر فيس: المياه منعشة، لحظة هدوء صافٍ في قاع السيرك.", navacellesColor),
                            _buildTechRow(Icons.sunny, "الظل: تخلق الجدران مناطق مظللة، لكن الهضبة معرضة لشمس شديدة.", navacellesColor),
                            _buildTechRow(Icons.directions_car, "مواقف السيارات: مزدحمة جداً في الصيف، حاول الوصول في الصباح الباكر.", navacellesColor),
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