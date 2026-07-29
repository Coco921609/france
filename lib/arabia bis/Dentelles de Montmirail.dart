import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DentellesMontmirailPage extends StatefulWidget {
  const DentellesMontmirailPage({super.key});

  @override
  State<DentellesMontmirailPage> createState() => _DentellesMontmirailPageState();
}

class _DentellesMontmirailPageState extends State<DentellesMontmirailPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أخضر زيتوني / كلسي فاتح
    const Color dentellesColor = Color(0xFF829356);

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
                  'assets/ima/33.jpg',
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
                        'دونتييل دو مونتميراي 🧗',
                        style: GoogleFonts.cinzel(
                          color: dentellesColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "فوكلوز (كتلة دونتييل)", dentellesColor),
                      _buildFactLine("الهيكل", "حواف كلسية مسننة", dentellesColor),
                      _buildFactLine("تشبه", "حديقة كالونك الوطنية (فرنسا 🇫🇷)", dentellesColor),

                      const SizedBox(height: 25),
                      Text(
                        "🌿 الدانتيل الصخري وسط مزارع الكروم",
                        style: GoogleFonts.montserrat(
                          color: dentellesColor.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "ترتفع دونتييل دو مونتميراي من بين مزارع الكروم في جيغونداس وفيكيرا، وهي منحوتات طبيعية حقيقية من الحجر الجيري. توفر هذه الحواف المسننة مشهداً فريداً في بروفنس، حيث يمتزج تسلق الصخور والمشي لمسافات طويلة وتذوق النبيذ المرموق في بيئة استثنائية.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', dentellesColor),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: dentellesColor),
                          _buildTableRow(['🚗 سيارة', 'قرى لافار أو سوزيت كنقاط وصول مركزية']),
                          _buildTableRow(['🥾 مشي', 'الحواف والمسارات في الغابة الوطنية']),
                          _buildTableRow(['🧗 تسلق', 'بقعة رئيسية في جنوب فرنسا']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', dentellesColor),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/ima/30.jpg'),
                            _buildGalleryImage('assets/ima/31.jpg'),
                            _buildGalleryImage('assets/ima/32.jpg'),
                            _buildGalleryImage('assets/ima/33.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', dentellesColor),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.landscape, "بانوراما: توفر جولة الحواف إطلالة خلابة على جبل فانتو.", dentellesColor),
                            _buildTechRow(Icons.wine_bar, "فن الحياة: ادمج رحلتك مع اكتشاف أقبية نبيذ جيغونداس.", dentellesColor),
                            _buildTechRow(Icons.terrain, "التضاريس: قد يكون الحجر الجيري زلقاً؛ اختر أحذية ذات تماسك جيد.", dentellesColor),
                            _buildTechRow(Icons.wb_sunny, "الصيف: التعرض لأشعة الشمس مرتفع؛ يفضل المشي في الصباح لتجنب الحرارة.", dentellesColor),
                            _buildTechRow(Icons.map, "العلامات: على الرغم من وجودها، إلا أن شبكة المسارات كثيفة؛ الخريطة لا تزال مفيدة.", dentellesColor),
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