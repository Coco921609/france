import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacOrceyrettePage extends StatefulWidget {
  const LacOrceyrettePage({super.key});

  @override
  State<LacOrceyrettePage> createState() => _LacOrceyrettePageState();
}

class _LacOrceyrettePageState extends State<LacOrceyrettePage> {
  @override
  Widget build(BuildContext context) {
    const Color orangeAutomne = Color(0xFFE2725B);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      // Structure en scroll global pour un comportement "site web"
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT (Intégrée au flux)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/images/lac_or10.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENU (Remonté légèrement pour conserver l'effet visuel)
            Transform.translate(
              offset: const Offset(0, -50),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF141619),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Lac de l\'Orceyrette 🌲',
                        style: GoogleFonts.cinzel(
                          color: orangeAutomne,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇨🇦 Un air de Canada dans les Hautes-Alpes",
                      style: GoogleFonts.montserrat(
                        color: orangeAutomne.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "Situé dans les Hautes-Alpes, le lac de l'Orceyrette est tout simplement magnifique en automne. Les arbres se parent de couleurs orangées flamboyantes qui se reflètent avec pureté dans l'eau cristalline. Au coucher du soleil, la lumière embrase les montagnes enneigées au loin, offrant un spectacle digne des plus grands parcs canadiens.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('Calendrier de visite', orangeAutomne),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['Statut', 'Saisons & ambiance'], orangeAutomne, isHeader: true),
                        _buildTableRow(['✅ Top', 'Automne (Couleurs des arbres magiques)'], orangeAutomne),
                        _buildTableRow(['🌤️ Été', 'Parfait pour la fraîcheur et l\'eau pure'], orangeAutomne),
                        _buildTableRow(['❄️ Rare', 'Hiver (Lac gelé, ambiance grand nord)'], orangeAutomne),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('Horaires conseillés', orangeAutomne),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['Moment', 'Conseils'], orangeAutomne, isHeader: true),
                        _buildTableRow(['✨ Matin', 'Eau miroir pour des reflets parfaits'], orangeAutomne),
                        _buildTableRow(['☀️ Midi', 'Lumière zénithale sur les mélèzes'], orangeAutomne),
                        _buildTableRow(['🌅 Soir', 'Coucher de soleil sur les sommets'], orangeAutomne),
                      ],
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Aperçu du lieu', orangeAutomne),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/img_8810.jpg'),
                          _buildGalleryImage('assets/images/lac_or10.jpg'),
                          _buildGalleryImage('assets/images/DES_0502-1-1920x1080.jpg'),
                          _buildGalleryImage('assets/images/lac-de-lorceyrette-5-scaled.jpg'),
                          _buildGalleryImage('assets/images/Orceyrette-en-hiver-©Thibaut-Poinas-scaled-1.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Indispensables & Infos', orangeAutomne),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_sunny_outlined, "Venir au coucher du soleil pour les couleurs", orangeAutomne),
                          _buildTechRow(Icons.directions_car, "Accessible directement en voiture", orangeAutomne),
                          _buildTechRow(Icons.terrain, "Randonnée possible pour les plus motivés", orangeAutomne),
                          _buildTechRow(Icons.camera_alt_outlined, "Miroir d'eau parfait pour la photo", orangeAutomne),
                          _buildTechRow(Icons.ac_unit, "Route fermée dès les premières grosses neiges", orangeAutomne),
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
    );
  }

  // --- MÉTHODES DE STYLE ---

  TableRow _buildTableRow(List<String> cells, Color color, {bool isHeader = false}) {
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
            child: Text(cell, style: style, textAlign: TextAlign.left, softWrap: true),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(
      title.toUpperCase(),
      style: GoogleFonts.cinzel(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(
              child: Text(label,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 13, height: 1.4))),
        ],
      ),
    );
  }
}