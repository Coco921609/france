import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentierDesOcresPage extends StatefulWidget {
  const SentierDesOcresPage({super.key});

  @override
  State<SentierDesOcresPage> createState() => _SentierDesOcresPageState();
}

class _SentierDesOcresPageState extends State<SentierDesOcresPage> {
  @override
  Widget build(BuildContext context) {
    // اللون المميز: مغرة محروقة / رمال أريزونا
    const Color ocreArizona = Color(0xFFC5A059);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. صورة الخلفية الثابتة (العلوية)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/des-ocres-des-couleurs.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. لوحة المحتوى القابلة للتمرير
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
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'مسار المغرة 🏜️',
                        style: GoogleFonts.cinzel(
                          color: ocreArizona,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇺🇸 أجواء من أريزونا الأمريكية",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                        color: ocreArizona.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "تخيل نفسك منتقلاً إلى قلب الغرب الأمريكي القديم، دون مغادرة فرنسا. في قرية روسيون، تشتعل الأرض لتكشف عن منحدرات منحوتة بظلال نارية ساحرة. 🎨",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // قسم التقويم
                    _buildSectionTitle('📅 تقويم الزيارة', ocreArizona),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['الحالة', 'الفصول والأجواء'],
                      ['✅ الأفضل', 'الخريف (الأشجار الذهبية) والربيع'],
                      ['☀️ جيد', 'الصيف (جميل جداً ولكن حار جداً)'],
                      ['❌ تجنب', 'الشتاء (رمادي وبارد)'],
                    ], ocreArizona),

                    const SizedBox(height: 35),

                    // قسم المواعيد
                    _buildSectionTitle('⏰ الفترات الزمنية', ocreArizona),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['التوقيت', 'نصائح حسب الموسم'],
                      ['✨ مثالي', 'الصباح الباكر أو بعد الـ 5 مساءً'],
                      ['🌅 رائع', 'من 11 صباحاً - 3 مساءً (خريف/شتاء)'],
                      ['🚫 تجنب', 'من 12 ظهراً - 4 مساءً في ذروة الصيف'],
                    ], ocreArizona),

                    const SizedBox(height: 35),

                    // قسم المعرض
                    _buildSectionTitle('📸 لمحة عن المكان', ocreArizona),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/des-ocres-des-couleurs (1).jpg'),
                          _buildGalleryImage('assets/images/photo0jpg.jpg'),
                          _buildGalleryImage('assets/images/de-belles-couleurs.jpg'),
                          _buildGalleryImage('assets/images/photo4jpg.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // قسم المعلومات العملية
                    _buildSectionTitle('📋 أساسيات ومعلومات', ocreArizona),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "🧭 مساران للمشي (30 أو 60 دقيقة)"),
                          _buildTechRow(Icons.directions_run, "👟 وداعاً للأحذية البيضاء !"),
                          _buildTechRow(Icons.water_drop_outlined, "قارورة الماء ضرورية جداً"),
                          _buildTechRow(Icons.euro_symbol, "🎟️ السعر : حوالي 3.50€ (للتأكد)"),
                          _buildTechRow(Icons.cleaning_services_rounded, "ارتدِ أحذية داكنة (المغرة تترك بقعاً)"),
                          _buildTechRow(Icons.no_food_outlined, "يمنع التنزه وتناول الطعام في الموقع"),
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

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      textDirection: TextDirection.rtl,
      border: TableBorder.all(color: Colors.white10, width: 1),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      children: data.asMap().entries.map((entry) {
        int idx = entry.key;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              cell,
              textAlign: TextAlign.right,
              style: GoogleFonts.montserrat(
                color: idx == 0 ? hColor : Colors.white70,
                fontSize: 12,
                fontWeight: idx == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
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
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.cinzel(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTechRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white24, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.right,
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}