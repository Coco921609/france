import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuatreLacsPage extends StatefulWidget {
  const QuatreLacsPage({super.key});

  @override
  State<QuatreLacsPage> createState() => _QuatreLacsPageState();
}

class _QuatreLacsPageState extends State<QuatreLacsPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuLoch = Color(0xFF2874A6);

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
                  'assets/image/11.jpg',
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
                        'البحيرات الأربع 🏴󠁧󠁢󠁳󠁣󠁴󠁿',
                        style: GoogleFonts.cinzel(
                          color: bleuLoch,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الأسماء", "إيلاي، نارلاي، بوتي ماكلو وكغون ماكلو", bleuLoch),
                      _buildFactLine("نقطة المشاهدة", "مطل قمة النسر (Pic de l'Aigle)", bleuLoch),
                      _buildFactLine("تشبه", "مرتفعات اسكتلندا 🏴󠁧󠁢󠁳󠁣󠁴󠁿", bleuLoch),

                      const SizedBox(height: 25),
                      Text(
                        "🏴󠁧󠁢󠁳󠁣󠁴󠁿 'اسكتلندا الصغيرة' في قلب منطقة الجورا",
                        style: GoogleFonts.montserrat(
                          color: bleuLoch.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تُلقب منطقة البحيرات الأربع بـ 'اسكتلندا الصغيرة'، وتوفر بانوراما خلابة. محاطة بغابات التنوب الكثيفة، تتكشف هذه الجواهر الجليدية ذات المياه الزمردية والفيروزية بشكل مذهل من قمة 'بيك دو ليغل'، في أجواء غامضة تستحق المرتفعات الاسكتلندية.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول المواسم
                      _buildSectionTitle('📅 أفضل المواسم', bleuLoch),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الموسم', 'الأجواء والنصائح'], isHeader: true, hColor: bleuLoch),
                          _buildTableRow(['🍂 الخريف', 'موصى به: ضباب الصباح، ألوان الخريف، وأجواء اسكتلندية 100%']),
                          _buildTableRow(['☀️ الصيف', 'ممتع للمشي لمسافات طويلة، لكن نقاط المشاهدة تكون مزدحمة جداً']),
                          _buildTableRow(['❄️ الشتاء', 'تجنبه (أو كن حذراً): مسارات قمة النسر ثلجية ومجلدة أحياناً']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // جدول الأوقات
                      _buildSectionTitle('⏰ الأوقات الموصى بها', bleuLoch),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوقت', 'نصائح'], isHeader: true, hColor: bleuLoch),
                          _buildTableRow(['✨ الصباح', 'موصى به: ساحر مع الضباب الذي يعلو البحيرات']),
                          _buildTableRow(['🌅 المساء', 'موصى به: ألوان غروب الشمس الدافئة من نقطة المشاهدة']),
                          _buildTableRow(['🌙 الليل', 'تجنبه: مناطق غير مضاءة، خطر السقوط على الحواف']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معاينة الموقع', bleuLoch),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/image/10.jpg'),
                            _buildGalleryImage('assets/image/12.jpg'),
                            _buildGalleryImage('assets/image/15.jpeg'),
                            _buildGalleryImage('assets/image/17.jpg'),
                            _buildGalleryImage('assets/image/14.webp'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // معلومات عملية
                      _buildSectionTitle('📋 الأساسيات ومعلومات', bleuLoch),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.map_outlined, "تقع في مقاطعة الجورا", bleuLoch),
                            _buildTechRow(Icons.directions_walk, "رحلة مشي أساسية إلى مطل البحيرات الأربع", bleuLoch),
                            _buildTechRow(Icons.do_not_disturb_alt, "السباحة غالباً ما تكون منظمة أو ممنوعة للحفاظ على الموقع", bleuLoch),
                            _buildTechRow(Icons.camera_alt, "موقع استثنائي لتصوير المناظر الطبيعية", bleuLoch),
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