import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AltschlossfelsenPage extends StatefulWidget {
  const AltschlossfelsenPage({super.key});

  @override
  State<AltschlossfelsenPage> createState() => _AltschlossfelsenPageState();
}

class _AltschlossfelsenPageState extends State<AltschlossfelsenPage> {
  @override
  Widget build(BuildContext context) {
    const Color gresRouge = Color(0xFFC0392B);

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
                  'assets/images/altschlossfelsen-23-von-98.jpg',
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
                        'ألتشلوسفيلسن 🏜️',
                        style: GoogleFonts.cinzel(
                          color: gresRouge,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- TRADUCTION ---
                      _buildTranslationLine("Alt", "قديم / عريق", gresRouge),
                      _buildTranslationLine("Schloss", "قلعة", gresRouge),
                      _buildTranslationLine("Felsen", "صخرة", gresRouge),

                      const SizedBox(height: 25),
                      Text(
                        "🇺🇸 أريزونا المخفية في بلاد بيتش",
                        style: GoogleFonts.montserrat(
                          color: gresRouge.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تقع ألتشلوسفيلسن في منطقة بيتش (Pays de Bitche) على الحدود الفرنسية الألمانية، وهي عبارة عن حاجز صخري من الحجر الرملي الأحمر يمتد بطول 1.5 كم تقريبًا. بكهوفها وألوانها المتوهجة، ستشعر وكأنك في قلب وادي أريزونا العظيم.",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // TABLEAU PÉRIODES
                      _buildSectionTitle('📅 أفضل المواسم'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الموسم', 'الأجواء والألوان'],
                        ['🍂 الخريف', 'ألوان نارية وأوراق ذهبية'],
                        ['🌱 الربيع', 'هواء نقي واستيقاظ الغابة'],
                        ['☀️ الصيف', 'انتعاش تحت الجدران الصخرية'],
                      ], gresRouge),

                      const SizedBox(height: 35),

                      // TABLEAU HORAIRES
                      _buildSectionTitle('⏰ الأوقات المنصوح بها'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الوقت', 'نصائح'],
                        ['✨ الصباح', 'ضوء ناعم على المنحدرات'],
                        ['☀️ الظهر', 'ظل مريح عند قدم الصخرة'],
                        ['🌅 المساء', 'الحجر الرملي يصبح أحمر قانٍ عند الغروب'],
                      ], gresRouge),

                      const SizedBox(height: 35),

                      // GALERIE PHOTO
                      _buildSectionTitle('📸 نظرة على المكان'),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/ev-1122-wanderarena-pfa-lzerwald-nordvogesen-03.jpg'),
                            _buildGalleryImage('assets/images/altschlossfelsen-pfaelzerwald-tipps-tolle-wanderung.jpg'),
                            _buildGalleryImage('assets/images/Wanderung-Altschlossfelsen-768x576.jpg'),
                            _buildGalleryImage('assets/images/altschlossfelsen-23-von-98.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // INFOS PRATIQUES
                      _buildSectionTitle('📋 معلومات وإرشادات'),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.map_outlined, "تقع في منطقة بيتش (موزيل)", gresRouge),
                            _buildTechRow(Icons.directions_walk, "رحلة مشي تستغرق من ساعتين إلى 3 ساعات", gresRouge),
                            _buildTechRow(Icons.photo_camera, "كاميرا: التقط صوراً رائعة للوادي", gresRouge),
                            _buildTechRow(Icons.camera_alt, "رائعة في فصل الخريف", gresRouge),
                            _buildTechRow(Icons.air, "الربيع: هواء نقي ومنعش", gresRouge),
                            _buildTechRow(Icons.flag_outlined, "الحدود الفرنسية الألمانية", gresRouge),
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

  // --- MÉTHODES ---

  Widget _buildTranslationLine(String ger, String fr, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(ger, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_back, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Text(fr, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: GoogleFonts.cinzel(
            color: const Color(0xFFC0392B),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2));
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
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}