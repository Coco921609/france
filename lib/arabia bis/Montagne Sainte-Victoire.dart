import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MontagneSainteVictoirePage extends StatefulWidget {
  const MontagneSainteVictoirePage({super.key});

  @override
  State<MontagneSainteVictoirePage> createState() => _MontagneSainteVictoirePageState();
}

class _MontagneSainteVictoirePageState extends State<MontagneSainteVictoirePage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: مغرة/تراكوتا (صخرة الحجر الجيري تحت شمس بروفانس)
    const Color ocreSainteVictoire = Color(0xFFD35400);

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
                  'assets/ima/1.png',
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
                        'جبل سانت فيكتوار 🎨',
                        style: GoogleFonts.cinzel(
                          color: ocreSainteVictoire,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "بوش دو رون (إيكس أون بروفانس)", ocreSainteVictoire),
                      _buildFactLine("النوع", "سلسلة صخرية جيرية بطول 18 كم", ocreSainteVictoire),
                      _buildFactLine("تشبه", "جبال الأطلس (المغرب 🇲🇦)", ocreSainteVictoire),

                      const SizedBox(height: 25),
                      Text(
                        "☀️ صخرة بول سيزان الملهمة",
                        style: GoogleFonts.montserrat(
                          color: ocreSainteVictoire.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "يهيمن جبل سانت فيكتوار على مشهد إيكس بصورته الضخمة، وهو نصب طبيعي لبروفانس. جدرانه الجيرية النقية، التي تتحول إلى اللون الوردي والمغرة حسب الضوء، أبهرت بول سيزان، الذي رسمها عشرات المرات. ملعب مثالي للمشي لمسافات طويلة، غارق في الأدغال والتاريخ.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', ocreSainteVictoire),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: ocreSainteVictoire),
                          _buildTableRow(['🚗 سيارة', 'مواقف السيارات متوفرة في لو تولونيه أو فووفينارغ (مزدحمة جداً)']),
                          _buildTableRow(['🥾 مشي', 'مسارات عديدة (GR9) باتجاه صليب بروفانس']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', ocreSainteVictoire),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/ima/1.png'),
                            _buildGalleryImage('assets/ima/2.webp'),
                            _buildGalleryImage('assets/ima/3.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', ocreSainteVictoire),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.wb_twilight, "شروق/غروب الشمس: لحظة ساحرة تتحول فيها الصخرة إلى اللون البرتقالي المتوهج.", ocreSainteVictoire),
                            _buildTechRow(Icons.fire_truck, "الوصول صيفاً مقيد: تحقق دائماً من خطر الحريق قبل المغادرة.", ocreSainteVictoire),
                            _buildTechRow(Icons.local_drink, "لا توجد مصادر مياه: أحضر احتياطياً كافياً، حتى للمشي القصير.", ocreSainteVictoire),
                            _buildTechRow(Icons.air, "رياح الميسترال يمكن أن تهب بعنف على القمم: كن حذراً.", ocreSainteVictoire),
                            _buildTechRow(Icons.sunny, "لا ظل في المسارات: القبعة والحماية من الشمس ضرورية.", ocreSainteVictoire),
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