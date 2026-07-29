import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDooPage extends StatefulWidget {
  const LacDooPage({super.key});

  @override
  State<LacDooPage> createState() => _LacDooPageState();
}

class _LacDooPageState extends State<LacDooPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أزرق جبال الألب (مياه الذوبان وبحيرات الجبال)
    const Color bleuAlpin = Color(0xFF2874A6);

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
                  'assets/imag/4.webp',
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
                        "بحيرة دو 💧",
                        style: GoogleFonts.cinzel(
                          color: bleuAlpin,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "أوكسيتاني (هوت غارون، بيرينيه)", bleuAlpin),
                      _buildFactLine("النوع", "بحيرة جليدية وسد", bleuAlpin),
                      _buildFactLine("تشبه", "بحيرة برايس (الدولوميت 🇮🇹)", bleuAlpin),

                      const SizedBox(height: 25),
                      Text(
                        "🏔️ جوهرة بيرينيه تزداد جمالاً في الخريف",
                        style: GoogleFonts.montserrat(
                          color: bleuAlpin.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تشتهر بحيرة دو بشلالها المذهل الذي يبلغ ارتفاعه 275 متراً، وهي وجهة تسلق لا غنى عنها في جبال البيرينيه. يُنصح بزيارة هذا الموقع الاستثنائي بشكل خاص في فصل الخريف: حيث تتزين الغابات المحيطة بألوان دافئة ورائعة، مما يخلق تبايناً مذهلاً وساحراً مع زرقة المياه العميقة.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', bleuAlpin),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: bleuAlpin),
                          _buildTableRow(['🚗 سيارة', 'موقف سيارات مجاني في غرانج داستو (نقطة الانطلاق)']),
                          _buildTableRow(['🥾 مشي', 'عبر مسار GR10 (حوالي ساعة إلى ساعة ونصف من الصعود الميسر)']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', bleuAlpin),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/imag/3.jpg'),
                            _buildGalleryImage('assets/imag/5.webp'),
                            _buildGalleryImage('assets/imag/2.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', bleuAlpin),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.park, "الخريف ساحر: ألوان أشجار خلابة", bleuAlpin),
                            _buildTechRow(Icons.hiking, "يُنصح بأحذية المشي (مسار صخري)", bleuAlpin),
                            _buildTechRow(Icons.ac_unit, "طقس جبلي: احضر ملابس دافئة", bleuAlpin),
                            _buildTechRow(Icons.not_interested, "السباحة ممنوعة (بحيرة سد ومياه باردة جداً)", bleuAlpin),
                            _buildTechRow(Icons.restaurant, "ملجأ بجانب البحيرة لاستراحة مستحقة", bleuAlpin),
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