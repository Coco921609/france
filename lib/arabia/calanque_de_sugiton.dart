import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalanqueDeSugitonPage extends StatefulWidget {
  const CalanqueDeSugitonPage({super.key});

  @override
  State<CalanqueDeSugitonPage> createState() => _CalanqueDeSugitonPageState();
}

class _CalanqueDeSugitonPageState extends State<CalanqueDeSugitonPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuMer = Color(0xFF2980B9);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0C0E),
        body: Stack(
          children: [
            // 1. IMAGE DE FOND
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Image.asset(
                'assets/images/111.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. PANNEAU DE CONTENU
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.62,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF141619),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'خليج سوجيتون 🌊',
                        style: GoogleFonts.cairo(
                          color: bleuMer,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "يقع خليج سوجيتون في جنوب فرنسا، بين مرسيليا وكاسيس، وهو جوهرة في قلب كتلة الكالانك الصخرية. يتطلب الوصول إلى هذا المكان الساحر بعض الجهد.",
                        style: GoogleFonts.cairo(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // TABLEAU PÉRIODES
                      _buildSectionTitle('📅 المواسم الموصى بها', bleuMer),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الموسم', 'نصائح'], isHeader: true, hColor: bleuMer),
                          _buildTableRow(['🌱 الربيع', 'مثالي، درجات حرارة معتدلة وطبيعة مزهرة.']),
                          _buildTableRow(['🍂 الخريف', 'مثالي، زحام أقل وحرارة محتملة.']),
                          _buildTableRow(['☀️ الصيف', 'يُفضل تجنبه (حرارة، غبار، وازدحام).']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // TABLEAU HORAIRES
                      _buildSectionTitle('⏰ الأوقات الموصى بها', bleuMer),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        children: [
                          _buildTableRow(['الوقت', 'نصائح'], isHeader: true, hColor: bleuMer),
                          _buildTableRow(['🌅 الصباح الباكر', 'قبل 8 صباحاً: ضروري للمواقف والهدوء.']),
                          _buildTableRow(['☀️ منتصف النهار', 'يُتجنب: حرارة شديدة على المسار الخرساني.']),
                          _buildTableRow(['🌇 المساء', 'مثالي لغروب الشمس، لكن احذر حرارة العودة.']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // GALERIE PHOTO
                      _buildSectionTitle('📸 نظرة على المكان', bleuMer),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/999.jpg'),
                            _buildGalleryImage('assets/images/777.jpg'),
                            _buildGalleryImage('assets/images/6666.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // PARCOURS ÉTAPE PAR ÉTAPE
                      _buildSectionTitle('🗺️ المسار من لوميني إلى سوجيتون', bleuMer),
                      const SizedBox(height: 20),
                      _buildStep("البداية: مدرسة الهندسة المعمارية في لوميني."),
                      _buildStep("المسار: طريق حصوي واسع (علامات زرقاء)."),
                      _buildStep("الاتجاه: الوصول إلى كول دو سوجيتون."),
                      _buildStep("التفرع: يميناً، اتبع المسار ذو النقاط الحمراء."),
                      _buildStep("الانتقال: الالتقاء بالطريق الخرساني."),
                      _buildStep("إطلالة: عند آخر منعطف خرساني."),
                      _buildStep("النزول النهائي: مسار طبيعي (نقاط حمراء)."),
                      _buildStep("الوصول: خلجان سوجيتون."),

                      const SizedBox(height: 35),

                      // INFOS PRATIQUES
                      _buildSectionTitle('📋 معلومات أساسية', bleuMer),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.directions_walk, "البداية: لوميني", bleuMer),
                            _buildTechRow(Icons.timer, "3.2 كم (55 دقيقة ذهاب / ساعة وربع إياب)", bleuMer),
                            _buildTechRow(Icons.water_drop, "نافورة مياه صالحة للشرب قبل البوابة", bleuMer),
                            _buildTechRow(Icons.landscape, "الصعوبة: مسار مشي سهل", bleuMer),
                            _buildTechRow(Icons.warning, "نزول حاد وتضاريس صخرية", bleuMer),
                            _buildTechRow(Icons.sunny, "احذر من الصعود الشاق تحت أشعة الشمس", bleuMer),
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
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cairo(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildStep(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_left, color: const Color(0xFF2980B9), size: 20),
          const SizedBox(width: 5),
          Expanded(child: Text(text, style: GoogleFonts.cairo(color: Colors.white70, fontSize: 13, height: 1.5))),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false, Color? hColor}) {
    return TableRow(
      children: cells.map((cell) => Padding(
        padding: const EdgeInsets.all(12),
        child: Text(cell, style: GoogleFonts.cairo(
          color: isHeader ? hColor : Colors.white70,
          fontSize: 12,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        )),
      )).toList(),
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
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: GoogleFonts.cairo(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}