import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SillansLaCascadePage extends StatefulWidget {
  const SillansLaCascadePage({super.key});

  @override
  State<SillansLaCascadePage> createState() => _SillansLaCascadePageState();
}

class _SillansLaCascadePageState extends State<SillansLaCascadePage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: فيروزي (لون مياه الشلال)
    const Color turquoiseSillans = Color(0xFF1ABC9C);

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
                  'assets/imag/21.jpg',
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
                        'سيلان-لا-كاسكاد 💦',
                        style: GoogleFonts.cinzel(
                          color: turquoiseSillans,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "بروفانس ألب كوت دازور (فار)", turquoiseSillans),
                      _buildFactLine("النوع", "شلال بارتفاع 44 متراً", turquoiseSillans),
                      _buildFactLine("تشبه", "شلالات كركا (كرواتيا 🇭🇷)", turquoiseSillans),

                      const SizedBox(height: 25),
                      Text(
                        "🌴 بحيرة استوائية في قلب منطقة فار",
                        style: GoogleFonts.montserrat(
                          color: turquoiseSillans.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تقدم سيلان-لا-كاسكاد واحدة من أكثر المشاهد الطبيعية إثارة للإعجاب في جنوب فرنسا. تتساقط مياهها الصاخبة من ارتفاع 44 متراً في حوض رائع ذو انعكاسات زمردية وفيروزية، تقع في وسط غابة خضراء مورقة. جوهرة منعشة تحظى بشعبية كبيرة مع قدوم الأيام المشمسة.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول خيارات الزيارة
                      _buildSectionTitle('🚗 خيارات الزيارة', turquoiseSillans),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: turquoiseSillans),
                          _buildTableRow(['🚗 سيارة', 'مواقف مدفوعة عند مدخل القرية (تمتلئ بسرعة في الصيف)']),
                          _buildTableRow(['🥾 مشي', 'مسار محدد بطول 800 متر (حوالي 15 دقيقة) إلى نقطة المشاهدة']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', turquoiseSillans),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/imag/21.webp'),
                            _buildGalleryImage('assets/imag/22.webp'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح للبقاء
                      _buildSectionTitle('📋 نصائح للبقاء', turquoiseSillans),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.not_interested, "السباحة ممنوعة تماماً في الحوض الرئيسي (خطر تساقط الصخور)", turquoiseSillans),
                            _buildTechRow(Icons.security, "ابقَ على المسار المحدد ولا تتجاوز الحواجز", turquoiseSillans),
                            _buildTechRow(Icons.pool, "السباحة مسموح بها فقط في اتجاه مجرى النهر (أسفل النهر)", turquoiseSillans),
                            _buildTechRow(Icons.sunny_snowing, "ازدحام شديد في الصيف: صلِ مبكراً في الصباح للحصول على أفضل إضاءة", turquoiseSillans),
                            _buildTechRow(Icons.hiking, "يُنصح بأحذية مغلقة، المسار قد يكون زلقاً", turquoiseSillans),
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