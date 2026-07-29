import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GorgesDuTarnPage extends StatefulWidget {
  const GorgesDuTarnPage({super.key});

  @override
  State<GorgesDuTarnPage> createState() => _GorgesDuTarnPageState();
}

class _GorgesDuTarnPageState extends State<GorgesDuTarnPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: مغرة/نهر (كلس المنحدرات والمياه الحية)
    const Color ocreTarn = Color(0xFFD35400);

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
                  'assets/imag/35.webp',
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
                        'مضيق تارن 🛶',
                        style: GoogleFonts.cinzel(
                          color: ocreTarn,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "أوكسيتاني (لوزير)", ocreTarn),
                      _buildFactLine("النوع", "وادي نحته نهر تارن", ocreTarn),
                      _buildFactLine("يشبه", "الأخدود العظيم (الولايات المتحدة 🇺🇸)", ocreTarn),

                      const SizedBox(height: 25),
                      Text(
                        "🏔️ الوادي المهيب بين كوسي وسيفين",
                        style: GoogleFonts.montserrat(
                          color: ocreTarn.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "يمتد مضيق تارن لمسافة 53 كيلومتراً، ويقدم مشهداً طبيعياً يخطف الأنفاس. بين المنحدرات الكلسية الشاهقة لـ 'كوس ميجان' و'كوس دو سوفيتير'، يتعرج نهر تارن عبر وادٍ محمٍ، مدرج ضمن قائمة اليونسكو للتراث العالمي. مكان فريد لعشاق المغامرة والباحثين عن المناظر الطبيعية العظيمة.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', ocreTarn),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: ocreTarn),
                          _buildTableRow(['🚗 سيارة', 'طريق ذو مناظر طبيعية بمحاذاة التارن (ضيق في بعض الأماكن)']),
                          _buildTableRow(['🛶 قوارب', 'تأجير في لا مالين أو لي فيني: ضروري']),
                          _buildTableRow(['🥾 مشي', 'مسارات مذهلة تنطلق من القرى الكهفية']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', ocreTarn),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/imag/36.jpg'),
                            _buildGalleryImage('assets/imag/37.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', ocreTarn),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.kayaking, "رحلة القوارب: احجز اليوم كاملاً للاستمتاع بالهدوء", ocreTarn),
                            _buildTechRow(Icons.castle, "زر القرى المصنفة مثل كاستيلبوك أو سانت إينيمي", ocreTarn),
                            _buildTechRow(Icons.wb_sunny, "حرارة شديدة: الصخور تسخن بشكل كبير في الصيف، احمِ نفسك", ocreTarn),
                            _buildTechRow(Icons.camera_alt, "إطلالة 'بوينت سوبليم' ضرورية عند الغروب", ocreTarn),
                            _buildTechRow(Icons.hiking, "المشي: مسارات الانهيارات الأرضية قد تكون مغلقة، تحقق مع مكتب السياحة", ocreTarn),
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