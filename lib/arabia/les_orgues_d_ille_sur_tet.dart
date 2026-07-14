import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class OrguesIlleSurTetPage extends StatefulWidget {
  const OrguesIlleSurTetPage({super.key});

  @override
  State<OrguesIlleSurTetPage> createState() => _OrguesIlleSurTetPageState();
}

class _OrguesIlleSurTetPageState extends State<OrguesIlleSurTetPage> {
  @override
  Widget build(BuildContext context) {
    // تنسيق الألوان: لون الأوكر / الطين النضيج
    const Color ocreDesert = Color(0xFFD35400);

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
              'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.grey[900]),
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
                      "أعمدة إيل الصخرية 🏜️",
                      style: GoogleFonts.cinzel(
                        color: ocreDesert,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    _buildTranslationLine(
                        "إيل سور تيت", "أجواء من كبادوكيا (تركيا)", ocreDesert),

                    const SizedBox(height: 25),

                    Text(
                      "🇹🇷 الغرب الأمريكي في البرانس الشرقية",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                        color: ocreDesert.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "منظر طبيعي صخري فريد من نوعه في فرنسا. هذه 'مداخن الجنيات' التي نحتتها عوامل التعرية توفر ديكوراً يشبه سطح القمر، يذكرنا بالأودية الأمريكية أو منطقة كبادوكيا.",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('📅 المواسم والفترات', ocreDesert),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['الفترة', 'التوصية'],
                      ['🌸 الربيع', 'مثالي (مناخ معتدل وإضاءة جميلة)'],
                      ['🍂 الخريف', 'ينصح به (ألوان أوكر متوهجة)'],
                      ['☀️ الصيف', 'يُفضل تجنبه بعد الظهر (حرارة شديدة)'],
                      ['❄️ الحور', 'ممكن (إطلالة واضحة على جبل كانيغو)'],
                    ], ocreDesert),

                    const SizedBox(height: 35),

                    _buildSectionTitle('🕓 المواعيد والمدة', ocreDesert),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['النوع', 'معلومات'],
                      ['جولة حرة', 'حوالي 45 دقيقة إلى ساعة ونصف'],
                      ['آخر دخول', 'قبل ساعة من إغلاق الموقع'],
                      ['نصيحة', 'يُفضل الصباح لتجنب الانتظار'],
                    ], ocreDesert),

                    const SizedBox(height: 35),

                    // --- قسم الأسعار ---
                    _buildSectionTitle('🎟️ الأسعار', ocreDesert),
                    const SizedBox(height: 10),
                    Text(
                      "⚠️ تنبيه: الأسعار تقريبية وقد تختلف حسب الموسم أو السنة.",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                          color: Colors.white54,
                          fontSize: 13,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['الفئة', 'السعر'],
                      ['بالغ (سعر كامل)', '5.00 €'],
                      ['سعر مخفض*', '4.00 €'],
                      ['طفل (10-13 سنة)', '3.50 €'],
                      ['أقل من 10 سنوات', 'مجاني'],
                    ], ocreDesert),
                    const SizedBox(height: 10),
                    Text(
                      "*السعر المخفض: يتطلب إثباتاً (للمراهقين، الطلاب، والباحثين عن عمل).",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                          color: Colors.white70, fontSize: 12),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 معرض الصور', ocreDesert),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg'),
                          _buildGalleryImage(
                              'assets/images/108ff4_42ce7b69795d4eb78a54e21727265149~mv2.avif'),
                          _buildGalleryImage('assets/images/orgues-ille-sur-tet-55.jpg'),
                          _buildGalleryImage(
                              'assets/images/visiter-orgues-illes-sur-tet-camping-latour-de-france-commune-pyrenees-orientales.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 معلومات عملية', ocreDesert),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.confirmation_number_outlined,
                              "ينصح بالشراء عبر الإنترنت", ocreDesert),
                          _buildTechRow(Icons.timer_outlined,
                              "توقع حوالي ساعة من المشي", ocreDesert),
                          _buildTechRow(Icons.wb_sunny_outlined,
                              "الظل قليل، يرجى إحضار الماء", ocreDesert),
                          _buildTechRow(Icons.camera_enhance_outlined,
                              "إضاءة مثالية في نهاية اليوم", ocreDesert),
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

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville,
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
      width: 250,
      margin: const EdgeInsets.only(left: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.white10,
            child: const Icon(Icons.broken_image, color: Colors.white24),
          ),
        ),
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