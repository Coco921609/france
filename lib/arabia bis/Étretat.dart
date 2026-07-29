import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EtretatPage extends StatefulWidget {
  const EtretatPage({super.key});

  @override
  State<EtretatPage> createState() => _EtretatPageState();
}

class _EtretatPageState extends State<EtretatPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: الطباشير والبحر (نغمات ناعمة ومعدنية)
    const Color etretatColor = Color(0xFF607D8B);

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
                  'assets/imag/31.jpg',
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
                        'إيترتات 🌊',
                        style: GoogleFonts.cinzel(
                          color: etretatColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "نورماندي (سين ماريتيم)", etretatColor),
                      _buildFactLine("الهيكل", "جرف أفال، جرف أمون، ومانبورت", etretatColor),
                      _buildFactLine("تشبه", "الساحل الجوراسي (المملكة المتحدة 🇬🇧)", etretatColor),

                      const SizedBox(height: 25),
                      Text(
                        "🎨 جوهر إضاءة المدرسة الانطباعية",
                        style: GoogleFonts.montserrat(
                          color: etretatColor.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تشتهر إيترتات بأقواسها الطبيعية الهائلة ومنحدراتها الطباشيرية البيضاء التي تغطس في القناة الإنجليزية، وهي تحفة طبيعية. كانت مصدر إلهام لأعظم الرسامين مثل مونيه، ويقدم هذا الساحل مشهداً جيولوجياً فريداً يتغير جذرياً مع المد والجزر وساعات اليوم.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول خيارات الزيارة
                      _buildSectionTitle('🚗 خيارات الزيارة', etretatColor),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: etretatColor),
                          _buildTableRow(['🚗 سيارة', 'مواقف السيارات في الضواحي (تتوفر حافلات مكوكية في الصيف)']),
                          _buildTableRow(['🥾 مشي', 'مسار ضباط الجمارك (GR21) فوق المنحدرات']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', etretatColor),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/imag/34.jpeg'),
                            _buildGalleryImage('assets/imag/32.jpg'),
                            _buildGalleryImage('assets/imag/39.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح للبقاء
                      _buildSectionTitle('📋 نصائح للبقاء', etretatColor),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.brightness_5, "شروق وغروب الشمس: هذا هو الوقت الذي تشتعل فيه المنحدرات بسماء مذهلة.", etretatColor),
                            _buildTechRow(Icons.waves, "تحقق من أوقات المد والجزر: بعض الكهوف لا يمكن الوصول إليها إلا في الجزر.", etretatColor),
                            _buildTechRow(Icons.camera_alt, "أحضر حامل ثلاثي القوائم لالتقاط صور التعريض الطويل للزبد على الطباشير.", etretatColor),
                            _buildTechRow(Icons.wind_power, "الرياح مستمرة فوق المنحدرات؛ أحضر سترة واقية من الرياح.", etretatColor),
                            _buildTechRow(Icons.directions_walk, "تجنب المشي بالقرب من الحافة؛ التعرية نشطة.", etretatColor),
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