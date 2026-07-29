import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeMaraisPoitevinPage extends StatefulWidget {
  const LeMaraisPoitevinPage({super.key});

  @override
  State<LeMaraisPoitevinPage> createState() => _LeMaraisPoitevinPageState();
}

class _LeMaraisPoitevinPageState extends State<LeMaraisPoitevinPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أخضر المستنقعات (البندقية الخضراء)
    const Color vertMarais = Color(0xFF43A047);

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
                  'assets/imag/14.webp',
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
                        'ماريه بواتفان 🛶',
                        style: GoogleFonts.cinzel(
                          color: vertMarais,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "نوفيل-أكيتين / باي دو لا لوار", vertMarais),
                      _buildFactLine("اللقب", "البندقية الخضراء", vertMarais),
                      _buildFactLine("تشبه", "جيثورن (هولندا 🇳🇱) / بايو (الولايات المتحدة 🇺🇸)", vertMarais),

                      const SizedBox(height: 25),
                      Text(
                        "🌿 المتاهة المائية الصامتة",
                        style: GoogleFonts.montserrat(
                          color: vertMarais.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "ماريه بواتفان هو مساحة طبيعية خالدة، ومتاهة حقيقية من القنوات الخضراء المورقة المغطاة بعدس الماء. يُطلق عليها اسم البندقية الخضراء، وتوفر أجواءً هادئة وغامضة، مثالية لشحن طاقتك في ظل أشجار الدردار ومراقبة الحياة البرية الاستثنائية في صمت تام.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', vertMarais),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: vertMarais),
                          _buildTableRow(['🚗 سيارة', 'الوصول عبر كولون أو أرسيه (القرى الشهيرة)']),
                          _buildTableRow(['🛶 قارب', 'تأجير مع أو بدون ملاح (النشاط الذي لا بد منه)']),
                          _buildTableRow(['🚲 دراجة', 'أكثر من 800 كم من مسارات الدراجات المسطحة والمجهزة جيداً']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', vertMarais),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/imag/11.jpg'),
                            _buildGalleryImage('assets/imag/11.webp'),
                            _buildGalleryImage('assets/imag/15.jpg'),
                            _buildGalleryImage('assets/imag/14.webp'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', vertMarais),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.bug_report, "طارد البعوض ضروري في الصيف", vertMarais),
                            _buildTechRow(Icons.event_seat, "احجز قاربك مسبقاً خلال موسم الذروة", vertMarais),
                            _buildTechRow(Icons.local_fire_department, "اطلب من الملاح عرض 'النار على الماء'", vertMarais),
                            _buildTechRow(Icons.volume_off, "حافظ على صمت القنوات لمراقبة الحياة البرية", vertMarais),
                            _buildTechRow(Icons.sunny, "ارتدِ قبعة: الانعكاس على الماء قوي", vertMarais),
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