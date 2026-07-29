import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CascadesDesTufsPage extends StatefulWidget {
  const CascadesDesTufsPage({super.key});

  @override
  State<CascadesDesTufsPage> createState() => _CascadesDesTufsPageState();
}

class _CascadesDesTufsPageState extends State<CascadesDesTufsPage> {
  @override
  Widget build(BuildContext context) {
    const Color vertCascade = Color(0xFF27AE60);

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
                  'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg',
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
                        'شلالات التوف 🌿',
                        style: GoogleFonts.cinzel(
                          color: vertCascade,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      _buildTranslationLine("جورا", "أجواء من بالي (إندونيسيا)", vertCascade),

                      const SizedBox(height: 25),

                      Text(
                        "🇮🇩 الجوهرة الاستوائية في جورا",
                        style: GoogleFonts.montserrat(
                          color: vertCascade.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "شلال مذهل حيث تتدفق المياه عبر جدران من الحجر الجيري المغطى بالطحالب. يوفر هذا المنظر الخصب عرضاً طبيعياً يليق بالغابات الاستوائية في جنوب شرق آسيا.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // TABLEAU SAISONS
                      _buildSectionTitle('📅 الموسم والازدحام', vertCascade),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['التوقيت', 'نصائح'],
                        ['🌱 الربيع', 'تدفق المياه في أقصى مستواه (مثالي)'],
                        ['🍂 الخريف', 'ألوان الغابة الخلابة'],
                        ['👥 الازدحام', 'تجنب أيام الأحد بعد الظهر'],
                      ], vertCascade),

                      const SizedBox(height: 35),

                      _buildSectionTitle('📸 لمحة عن المكان', vertCascade),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/a4a00cbdb51fc9dce164469ace03ec7f-cascades-des-tufs-dans-le-jura-pres-darbois-890x0-f0fe8c58f7f431744cfb47fb412cf244.jpg'),
                            _buildGalleryImage('assets/images/juratourisme-tufs.jpg'),
                            _buildGalleryImage('assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // INFOS PRATIQUES
                      _buildSectionTitle('📋 معلومات عملية', vertCascade),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.euro_symbol, "الدخول: مجاني", vertCascade),
                            _buildTechRow(Icons.directions_walk, "سهولة الوصول من 'ليه بلانش'", vertCascade),
                            _buildTechRow(Icons.camera_alt, "مكان رائع للتصوير الفوتوغرافي", vertCascade),
                            _buildTechRow(Icons.warning_amber_rounded, "تنبيه: صخور زلقة", vertCascade),
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