import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class LacOrceyrettePage extends StatefulWidget {
  const LacOrceyrettePage({super.key});

  @override
  State<LacOrceyrettePage> createState() => _LacOrceyrettePageState();
}

class _LacOrceyrettePageState extends State<LacOrceyrettePage> {
  // ignore: unused_field
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color orangeAutomne = Color(0xFFE2725B);

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
              'assets/images/lac_or10.jpg',
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
                        'بحيرة أورسييريت 🌲',
                        style: GoogleFonts.cinzel(
                          color: orangeAutomne,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "🇨🇦 لمسة من كندا في جبال الألب العليا",
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.montserrat(
                          color: orangeAutomne.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "تقع بحيرة أورسييريت في منطقة هوت آلب (Hautes-Alpes)، وهي بكل بساطة مذهلة في فصل الخريف. تكتسي الأشجار بألوان برتقالية متوهجة تنعكس بنقاء في مياهها الكريستالية. عند غروب الشمس، يشتعل الضوء فوق القمم الجبلية المغطاة بالثلوج في الأفق، لتقدم عرضاً طبيعياً يليق بأكبر المتنزهات الكندية.",
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // جدول الفترات
                    _buildSectionTitle('📅 تقويم الزيارة', orangeAutomne),
                    const SizedBox(height: 15),
                    Table(
                      textDirection: TextDirection.rtl,
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['الحالة', 'الفصول والأجواء'], orangeAutomne,
                            isHeader: true),
                        _buildTableRow([
                          '✅ الأفضل',
                          'الخريف (ألوان الأشجار ساحرة)'
                        ], orangeAutomne),
                        _buildTableRow([
                          '🌤️ الصيف',
                          'مثالي للانتعاش والمياه النقية'
                        ], orangeAutomne),
                        _buildTableRow([
                          '❄️ نادر',
                          'الشتاء (بحيرة متجمدة، أجواء الشمال الكبير)'
                        ], orangeAutomne),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // جدول المواعيد
                    _buildSectionTitle('⏰ الأوقات المنصوح بها', orangeAutomne),
                    const SizedBox(height: 15),
                    Table(
                      textDirection: TextDirection.rtl,
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['الوقت', 'نصائح'], orangeAutomne,
                            isHeader: true),
                        _buildTableRow(
                            ['✨ الصباح', 'مياه كمرآة لانعكاسات مثالية'],
                            orangeAutomne),
                        _buildTableRow(
                            ['☀️ الظهر', 'ضوء عمودي على أشجار الأرز'],
                            orangeAutomne),
                        _buildTableRow(
                            ['🌅 المساء', 'غروب الشمس فوق القمم'],
                            orangeAutomne),
                      ],
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 لمحة عن المكان', orangeAutomne),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/img_8810.jpg'),
                          _buildGalleryImage('assets/images/lac_or10.jpg'),
                          _buildGalleryImage(
                              'assets/images/DES_0502-1-1920x1080.jpg'),
                          _buildGalleryImage(
                              'assets/images/lac-de-lorceyrette-5-scaled.jpg'),
                          _buildGalleryImage(
                              'assets/images/Orceyrette-en-hiver-©Thibaut-Poinas-scaled-1.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 إرشادات ومعلومات', orangeAutomne),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_sunny_outlined,
                              "يُفضل الحضور عند الغروب للاستمتاع بالألوان", orangeAutomne),
                          _buildTechRow(Icons.directions_car,
                              "يمكن الوصول إليها مباشرة بالسيارة", orangeAutomne),
                          _buildTechRow(Icons.terrain,
                              "إمكانية المشي لمسافات طويلة للمهتمين", orangeAutomne),
                          _buildTechRow(Icons.camera_alt_outlined,
                              "مرآة مائية مثالية للتصوير الفوتوغرافي", orangeAutomne),
                          _buildTechRow(Icons.ac_unit,
                              "الطريق مغلق عند تساقط الثلوج الكثيفة الأولى", orangeAutomne),
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

  // --- طرق التنسيق ---

  TableRow _buildTableRow(List<String> cells, Color color,
      {bool isHeader = false}) {
    final style = GoogleFonts.montserrat(
      color: isHeader ? color : Colors.white70,
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

  Widget _buildSectionTitle(String title, Color color) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(
        title,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.cinzel(
            color: color,
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

  Widget _buildTechRow(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
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