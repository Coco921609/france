import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class DuneDuPilatPage extends StatefulWidget {
  const DuneDuPilatPage({super.key});

  @override
  State<DuneDuPilatPage> createState() => _DuneDuPilatPageState();
}

class _DuneDuPilatPageState extends State<DuneDuPilatPage> {
  @override
  Widget build(BuildContext context) {
    // تنسيق الألوان: رمال ذهبية
    const Color goudDune = Color(0xFFD4AC0D);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. صورة الخلفية (العلوية)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/sudouest-photo-1-32378160-1600.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. المحتوى القابل للتمرير
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF141619),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'كثيب بيلات 🏖️',
                      style: GoogleFonts.cinzel(
                        color: goudDune,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // الموقع والتشبيه
                    _buildTranslationLine(
                        "حوض أركاشون", "أجواء من الصحراء الكبرى (إفريقيا)", goudDune),

                    const SizedBox(height: 25),

                    Text(
                      "🏜️ أعلى كثيب رملي في أوروبا",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                        color: goudDune.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "ظاهرة طبيعية ضخمة تقع بين المحيط الأطلسي وغابة لاند. يبلغ ارتفاعها أكثر من 100 متر، وتوفر مشهداً صحراوياً مذهلاً وإطلالة فريدة على ممر أركاشون المائي.",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // جدول الفصول
                    _buildSectionTitle('📅 أفضل المواسم', goudDune),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['الفصل', 'الأجواء', 'نصيحة'],
                      ['🌸 الربيع', 'اعتدال', 'مثالي لتجنب الحشود'],
                      ['☀️ الصيف', 'حرارة', 'يُفضل وقت الشروق أو الغروب'],
                      ['🍂 الخريف', 'إضاءة ذهبية', 'الفترة الأكثر ملاءمة للتصوير'],
                      ['❄️ الشتاء', 'طبيعة برية', 'مثالي للاستمتاع بهدوء تام'],
                    ], goudDune),

                    const SizedBox(height: 35),

                    // نصائح الزيارة
                    _buildSectionTitle('💡 نصائح للزيارة', goudDune),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['النوع', 'التوصية'],
                      ['🌅 وقت الغروب', 'أكثر اللحظات سحراً في اليوم'],
                      ['🏃 الصعود', 'يتوفر درج خشبي من أبريل إلى أكتوبر'],
                      ['🌬️ الرياح', 'الرمال قد تكون مزعجة في أيام الرياح القوية'],
                    ], goudDune),

                    const SizedBox(height: 35),

                    // معرض الصور
                    _buildSectionTitle('📸 لمحة عن المكان', goudDune),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/photo-aerienne-dune-du-pilat-277.jpg'),
                          _buildGalleryImage(
                              'assets/images/de-zonsondergang-vanaf-de-dune-du-pilat-frankrijk_32968_ml.jpg'),
                          _buildGalleryImage(
                              'assets/images/panorama-over-de-dune-du-pilat-frankrijk_13655_ml.jpg'),
                          _buildGalleryImage(
                              'assets/images/sudouest-photo-1-32378160-1600.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // معلومات عملية
                    _buildSectionTitle('📋 معلومات عملية', goudDune),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.hiking,
                              "الدخول للكثيب حر ومجاني", goudDune),
                          _buildTechRow(Icons.wb_sunny,
                              "منطقة مكشوفة: يرجى إحضار الماء", goudDune),
                          _buildTechRow(Icons.camera_alt,
                              "بانوراما 360 درجة: غابة ومحيط", goudDune),
                          _buildTechRow(Icons.pets,
                              "يُسمح باصطحاب الكلاب مع ربطها", goudDune),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- مساعدو التصميم ---

  Widget _buildTranslationLine(String lieu, String analogie, Color color) {
    return Wrap(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(lieu,
            style: GoogleFonts.montserrat(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_back, color: Colors.white24, size: 16),
        ),
        Text(analogie,
            style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16),
            softWrap: true),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      textDirection: TextDirection.rtl,
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        int idx = entry.key;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(
                  color: idx == 0 ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight:
                  idx == 0 ? FontWeight.bold : FontWeight.normal,
                ),
                softWrap: true),
          ))
              .toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(title.toUpperCase(),
          style: GoogleFonts.cinzel(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2)),
    );
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTechRow(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(
              child: Text(label,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 13),
                  softWrap: true)),
        ],
      ),
    );
  }
}