import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForetDeBroceliandePage extends StatefulWidget {
  const ForetDeBroceliandePage({super.key});

  @override
  State<ForetDeBroceliandePage> createState() => _ForetDeBroceliandePageState();
}

class _ForetDeBroceliandePageState extends State<ForetDeBroceliandePage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أخضر زمردي (غابة أسطورية)
    const Color vertEmeraude = Color(0xFF27AE60);

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
                  'assets/image/55.jpg',
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
                        'غابة بروسلياند 🌳',
                        style: GoogleFonts.cinzel(
                          color: vertEmeraude,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "بريتاني (إيل-إي-فيلين)", vertEmeraude),
                      _buildFactLine("الأجواء", "أسطورية وساحرة", vertEmeraude),
                      _buildFactLine("الأسطورة", "الساحر ميرلين والجنّية فيفيان", vertEmeraude),

                      const SizedBox(height: 25),
                      Text(
                        "✨ مملكة أساطير الملك آرثر",
                        style: GoogleFonts.montserrat(
                          color: vertEmeraude.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "انغمس في قلب غموض بريتاني. تدعوك غابة بروسلياند، المشهورة بروابطها مع أساطير الملك آرثر، إلى التأمل وسط أشجار البلوط المعمرة، والبرك السرية، والأحجار الغارقة في التاريخ. مكان يلتقي فيه الواقع بالخيال.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', vertEmeraude),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: vertEmeraude),
                          _buildTableRow(['🚗 سيارة', 'الوصول عبر بايمبونت (D773)']),
                          _buildTableRow(['🥾 مشي', 'مسارات معلمة من "بوابة الأسرار"']),
                          _buildTableRow(['🚲 دراجة', 'طرق خضراء تعبر الغابة']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', vertEmeraude),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/image/52.jpeg'),
                            _buildGalleryImage('assets/image/53.jpg'),
                            _buildGalleryImage('assets/image/54.jpg'),
                            _buildGalleryImage('assets/image/56.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', vertEmeraude),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.wb_cloudy, "طقس بريتاني: أحضر معك سترة", vertEmeraude),
                            _buildTechRow(Icons.directions_walk, "ابقَ على المسارات المعلمة", vertEmeraude),
                            _buildTechRow(Icons.mosque, "احترم هدوء الأماكن المقدسة", vertEmeraude),
                            _buildTechRow(Icons.camera_alt, "ضوء ساحر عند الفجر", vertEmeraude),
                            _buildTechRow(Icons.delete_outline, "صفر نفايات: الجنية تشكرك", vertEmeraude),
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