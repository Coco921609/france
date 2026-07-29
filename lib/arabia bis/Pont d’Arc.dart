import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PontDArcPage extends StatefulWidget {
  const PontDArcPage({super.key});

  @override
  State<PontDArcPage> createState() => _PontDArcPageState();
}

class _PontDArcPageState extends State<PontDArcPage> {
  @override
  Widget build(BuildContext context) {
    const Color vertArdeche = Color(0xFF16A085);

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
                  'assets/image/22.jpg',
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
                        'جسر القوس (Pont d\'Arc) 🇫🇷',
                        style: GoogleFonts.cinzel(
                          color: vertArdeche,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الأبعاد", "ارتفاع 54 متر، عرض 60 متر", vertArdeche),
                      _buildFactLine("التكوين", "نحته نهر الأرديش", vertArdeche),
                      _buildFactLine("تشبه", "أنهار الكارست (فرنسا 🇫🇷)", vertArdeche),

                      const SizedBox(height: 25),
                      Text(
                        "🇫🇷 جوهرة جيولوجية بلمسة فرنسية",
                        style: GoogleFonts.montserrat(
                          color: vertArdeche.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "يعتبر جسر القوس قوساً طبيعياً مهيباً نُحت على مدى آلاف السنين، وهو البوابة الأثرية لمضايق الأرديش. مع منحدراته الجيرية المذهلة التي تغطس في مياه زمردية، تذكرنا هذه التحفة الطبيعية بمناظر الكارست الخلابة والأنهار الصافية في فرنسا.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول المواسم
                      _buildSectionTitle('📅 أفضل المواسم', vertArdeche),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الموسم', 'الأجواء والنصائح'], isHeader: true, hColor: vertArdeche),
                          _buildTableRow(['🌱 الربيع', 'موصى به: طبيعة خضراء، مياه جارية للتجديف، وازدحام أقل']),
                          _buildTableRow(['🍂 الخريف', 'موصى به: ألوان جميلة، مناخ معتدل، وهدوء رائع']),
                          _buildTableRow(['☀️ الصيف', 'تجنبه: إلا إذا كنت تحب الازدحام. اختناقات في قوارب التجديف وشواطئ مشبعة']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // جدول الأوقات
                      _buildSectionTitle('⏰ الأوقات الموصى بها', vertArdeche),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوقت', 'نصائح'], isHeader: true, hColor: vertArdeche),
                          _buildTableRow(['✨ الصباح الباكر', 'موصى به: مياه تشبه المرآة، ضوء ناعم، وهدوء تام على الشاطئ']),
                          _buildTableRow(['🌅 نهاية اليوم', 'موصى به: الصخرة تضاء باللون البرتقالي والسياح يغادرون المنطقة']),
                          _buildTableRow(['☀️ بعد الظهر', 'تجنبه: حرارة خانقة (خاصة في الصيف) وضجيج مستمر']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معاينة الموقع', vertArdeche),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/image/18.webp'),
                            _buildGalleryImage('assets/image/17.webp'),
                            _buildGalleryImage('assets/image/20.jpg'),
                            _buildGalleryImage('assets/image/21.jpg'),
                            _buildGalleryImage('assets/image/23.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // معلومات عملية
                      _buildSectionTitle('📋 الأساسيات ومعلومات', vertArdeche),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.map_outlined, "تقع في فالون-بون-دارك (الأرديش)", vertArdeche),
                            _buildTechRow(Icons.kayaking, "مرور قوارب التجديف (الكاياك) تحت القوس أمر لا بد منه", vertArdeche),
                            _buildTechRow(Icons.pool, "شاطئان مجهزان للسباحة عند سفح القوس", vertArdeche),
                            _buildTechRow(Icons.wb_sunny, "احضر واقي الشمس وكمية وافرة من الماء في الصيف", vertArdeche),
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