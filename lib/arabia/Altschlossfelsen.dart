import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class AltschlossfelsenPage extends StatefulWidget {
  const AltschlossfelsenPage({super.key});

  @override
  State<AltschlossfelsenPage> createState() => _AltschlossfelsenPageState();
}

class _AltschlossfelsenPageState extends State<AltschlossfelsenPage> {
  // ignore: unused_field
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color gresRouge = Color(0xFFC0392B);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. IMAGE DE FOND FIXE
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/altschlossfelsen-23-von-98.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. PANNEAU DE CONTENU DÉFILABLE
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

                    // --- TRADUCTION EN FLÈCHE ---
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
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      textAlign: TextAlign.right, // Direction arabe
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('📅 أفضل المواسم'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['الموسم', 'الأجواء والألوان'], isHeader: true, hColor: gresRouge),
                        _buildTableRow(['🍂 الخريف', 'ألوان نارية وأوراق ذهبية']),
                        _buildTableRow(['🌱 الربيع', 'هواء نقي واستيقاظ الغابة']),
                        _buildTableRow(['☀️ الصيف', 'انتعاش تحت الجدران الصخرية']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('⏰ الأوقات المنصوح بها'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['الوقت', 'نصائح'], isHeader: true, hColor: gresRouge),
                        _buildTableRow(['✨ الصباح', 'ضوء ناعم على المنحدرات']),
                        _buildTableRow(['☀️ الظهر', 'ظل مريح عند قدم الصخرة']),
                        _buildTableRow(['🌅 المساء', 'الحجر الرملي يصبح أحمر قانٍ عند الغروب']),
                      ],
                    ),

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
          ),
        ],
      ),
    );
  }

  // --- MÉTHODES DE STYLE ---

  Widget _buildTranslationLine(String ger, String fr, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(fr, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_back, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Text(ger, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false, Color? hColor}) {
    return TableRow(
      children: cells.map((cell) => Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
            cell,
            textAlign: TextAlign.right,
            style: GoogleFonts.montserrat(
              color: isHeader ? hColor : Colors.white70,
              fontSize: 12,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            )),
      )).toList(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
          title,
          style: GoogleFonts.cinzel(color: const Color(0xFFC0392B), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)
      ),
    );
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: Text(label, textAlign: TextAlign.right, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
          const SizedBox(width: 15),
          Icon(icon, color: color.withOpacity(0.5), size: 20),
        ],
      ),
    );
  }
}