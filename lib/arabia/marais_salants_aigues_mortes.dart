import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaraisSalantsAiguesMortesPage extends StatefulWidget {
  const MaraisSalantsAiguesMortesPage({super.key});

  @override
  State<MaraisSalantsAiguesMortesPage> createState() => _MaraisSalantsAiguesMortesPageState();
}

class _MaraisSalantsAiguesMortesPageState extends State<MaraisSalantsAiguesMortesPage> {
  @override
  Widget build(BuildContext context) {
    const Color goldColor = Color(0xFFF1C40F);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // 1. IMAGE DE HAUT (Intégrée au défilement global)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/16.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // 2. CONTENU (Remonté légèrement pour le design)
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
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'المستنقعات الملحية 🧂',
                          style: GoogleFonts.cairo(
                            color: goldColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "✨ لمسة من بوليفيا (سالار دي أويوني) في منطقة غارد",
                        style: GoogleFonts.cairo(
                          color: goldColor.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 25),

                      Text(
                        "تمتلك مستنقعات إيغ-مورت تاريخاً غنياً يعود إلى العصور القديمة. لقد استغلها الرومان قديماً وشكلت المشهد الطبيعي لمنطقة كامارغ. اليوم، توفر هذه المستنقعات منظراً خيالياً بمياهها الوردية المتلألئة، وهي مشهد طبيعي مذهل.",
                        style: GoogleFonts.cairo(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      _buildSectionTitle('أفضل الأوقات', goldColor),
                      const SizedBox(height: 15),
                      Text(
                        "أفضل فترة للزيارة هي بين يونيو ويوليو. أنصحك بشدة بالذهاب في منتصف يونيو لتكون متأكداً من رؤيتها في أفضل الظروف.",
                        style: GoogleFonts.cairo(color: Colors.white70, fontSize: 13, height: 1.5),
                      ),

                      const SizedBox(height: 35),
                      _buildSectionTitle('ساعات العمل', goldColor),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        children: [
                          _buildTableRow(['الفترة', 'الساعات', 'آخر دخول'], isHeader: true, color: goldColor),
                          _buildTableRow(['1 مارس - 31 مايو', '10ص - 6م', '5م'], color: goldColor),
                          _buildTableRow(['1 يونيو - 31 أغسطس', '9ص - 7م', '6م'], color: goldColor),
                          _buildTableRow(['1 سبتمبر - 31 أكتوبر', '10ص - 6م', '5م'], color: goldColor),
                          _buildTableRow(['1 نوفمبر - 28 فبراير', '10ص - 5م', '4م'], color: goldColor),
                        ],
                      ),

                      const SizedBox(height: 35),
                      _buildSectionTitle('أسعار القطار الصغير (ساعة و15د)', goldColor),
                      const SizedBox(height: 10),
                      _buildPriceTable([
                        ['النوع', 'السعر'],
                        ['بالغ', '14,00 €'],
                        ['طفل (5-13 سنة)', '10,00 €'],
                        ['طفل (3-4 سنوات)', 'مجاناً'],
                        ['باقة عائلية', '44,00 €'],
                      ], goldColor),

                      const SizedBox(height: 35),
                      _buildSectionTitle('أسعار الجولة سيراً', goldColor),
                      const SizedBox(height: 10),
                      _buildPriceTable([
                        ['النوع', 'السعر'],
                        ['بالغ', '9,60 €'],
                        ['طفل (5-13 سنة)', '7,20 €'],
                        ['باقة عائلية', '32,00 €'],
                      ], goldColor),
                      const SizedBox(height: 10),
                      Text(
                        "استكشف سيراً على الأقدام حسب رتمك الخاص:\n- مسار إطلالة الأسوار (4 كم) و/أو مسار إطلالة كاميل (4 كم)\n- أو مسار الـ 12 كم",
                        style: GoogleFonts.cairo(color: Colors.white70, fontSize: 13, height: 1.5),
                      ),

                      const SizedBox(height: 35),
                      _buildSectionTitle('الدراجات الهوائية (12 كم و 30 كم)', goldColor),
                      const SizedBox(height: 10),
                      _buildPriceTable([
                        ['النوع', 'السعر'],
                        ['بالغ (14+ سنة)', '22,30 €'],
                        ['طفل (5-13 سنة)', '16,70 €'],
                      ], goldColor),
                      const SizedBox(height: 10),
                      Text(
                        "تأجير الدراجات الكهربائية:\nاستمتع بجولة حرة مع دراجاتنا الكهربائية المتوفرة في الموقع (دون حجز مسبق، حسب التوفر).\nالسعر: 21,00 € (إيجار) + تذكرة الدخول (مسار 12 أو 30 كم).",
                        style: GoogleFonts.cairo(color: Colors.white70, fontSize: 13, height: 1.5),
                      ),

                      const SizedBox(height: 35),
                      _buildSectionTitle('نظرة عامة', goldColor),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/14.jpg'),
                            _buildGalleryImage('assets/images/15.jpg'),
                            _buildGalleryImage('assets/images/17.jpg'),
                            _buildGalleryImage('assets/images/18.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),
                      _buildSectionTitle('معلومات أساسية', goldColor),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: const Color(0xFF1A1C20), borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.camera_alt, "صور موصى بها: مناظر طبيعية تخطف الأنفاس.", goldColor),
                            _buildTechRow(Icons.train, "القطار: احجز عبر الإنترنت، فالحجز في الموقع غالباً ما يكون ممتلئاً.", goldColor),
                            _buildTechRow(Icons.water_drop, "أحضر الماء معك: قد يكون الطقس حاراً جداً.", goldColor),
                            _buildTechRow(Icons.directions_walk, "عربات الأطفال مقبولة في الجولات سيراً.", goldColor),
                            _buildTechRow(Icons.warning_amber, "تنبيه: الساعات والأسعار قابلة للتغيير.", goldColor),
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

  // --- HELPERS ---

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false, required Color color}) {
    return TableRow(
      children: cells.map((cell) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(cell,
            style: GoogleFonts.cairo(
                color: isHeader ? color : Colors.white70,
                fontSize: 11,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)),
      )).toList(),
    );
  }

  Widget _buildPriceTable(List<List<String>> data, Color color) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) => _buildTableRow(entry.value, isHeader: entry.key == 0, color: color)).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.cairo(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: GoogleFonts.cairo(color: Colors.white, fontSize: 13, height: 1.4))),
        ],
      ),
    );
  }
}