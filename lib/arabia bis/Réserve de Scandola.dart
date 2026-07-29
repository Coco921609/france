import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReserveScandolaPage extends StatefulWidget {
  const ReserveScandolaPage({super.key});

  @override
  State<ReserveScandolaPage> createState() => _ReserveScandolaPageState();
}

class _ReserveScandolaPageState extends State<ReserveScandolaPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أزرق البحر / أحمر الصخر البركاني
    const Color scandolaColor = Color(0xFF4A90E2);

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
                  'assets/ima/39.jpg',
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
                        'محمية سكاندولا 🐠',
                        style: GoogleFonts.cinzel(
                          color: scandolaColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "كورسيكا (المنتزه الطبيعي الإقليمي)", scandolaColor),
                      _buildFactLine("الهيكل", "محمية بحرية وبرية", scandolaColor),
                      _buildFactLine("تشبه", "الجنة على الأرض (اليونسكو 🌍)", scandolaColor),

                      const SizedBox(height: 25),
                      Text(
                        "🌋 الاتحاد المذهل بين النار والماء",
                        style: GoogleFonts.montserrat(
                          color: scandolaColor.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تعد محمية سكاندولا الطبيعية تحفة جيولوجية وبيولوجية. تغطس منحدراتها المصنوعة من البورفير الأحمر في مياه كريستالية محمية، مما يوفر ملاذاً لعقاب النسارية وتنوعاً بيولوجياً بحرياً استثنائياً. موقع بري يتم فيه تنظيم الوصول بصرامة للحفاظ على سلامة النظام البيئي.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول خيارات الزيارة
                      _buildSectionTitle('🚗 خيارات الزيارة', scandolaColor),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: scandolaColor),
                          _buildTableRow(['🛥️ قارب', 'رحلات تنطلق من كالفي، غاليريا، أو بورتو']),
                          _buildTableRow(['🤿 غوص', 'مناطق مرخص بها في محيط المحمية']),
                          _buildTableRow(['🚫 الوصول', 'يُحظر الوصول سيراً على الأقدام داخل المحمية المتكاملة']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', scandolaColor),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/ima/41.webp'),
                            _buildGalleryImage('assets/ima/50.jpg'),
                            _buildGalleryImage('assets/ima/44.webp'),
                            _buildGalleryImage('assets/ima/45.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح للبقاء
                      _buildSectionTitle('📋 نصائح للبقاء', scandolaColor),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.eco, "الحماية: المنطقة محمية؛ لا يُسمح بإزالة أي شيء (نباتات، أحجار، أصداف).", scandolaColor),
                            _buildTechRow(Icons.camera_alt, "التصوير: التباين بين لون الصخر الأحمر وزرقة البحر مثالي للقطات.", scandolaColor),
                            _buildTechRow(Icons.directions_boat, "الحجز: احجز رحلات القوارب مسبقاً، خاصة في يوليو وأغسطس.", scandolaColor),
                            _buildTechRow(Icons.waves, "المراقبة: حافظ على مسافة من الحياة البحرية؛ احترم الهدوء.", scandolaColor),
                            _buildTechRow(Icons.wb_sunny, "الطقس: في حالة اضطراب البحر، يتم إلغاء الرحلات؛ كن مرناً.", scandolaColor),
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