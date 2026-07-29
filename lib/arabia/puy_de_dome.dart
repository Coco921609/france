import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PuyDeDomePage extends StatefulWidget {
  const PuyDeDomePage({super.key});

  @override
  State<PuyDeDomePage> createState() => _PuyDeDomePageState();
}

class _PuyDeDomePageState extends State<PuyDeDomePage> {
  @override
  Widget build(BuildContext context) {
    const Color vertVolcan = Color(0xFF277A4E);

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
                  'assets/images/8.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[900]),
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
                      Text(
                        'بوي دي دوم 🌋',
                        style: GoogleFonts.cairo(
                          color: vertVolcan,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildTranslationLine("أوفرني", "لمسة من جبل فوجي (اليابان)", vertVolcan),
                      const SizedBox(height: 25),
                      Text(
                        "🇯🇵 رمز براكين أوفيرني",
                        style: GoogleFonts.cairo(
                          color: vertVolcan.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "نعم، فرنسا تحتوي بالفعل على براكين! يقدم هذا الموقع الأيقوني في سلسلة بوي، المدرج ضمن قائمة التراث العالمي لليونسكو، إطلالة بانورامية رائعة بزاوية 360 درجة.",
                        style: GoogleFonts.cairo(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      _buildSectionTitle('أفضل الفصول للزيارة', vertVolcan),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الفصل', 'الجو والنصائح'],
                        ['🍂 الخريف', 'ألوان زاهية وبحر من السحب'],
                        ['☀️ الصيف', 'مناخ لطيف مناسب للتنزه'],
                        ['🌱 الربيع', 'خضرة مورقة واستيقاظ الطبيعة'],
                        ['❄️ الشتاء', 'يُفضل تجنبه (رياح شديدة وثلوج)'],
                      ], vertVolcan),

                      const SizedBox(height: 35),
                      _buildSectionTitle('التصوير والأوقات', vertVolcan),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الوقت', 'التوصية'],
                        ['🌅 شروق الشمس', 'إضاءة ذهبية ممتازة فوق البراكين'],
                        ['🌇 غروب الشمس', 'ألوان فريدة وإطلالة واضحة'],
                        ['📸 الكاميرا', 'يوصى باستخدام حامل ثلاثي للتعرض الطويل'],
                      ], vertVolcan),

                      const SizedBox(height: 35),
                      _buildSectionTitle('💡 حقائق ومعلومات', vertVolcan),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.landscape_outlined, "أعلى نقطة في سلسلة بوي (شاين دي بوي) بارتفاع 1,465 متراً فوق مستوى سطح البحر.", vertVolcan),
                            _buildTechRow(Icons.bolt, "الموقع القديم لمعبد ميركوري الذي بُني في القرن الثاني.", vertVolcan),
                            _buildTechRow(Icons.directions_walk, "يمكن الوصول إليه سيراً على الأقدام مجاناً عبر مسار البغال.", vertVolcan),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),
                      _buildSectionTitle('نظرة عامة على المكان', vertVolcan),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/9.jpg'),
                            _buildGalleryImage('assets/images/10.jpg'),
                            _buildGalleryImage('assets/images/train.jpeg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),
                      _buildSectionTitle('معلومات أساسية', vertVolcan),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.camera_enhance_outlined, "الكاميرا ضرورية", vertVolcan),
                            _buildTechRow(Icons.map_outlined, "يقع بالقرب من كليرمون فيران", vertVolcan),
                            _buildTechRow(Icons.train_outlined, "يمكن الوصول إليه عبر قطار التروس الجبلي (مدفوع)", vertVolcan),
                            _buildTechRow(Icons.euro_symbol, "الأسعار: التنزه (مجاني) / القطار (~15 يورو، يُرجى التحقق)", vertVolcan),
                            _buildTechRow(Icons.auto_awesome, "موقع مميز في فرنسا", vertVolcan),
                            _buildTechRow(Icons.park, "الحديقة الطبيعية الإقليمية لبراكين أوفيرني", vertVolcan),
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

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville, style: GoogleFonts.cairo(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
        ),
        Text(analogie, style: GoogleFonts.cairo(color: Colors.white70, fontSize: 16), softWrap: true),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        bool isHeader = entry.key == 0;
        return TableRow(
          children: entry.value.map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                style: GoogleFonts.cairo(
                  color: isHeader ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                )),
          )).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.cairo(
            color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 250,
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
          Expanded(
            child: Text(label, style: GoogleFonts.cairo(color: Colors.white, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}