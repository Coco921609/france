import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MassifEsterelPage extends StatefulWidget {
  const MassifEsterelPage({super.key});

  @override
  State<MassifEsterelPage> createState() => _MassifEsterelPageState();
}

class _MassifEsterelPageState extends State<MassifEsterelPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: أحمر إستيريل (صخور بركانية)
    const Color rougeEsterel = Color(0xFFC0392B);

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
                  'assets/ima/14.jpg',
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
                        'كتلة إستيريل 🌋',
                        style: GoogleFonts.cinzel(
                          color: rougeEsterel,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "فار / ألب ماريتيم", rougeEsterel),
                      _buildFactLine("الهيكل", "كتلة بركانية من البورفير الأحمر", rougeEsterel),
                      _buildFactLine("تشبه", "كالانك دي بيانا (كورسيكا 🇨🇵)", rougeEsterel),

                      const SizedBox(height: 25),
                      Text(
                        "🪨 تباين متألق على البحر الأبيض المتوسط",
                        style: GoogleFonts.montserrat(
                          color: rougeEsterel.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "كتلة إستيريل هي جوهرة جيولوجية حيث تنحت الصخور البركانية الحمراء منحدرات مسننة تغطس مباشرة في بحر أزرق عميق. توفر هذه الكتلة بانوراما مذهلة، تمزج بين مسارات المشي لمسافات طويلة وسط الأشجار، والخلجان السرية، وإطلالات خلابة على ساحل فيروز.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الخيارات
                      _buildSectionTitle('🚗 خيارات الزيارة', rougeEsterel),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوسيلة', 'التفاصيل'], isHeader: true, hColor: rougeEsterel),
                          _buildTableRow(['🚗 سيارة', 'كورنيش الذهب (D6098) - إطلالة بانورامية']),
                          _buildTableRow(['🥾 مشي', 'مسارات محددة نحو كاب رو أو قمة الدب']),
                          _buildTableRow(['🛶 قوارب', 'استكشاف الخلجان التي لا يمكن الوصول إليها براً']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', rougeEsterel),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/ima/12.jpg'),
                            _buildGalleryImage('assets/ima/15.jpg'),
                            _buildGalleryImage('assets/ima/16.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', rougeEsterel),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.wb_twilight, "الضوء: تصبح الصخور الحمراء متوهجة خلال الساعة الذهبية.", rougeEsterel),
                            _buildTechRow(Icons.fire_truck, "الوقاية: الوصول محظور أثناء الرياح العاتية (خطر الحريق) - تحقق من الطقس.", rougeEsterel),
                            _buildTechRow(Icons.water_drop, "الترطيب: الكتلة جافة جداً، احمل كمية وافرة من الماء.", rougeEsterel),
                            _buildTechRow(Icons.terrain, "الأحذية: تضاريس صخرية وزلقة، ارتدِ أحذية مشي متينة.", rougeEsterel),
                            _buildTechRow(Icons.photo_camera, "الإطلالة: لا تفوت البانوراما من قمة الدب (Pic de l'Ours).", rougeEsterel),
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