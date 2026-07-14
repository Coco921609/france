import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class IleDeLaViergePage extends StatefulWidget {
  const IleDeLaViergePage({super.key});

  @override
  State<IleDeLaViergePage> createState() => _IleDeLaViergePageState();
}

class _IleDeLaViergePageState extends State<IleDeLaViergePage> {
  // ignore: unused_field
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color turquoiseColor = Color(0xFF40E0D0);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. صورة الخلفية الثابتة
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg',
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
                        'جزيرة العذراء 🌊',
                        style: GoogleFonts.cinzel(
                          color: turquoiseColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "🏝️ لمسة من الكاريبي في بريتاني",
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.montserrat(
                          color: turquoiseColor.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "تقع جزيرة العذراء في كرو Zon في بريتاني، وتشتهر بشاطئها الخلاب ذو المياه الكريستالية والرمال البيضاء. "
                          "هذا المكان، الذي يشبه جزر الكاريبي، غالباً ما يُصنف ضمن أجمل شواطئ أوروبا ويقدم مشهداً طبيعياً بجمال يكاد يكون خيالياً.",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // جدول الفترات
                    _buildSectionTitle('📅 أفضل الفترات للزيارة'),
                    const SizedBox(height: 15),
                    Table(
                      textDirection: TextDirection.rtl,
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['الحالة', 'الطقس والألوان'], isHeader: true),
                        _buildTableRow(['✅ الأفضل', 'من مايو إلى سبتمبر (مياه فيروزية)']),
                        _buildTableRow(['🌤️ جيد', 'أبريل وأكتوبر (إضاءة جميلة)']),
                        _buildTableRow(['🌧️ حذر', 'الشتاء (رياح قوية وأمطار)']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // جدول المواعيد
                    _buildSectionTitle('⏰ الأوقات المنصوح بها'),
                    const SizedBox(height: 15),
                    Table(
                      textDirection: TextDirection.rtl,
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['الوقت', 'نصائح'], isHeader: true),
                        _buildTableRow(['✨ الصباح', 'مثالي للهدوء (8-10 صباحاً)']),
                        _buildTableRow(['☀️ الظهر', 'أقصى إضاءة للمياه الفيروزية']),
                        _buildTableRow(['🌅 المساء', 'غروب الشمس فوق المنحدرات']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 لمحة عن المكان'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/crique-ile-vierge-crozon.jpg'),
                          _buildGalleryImage(
                              'assets/images/1000_F_571714788_cDQWVGIEK8a387ijfVo7Ii6TDqvbT1Ph.jpg'),
                          _buildGalleryImage(
                              'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 إرشادات ومعلومات'),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.cloudy_snowing,
                              "في بريتاني تمطر كثيراً! تحقق جيداً من حالة الطقس ودرجات الحرارة قبل الانطلاق."),
                          _buildTechRow(Icons.block,
                              "الوصول إلى الشاطئ ممنوع (لحماية النظام البيئي)"),
                          _buildTechRow(Icons.waves,
                              "يُمنع السباحة هناك (بسبب عدم استقرار المنحدرات)"),
                          _buildTechRow(Icons.directions_walk,
                              "يُنصح بارتداء أحذية مشي مريحة"),
                          _buildTechRow(Icons.camera_alt_outlined,
                              "لا تنسوا إحضار كاميرا التصوير!"),
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

  // --- MÉTHODES DE STYLE ---

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    final style = GoogleFonts.montserrat(
      color: isHeader ? const Color(0xFF40E0D0) : Colors.white70,
      fontSize: 12,
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
    );
    return TableRow(
      children: cells.map((cell) {
        return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Text(cell,
                style: style, textAlign: TextAlign.right, softWrap: true),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.cinzel(
            color: const Color(0xFF40E0D0),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),
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
          Icon(icon, color: const Color(0xFF40E0D0).withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(
              child: Text(label,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 13, height: 1.4))),
        ],
      ),
    );
  }
}