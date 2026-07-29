import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDeCapitelloPage extends StatefulWidget {
  const LacDeCapitelloPage({super.key});

  @override
  State<LacDeCapitelloPage> createState() => _LacDeCapitelloPageState();
}

class _LacDeCapitelloPageState extends State<LacDeCapitelloPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أزرق عميق
    const Color bleuCapitello = Color(0xFF1B4F72);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0C0E),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // 1. صورة الغلاف
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.asset(
                  'assets/imag/9.jpg',
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
                        'بحيرة كابيتيلو ⛰️',
                        style: GoogleFonts.cairo(
                          color: bleuCapitello,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "كورسيكا (وادي ريستونيكا)", bleuCapitello),
                      _buildFactLine("النوع", "بحيرة جليدية (ارتفاع 1930 متر)", bleuCapitello),
                      _buildFactLine("يشبه", "بحيرة سورابيس (دولوميت 🇮🇹)", bleuCapitello),

                      const SizedBox(height: 25),
                      Text(
                        "❄️ جوهرة الجليد في جبال كورسيكا",
                        style: GoogleFonts.cairo(
                          color: bleuCapitello.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تقع بحيرة كابيتيلو على ارتفاع أكثر من 1900 متر، وهي أعمق بحيرة في كورسيكا. محاطة بمنحدرات الجرانيت الشاهقة التي تغوص في مياهها الزرقاء الداكنة، تظل هذه البحيرة الجليدية متجمدة غالباً حتى بداية الصيف. إنها مكافأة مذهلة للمتنزهين ذوي الخبرة.",
                        style: GoogleFonts.cairo(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الزيارة
                      _buildSectionTitle('🚗 خيارات الزيارة', bleuCapitello),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: bleuCapitello),
                          _buildTableRow(['🚗 سيارة', 'حتى مراعي غروتيل (موقف مدفوع، طريق ضيق)']),
                          _buildTableRow(['🥾 تنزه', 'من بحيرة ميلو: صعود حاد (حوالي 45 دقيقة إضافية)']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', bleuCapitello),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/imag/7.jpg'),
                            _buildGalleryImage('assets/imag/8.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح السلامة
                      _buildSectionTitle('📋 نصائح السلامة', bleuCapitello),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.hiking, "مستوى صعب: مسارات مجهزة بالسلاسل والسلالم", bleuCapitello),
                            _buildTechRow(Icons.snowing, "وجود ثلوج ممكن حتى يوليو، كن حذراً", bleuCapitello),
                            _buildTechRow(Icons.not_interested, "السباحة غير مستحسنة (مياه متجمدة)", bleuCapitello),
                            _buildTechRow(Icons.water_drop, "احمل الكثير من الماء، لا توجد ينابيع بعد ميلو", bleuCapitello),
                            _buildTechRow(Icons.wb_cloudy, "انطلق مبكراً: العواصف شائعة بعد الظهر", bleuCapitello),
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
          Text(label, style: GoogleFonts.cairo(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_back, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(value, style: GoogleFonts.cairo(color: Colors.white70, fontSize: 16))),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false, Color? hColor}) {
    return TableRow(
      children: cells.map((cell) => Padding(
        padding: const EdgeInsets.all(12),
        child: Text(cell, style: GoogleFonts.cairo(
          color: isHeader ? hColor : Colors.white70,
          fontSize: 12,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        )),
      )).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cairo(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
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
          Expanded(child: Text(label, style: GoogleFonts.cairo(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}