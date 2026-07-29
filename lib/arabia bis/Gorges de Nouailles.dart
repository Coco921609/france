import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GorgesNouaillesPage extends StatefulWidget {
  const GorgesNouaillesPage({super.key});

  @override
  State<GorgesNouaillesPage> createState() => _GorgesNouaillesPageState();
}

class _GorgesNouaillesPageState extends State<GorgesNouaillesPage> {
  @override
  Widget build(BuildContext context) {
    const Color vertRiviere = Color(0xFF1ABC9C);

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
                  'assets/image/9.jpg',
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
                        'مضيق نويي 🛶',
                        style: GoogleFonts.cinzel(
                          color: vertRiviere,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("النهر", "لو", vertRiviere),
                      _buildFactLine("العمق", "يصل إلى 350 متراً", vertRiviere),
                      _buildFactLine("يشبه", "وادي نهر تارا (الجبل الأسود 🇲🇪)", vertRiviere),

                      const SizedBox(height: 25),
                      Text(
                        "🦅 وادي دوب المذهل",
                        style: GoogleFonts.montserrat(
                          color: vertRiviere.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تم نحت مضيق نويي بفعل القوة الصاخبة لنهر 'لو'، ويقدم مشهداً طبيعياً مذهلاً من المنحدرات الحادة والطبيعة الخصبة. هذا الوادي الذي يسبب الدوار، والذي يذكرنا بمنطقة البلقان، هو جنة حقيقية للمتنزهين. يكشف عن مسارات شديدة الانحدار وإطلالات رائعة في قلب جبال جورا.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الفصول
                      _buildSectionTitle('📅 أفضل المواسم', vertRiviere),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الموسم', 'الأجواء والنصائح'], isHeader: true, hColor: vertRiviere),
                          _buildTableRow(['🌱 الربيع', 'موصى به: تدفق الشلالات المثير والطبيعة الخصبة']),
                          _buildTableRow(['🍂 الخريف', 'موصى به: ألوان ذهبية ونحاسية رائعة على المنحدرات']),
                          _buildTableRow(['❄️ الشتاء', 'تجنب: المسارات زلقة جداً، جليدية، وخطيرة قرب الحافة']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // جدول الأوقات
                      _buildSectionTitle('⏰ الأوقات الموصى بها', vertRiviere),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوقت', 'نصائح'], isHeader: true, hColor: vertRiviere),
                          _buildTableRow(['✨ الصباح', 'موصى به: الانتعاش وضوء جميل يخترق ضباب الوادي']),
                          _buildTableRow(['☀️ بعد الظهر', 'ممتع: مثالي لإكمال رحلة التنزه الطويلة']),
                          _buildTableRow(['🌙 الليل', 'تجنب: تضاريس شديدة الانحدار، خطيرة جداً في الظلام']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 نظرة عامة على الموقع', vertRiviere),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/image/7.jpg'),
                            _buildGalleryImage('assets/image/8.webp'),
                            _buildGalleryImage('assets/image/9.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // معلومات أساسية
                      _buildSectionTitle('📋 الأساسيات ومعلومات', vertRiviere),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.map_outlined, "تقع بالقرب من موتييه-أوت-بيير (دوب)", vertRiviere),
                            _buildTechRow(Icons.directions_walk, "رحلات تقنية (أحذية جيدة إلزامية)", vertRiviere),
                            _buildTechRow(Icons.water_drop, "إطلالات مذهلة على النهر", vertRiviere),
                            _buildTechRow(Icons.warning_amber_rounded, "احذر من المسارات التي تكون ضيقة أحياناً وتسبب الدوار", vertRiviere),
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