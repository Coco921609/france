import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlateauMilleEtangsPage extends StatefulWidget {
  const PlateauMilleEtangsPage({super.key});

  @override
  State<PlateauMilleEtangsPage> createState() => _PlateauMilleEtangsPageState();
}

class _PlateauMilleEtangsPageState extends State<PlateauMilleEtangsPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuNordique = Color(0xFF3498DB);

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
                  'assets/image/3.jpg',
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
                        'هضبة الألف بحيرة 🌲',
                        style: GoogleFonts.cinzel(
                          color: bleuNordique,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("المساحة", "أكثر من 220 كم²", bleuNordique),
                      _buildFactLine("التكوين", "جليدي (منذ 12,000 عام)", bleuNordique),

                      const SizedBox(height: 25),
                      Text(
                        "🇫🇮 'فنلندا الصغيرة' في هوت-سون",
                        style: GoogleFonts.montserrat(
                          color: bleuNordique.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "جوهرة طبيعية حقيقية، يكشف هذا الإقليم البري عن مناظر طبيعية خام تذكرنا بـ إسكندنافيا. تشكل هذا المكان الغامض بفعل الجليد وعمل الرهبان، ويدعوك بمسارات المشي العديدة لاستكشاف فسيفساء من الغابات والمسطحات المائية.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول المواسم
                      _buildSectionTitle('📅 أفضل المواسم', bleuNordique),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الموسم', 'الأجواء والنصائح'], isHeader: true, hColor: bleuNordique),
                          _buildTableRow(['🍂 الخريف', 'موصى به: ألوان الأشجار الرائعة والزاهية المنعكسة في الماء']),
                          _buildTableRow(['🌱 الربيع', 'ممتع، استيقاظ الطبيعة والحياة البرية النشطة']),
                          _buildTableRow(['❄️ الشتاء', 'تجنبه: برد قارس جداً، المسارات محتمل أن تكون زلقة أو غير سالكة']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // جدول الأوقات
                      _buildSectionTitle('⏰ الأوقات الموصى بها', bleuNordique),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوقت', 'نصائح'], isHeader: true, hColor: bleuNordique),
                          _buildTableRow(['✨ الصباح', 'موصى به: ضباب غامض فوق البحيرات']),
                          _buildTableRow(['🌅 المساء', 'موصى به: ضوء ناعم وغروب الشمس فوق الماء']),
                          _buildTableRow(['☀️ منتصف النهار / الليل', 'تجنبه: الضوء ساطع جداً خلال النهار، خطر الضياع ليلاً']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معاينة الموقع', bleuNordique),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/image/1.jpg'),
                            _buildGalleryImage('assets/image/5.jpg'),
                            _buildGalleryImage('assets/image/6.jpg'),
                            _buildGalleryImage('assets/image/2.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // معلومات عملية
                      _buildSectionTitle('📋 الأساسيات ومعلومات', bleuNordique),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.map_outlined, "تقع في هوت-سون (بورغوني-فرانش-كونتيه)", bleuNordique),
                            _buildTechRow(Icons.directions_walk, "العديد من مسارات المشي لمسافات طويلة متاحة", bleuNordique),
                            _buildTechRow(Icons.nature, "مناطق برية: غابات ومستنقعات خثية", bleuNordique),
                            _buildTechRow(Icons.camera_alt, "يفضل الخريف للتصوير الفوتوغرافي", bleuNordique),
                            _buildTechRow(Icons.warning_amber_rounded, "تجنب الليل والشتاء العميق", bleuNordique),
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