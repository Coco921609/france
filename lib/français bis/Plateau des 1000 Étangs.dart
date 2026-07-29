import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlateauMilleEtangsPage extends StatefulWidget {
  const PlateauMilleEtangsPage({super.key});

  @override
  State<PlateauMilleEtangsPage> createState() => _PlateauMilleEtangsPageState();
}

class _PlateauMilleEtangsPageState extends State<PlateauMilleEtangsPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuNordique = Color(0xFF3498DB);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT (Intégrée au défilement global)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/image/3.jpg',
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
                      'Plateau des 1000 Étangs 🌲',
                      style: GoogleFonts.cinzel(
                        color: bleuNordique,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Superficie", "Plus de 220 km²", bleuNordique),
                    _buildFactLine("Formation", "Glaciaire (il y a 12 000 ans)", bleuNordique),

                    const SizedBox(height: 25),
                    Text(
                      "🇫🇮 La « Petite Finlande » de Haute-Saône",
                      style: GoogleFonts.montserrat(
                        color: bleuNordique.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Véritable joyau naturel, ce territoire sauvage dévoile des paysages bruts qui rappellent la Scandinavie. Façonné par la glace et l'œuvre des moines, ce lieu mystérieux aux multiples randonnées vous invite à explorer une mosaïque de forêts et de plans d'eau.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('📅 Meilleures saisons', bleuNordique),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Saison', 'Ambiance & Conseils'], isHeader: true, hColor: bleuNordique),
                        _buildTableRow(['🍂 Automne', 'RECOMMANDÉ : Magnifique, couleurs flamboyantes des arbres reflétées dans l\'eau']),
                        _buildTableRow(['🌱 Printemps', 'Agréable, réveil de la nature et faune active']),
                        _buildTableRow(['❄️ Hiver', 'À ÉVITER : Froid très rude, sentiers potentiellement glissants ou impraticables']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('⏰ Horaires conseillés', bleuNordique),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moment', 'Conseils'], isHeader: true, hColor: bleuNordique),
                        _buildTableRow(['✨ Matin', 'RECOMMANDÉ : Brume mystique au-dessus des étangs']),
                        _buildTableRow(['🌅 Soir', 'RECOMMANDÉ : Lumière douce et couchers de soleil sur l\'eau']),
                        _buildTableRow(['☀️ Midi / Nuit', 'À ÉVITER : Lumière trop crue en journée, risque de se perdre la nuit']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Aperçu du lieu', bleuNordique),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/1.jpg'),
                          _buildGalleryImage('assets/image/5.jpg'),
                          _buildGalleryImage('assets/image/6.jpg'),
                          _buildGalleryImage('assets/image/2.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Indispensables & Infos', bleuNordique),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Situé en Haute-Saône (Bourgogne-Franche-Comté)", bleuNordique),
                          _buildTechRow(Icons.directions_walk, "Nombreux sentiers de randonnée pédestre", bleuNordique),
                          _buildTechRow(Icons.nature, "Espaces sauvages : forêts et tourbières", bleuNordique),
                          _buildTechRow(Icons.camera_alt, "Privilégier l'automne pour la photographie", bleuNordique),
                          _buildTechRow(Icons.warning_amber_rounded, "Éviter la nuit et le plein hiver", bleuNordique),
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

  Widget _buildFactLine(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
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
      margin: const EdgeInsets.only(right: 15),
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