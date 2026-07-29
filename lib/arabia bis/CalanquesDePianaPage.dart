import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalanquesDePianaPage extends StatefulWidget {
  const CalanquesDePianaPage({super.key});

  @override
  State<CalanquesDePianaPage> createState() => _CalanquesDePianaPageState();
}

class _CalanquesDePianaPageState extends State<CalanquesDePianaPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أحمر/برتقالي (صخور بيانا)
    const Color rougePiana = Color(0xFFE67E22);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      // إضافة خاصية الاتجاه من اليمين إلى اليسار (RTL) لدعم اللغة العربية
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
                  'assets/image/42.jpg',
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
                        'خلجان بيانا ⛰️',
                        style: GoogleFonts.cinzel(
                          color: rougePiana,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "كورسيكا (خليج بورتو)", rougePiana),
                      _buildFactLine("التكوين", "صخور الجرانيت الأحمر", rougePiana),
                      _buildFactLine("تشبه", "برايس كانيون (الولايات المتحدة 🇺🇸)", rougePiana),

                      const SizedBox(height: 25),
                      Text(
                        "🔥 ملاذ الجرانيت الأحمر",
                        style: GoogleFonts.montserrat(
                          color: rougePiana.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "موقع مدرج ضمن التراث العالمي لليونسكو، تشكل خلجان بيانا مشهداً طبيعياً رائعاً من صخور الجرانيت المنحوتة بفعل التعرية. بين زرقة خليج بورتو العميقة ولهيب الصخور الأحمر، يقدم هذا الموقع مشهداً طبيعياً لا يُنسى.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', rougePiana),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: rougePiana),
                          _buildTableRow(['🚗 سيارة', 'طريق D81، إطلالات بانورامية']),
                          _buildTableRow(['🥾 مشي', 'مسار القلعة المحصنة (Château Fort)']),
                          _buildTableRow(['🚢 قارب', 'رحلات بحرية من بورتو أو كارديز']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', rougePiana),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/image/43.webp'),
                            _buildGalleryImage('assets/image/44.webp'),
                            _buildGalleryImage('assets/image/47.webp'),
                            _buildGalleryImage('assets/image/45.jpg'),
                            _buildGalleryImage('assets/image/48.jpg'),
                            _buildGalleryImage('assets/image/49.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', rougePiana),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.wb_sunny, "أشعة الشمس قوية، احمِ نفسك!", rougePiana),
                            _buildTechRow(Icons.directions_car, "الطريق ضيق، كن حذراً عند المرور", rougePiana),
                            _buildTechRow(Icons.camera_alt, "يفضل وقت الغروب لالتقاط الصور", rougePiana),
                            _buildTechRow(Icons.hiking, "أحذية المشي لمسافات طويلة ضرورية", rougePiana),
                            _buildTechRow(Icons.delete_outline, "صفر نفايات: موقع محمي 🙏", rougePiana),
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
          // استخدام سهم يشير لليسار للتوافق مع القراءة العربية من اليمين لليسار
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
      // استخدام EdgeInsetsDirectional لضمان أن المسافات تتوافق مع اتجاه اليمين لليسار
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