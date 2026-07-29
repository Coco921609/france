import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacBleuPage extends StatefulWidget {
  const LacBleuPage({super.key});

  @override
  State<LacBleuPage> createState() => _LacBleuPageState();
}

class _LacBleuPageState extends State<LacBleuPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أزرق سافير (اللون الكثيف والعميق للبحيرة)
    const Color bleuSaphir = Color(0xFF1976D2);

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
                  'assets/imag/33.jpeg',
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
                        'البحيرة الزرقاء 💙',
                        style: GoogleFonts.cinzel(
                          color: bleuSaphir,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "أوكسيتاني (بيرينيه العليا)", bleuSaphir),
                      _buildFactLine("النوع", "بحيرة جليدية (1947 متر)", bleuSaphir),
                      _buildFactLine("تشبه", "بحيرة مورين (كندا 🇨🇦)", bleuSaphir),

                      const SizedBox(height: 25),
                      Text(
                        "💎 جوهرة السافير في وادي ليسفون",
                        style: GoogleFonts.montserrat(
                          color: bleuSaphir.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "بعمق يصل إلى 120 متراً، تُعد البحيرة الزرقاء أعمق بحيرة في جبال البيرينيه الفرنسية. تقع على ارتفاع يقرب من 2000 متر، وتستمد اسمها من لونها الأزرق السافيري الكثيف والمذهل. محاطة بتلال شاهقة ومثيرة، إنها وجهة أسطورية يجب استحقاقها بعد صعود شاق.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', bleuSaphir),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: bleuSaphir),
                          _buildTableRow(['🚗 سيارة', 'حتى موقف شيروليه، نقطة انطلاق التسلق.']),
                          _buildTableRow(['🥾 مشي', 'حوالي ساعتين ونصف إلى 3 ساعات من الصعود الحاد (+900 متر ارتفاع).']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', bleuSaphir),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/imag/31.webp'),
                            _buildGalleryImage('assets/imag/30.webp'),
                            _buildGalleryImage('assets/imag/34.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', bleuSaphir),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.hiking, "شاقة: الصعود طويل وصخري، كن مجهزاً.", bleuSaphir),
                            _buildTechRow(Icons.not_interested, "السباحة ممنوعة (المياه تستخدم كخزان للوادي وتبقى باردة جداً).", bleuSaphir),
                            _buildTechRow(Icons.wb_cloudy, "ابدأ في الصباح الباكر؛ الصعود معرض جداً للشمس.", bleuSaphir),
                            _buildTechRow(Icons.ac_unit, "احذر من بقع الثلج في بداية الموسم (حتى يونيو/يوليو).", bleuSaphir),
                            _buildTechRow(Icons.landscape, "إمكانية التمديد نحو البحيرة الخضراء عبر القيام بمسار دائري.", bleuSaphir),
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