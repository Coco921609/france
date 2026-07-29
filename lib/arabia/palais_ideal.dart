import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PalaisIdealPage extends StatefulWidget {
  const PalaisIdealPage({super.key});

  @override
  State<PalaisIdealPage> createState() => _PalaisIdealPageState();
}

class _PalaisIdealPageState extends State<PalaisIdealPage> {
  @override
  Widget build(BuildContext context) {
    const Color pierreChaude = Color(0xFFC2A383);

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
                  'assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg',
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
                      Text(
                        'القصر المثالي 🏰',
                        style: GoogleFonts.cinzel(
                          color: pierreChaude,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      _buildTranslationLine("أوتريف", "معابد أنكور وات (كمبوديا)", pierreChaude),

                      const SizedBox(height: 25),

                      Text(
                        "🇰🇭 لمسة من كمبوديا في قلب إقليم دروم",
                        style: GoogleFonts.montserrat(
                          color: pierreChaude.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "بناه رجل واحد بمفرده، وهو ساعي البريد فرديناند شيفال. يعتبر هذا القصر معلماً فريداً في العالم، حيث تذكر واجهاته المنحوتة بالمعابد الهندوسية والعمارة العضوية في جنوب شرق آسيا.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      _buildSectionTitle('📅 أفضل المواسم', pierreChaude),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الموسم', 'نصيحة'],
                        ['🌸 الربيع', 'مثالي: درجات حرارة معتدلة'],
                        ['🍂 الخريف', 'رائع مع ألوان الخريف العنبرية'],
                        ['☀️ الصيف', 'مزدحم جداً، يُفضل الصباح الباكر'],
                        ['❄️ الشتاء', 'هادئ ولكن بارد جداً (منطقة دروم)'],
                      ], pierreChaude),

                      const SizedBox(height: 35),

                      _buildSectionTitle('⏰ مواعيد الزيارة', pierreChaude),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الوقت', 'الحالة'],
                        ['✨ الصباح', 'ينصح به: إضاءة ناعمة'],
                        ['🕛 12 - 2 ظهراً', 'ازدحام أقل'],
                        ['🕓 بعد الظهر', 'تجنبه: ازدحام شديد'],
                      ], pierreChaude),

                      const SizedBox(height: 35),

                      _buildSectionTitle('🎟️ الأسعار العامة', pierreChaude),
                      const SizedBox(height: 10),
                      Text(
                        "⚠️ تنبيه: الأسعار قابلة للتغيير حسب الموسم.",
                        style: GoogleFonts.montserrat(color: Colors.white54, fontSize: 13, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الفئة', 'السعر'],
                        ['بالغ', '8 €'],
                        ['مخفض*', '6 €'],
                        ['أطفال (3-16 سنة)', '5 €'],
                        ['أقل من 5 سنوات', 'مجاني'],
                        ['دليل صوتي', '+ 2 €'],
                      ], pierreChaude),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "*مخفض: الطلاب، الباحثون عن عمل، ذوو الاحتياجات الخاصة.",
                          style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 11),
                        ),
                      ),

                      const SizedBox(height: 25),

                      _buildSectionTitle('👥 أسعار المجموعات', pierreChaude),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['نوع المجموعة', 'السعر'],
                        ['أطفال (+15 شخص)', '4 € للطفل'],
                        ['سائقو الحافلات', 'مجاني'],
                      ], pierreChaude),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📸 لمحة عن المكان', pierreChaude),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg'),
                            _buildGalleryImage('assets/images/Palais-ideal-une.jpg'),
                            _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-1.jpg'),
                            _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-2.jpg'),
                            _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-11.jpg'),
                            _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-9.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📋 أساسيات', pierreChaude),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.camera_enhance_outlined, "آلة التصوير ضرورية جداً", pierreChaude),
                            _buildTechRow(Icons.map_outlined, "يقع في أوتريف (إقليم دروم)", pierreChaude),
                            _buildTechRow(Icons.language, "ينصح بالحجز عبر الإنترنت", pierreChaude),
                            _buildTechRow(Icons.auto_awesome, "مصنف كمعلم تاريخي", pierreChaude),
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
        Text(ville, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_back, color: Colors.white24, size: 16),
        ),
        Text(analogie, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16), softWrap: true),
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
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(
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
        style: GoogleFonts.cinzel(
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
            child: Text(label,
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}