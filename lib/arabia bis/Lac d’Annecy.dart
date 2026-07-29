import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDAnnecyPage extends StatefulWidget {
  const LacDAnnecyPage({super.key});

  @override
  State<LacDAnnecyPage> createState() => _LacDAnnecyPageState();
}

class _LacDAnnecyPageState extends State<LacDAnnecyPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أزرق سماوي (المياه الصافية للبحيرة)
    const Color bleuAnnecy = Color(0xFF00ACC1);

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
                  'assets/imag/20.webp',
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
                        "بحيرة أنسي 🌊",
                        style: GoogleFonts.cinzel(
                          color: bleuAnnecy,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "أوفيرن-رون ألب (أوت سافوا)", bleuAnnecy),
                      _buildFactLine("النوع", "بحيرة جليدية", bleuAnnecy),
                      _buildFactLine("تشبه", "بحيرة بليد (سلوفينيا 🇸🇮)", bleuAnnecy),

                      const SizedBox(height: 25),
                      Text(
                        "💎 أنقى بحيرة في أوروبا",
                        style: GoogleFonts.montserrat(
                          color: bleuAnnecy.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "يُطلق عليها لقب \"البحيرة الزرقاء\"، وهي جوهرة تقع في قلب جبال الألب. بفضل جهود الحفاظ الكبيرة، تُعتبر مياؤها الصافية اليوم الأنقى في أوروبا. بين السباحة الصيفية، والطيران المظلي فوق الماء، وجولات الدراجات، إنها وجهة تجمع بين عظمة الجبال ونمط الحياة اللطيف.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', bleuAnnecy),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: bleuAnnecy),
                          _buildTableRow(['🚆 قطار', 'محطة أنسي، على بعد 10 دقائق سيراً على الأقدام من الشواطئ']),
                          _buildTableRow(['🚗 سيارة', 'الطريق A41 (تمتلئ مواقف السيارات بسرعة في موسم الذروة)']),
                          _buildTableRow(['🚲 دراجة', 'طريق أخضر لأكثر من 40 كم حول البحيرة (تجربة لا بد منها)']),
                          _buildTableRow(['🛥️ قارب', 'حافلات البحيرة وتأجير القوارب بدون رخصة']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', bleuAnnecy),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/imag/19.webp'),
                            _buildGalleryImage('assets/imag/16.jpg'),
                            _buildGalleryImage('assets/imag/18.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', bleuAnnecy),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.pedal_bike, "استأجر دراجة في الصباح الباكر لتجنب الازدحام على المسار", bleuAnnecy),
                            _buildTechRow(Icons.paragliding, "كول دو لا فوركلا: أفضل مكان لتجربة الطيران المظلي الأولى", bleuAnnecy),
                            _buildTechRow(Icons.pool, "تصل حرارة الماء إلى 24 درجة مئوية صيفاً، مثالية للسباحة (شواطئ مجهزة)", bleuAnnecy),
                            _buildTechRow(Icons.sunny, "انعكاس قوي جداً على الماء: النظارات الشمسية وواقي الشمس إلزامي", bleuAnnecy),
                            _buildTechRow(Icons.directions_boat, "فضل القوارب الكهربائية أو القوارب الدواسة للحفاظ على الهدوء", bleuAnnecy),
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