import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiguillesBavellaPage extends StatefulWidget {
  const AiguillesBavellaPage({super.key});

  @override
  State<AiguillesBavellaPage> createState() => _AiguillesBavellaPageState();
}

class _AiguillesBavellaPageState extends State<AiguillesBavellaPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: جرانيت وردي / أخضر الصنوبر
    const Color granitBavella = Color(0xFFD35400);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      // إضافة خاصية الاتجاه من اليمين إلى اليسار (RTL) لدعم اللغة العربية بشكل كامل
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
                  'assets/ima/18.jpg',
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
                        'إبر بافيلا 🏔️',
                        style: GoogleFonts.cinzel(
                          color: granitBavella,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "جنوب كورسيكا (كتلة بافيلا الصخرية)", granitBavella),
                      _buildFactLine("النوع", "قمم جرانيتية مسننة", granitBavella),
                      _buildFactLine("تشبه", "جبال الدولوميت (إيطاليا 🇮🇹)", granitBavella),

                      const SizedBox(height: 25),
                      Text(
                        "🪨 الملاذ المعدني في ألتا روكا",
                        style: GoogleFonts.montserrat(
                          color: granitBavella.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تعتبر إبر بافيلا موقعاً أيقونياً في كورسيكا، حيث تشكل جداراً من الجرانيت الوردي الذي يخترق السحاب. بين غابات صنوبر لاريتشيو والمنحدرات الشاهقة، تُعد هذه المنطقة جنة للمتنزهين والمتسلقين ومحبي الطبيعة البرية الباحثين عن الشعور بالقوة الخام لجزيرة الجمال.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', granitBavella),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: granitBavella),
                          _buildTableRow(['🚗 السيارة', 'ممر بافيلا، يمكن الوصول إليه من زونزا أو سولينزارا']),
                          _buildTableRow(['🥾 المشي', 'مسار ثقب القنبلة (Trou de la Bombe) أو مسار GR20']),
                          _buildTableRow(['🧗 التسلق', 'مسارات مرموقة على الجرانيت الخالص']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', granitBavella),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/ima/18.jpg'),
                            _buildGalleryImage('assets/ima/19.jpg'),
                            _buildGalleryImage('assets/ima/22.jpg'),
                            _buildGalleryImage('assets/ima/21.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', granitBavella),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.wb_sunny, "الطقس: يشتهر الممر بتغيراته السريعة، أحضر معك سترة دائماً.", granitBavella),
                            _buildTechRow(Icons.terrain, "التضاريس: مسارات تقنية مليئة بالحجارة، يُنصح بشدة بأحذية المشي المتينة.", granitBavella),
                            _buildTechRow(Icons.landscape, "الإطلالة: مسار ثقب القنبلة هو المسار المميز، ومتاح لجميع المشاة الجيدين.", granitBavella),
                            _buildTechRow(Icons.directions_walk, "GR20: نقطة عبور استراتيجية؛ مزدحمة جداً في الصيف في بعض القطاعات.", granitBavella),
                            _buildTechRow(Icons.photo_size_select_actual, "الإضاءة: تبدو الصخور رائعة في وقت متأخر من بعد الظهر عندما تكتسي باللون الأحمر العميق.", granitBavella),
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
          // استخدام سهم يشير لليسار ليتناسب مع القراءة العربية من اليمين لليسار
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