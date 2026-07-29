import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuatreLacsPage extends StatefulWidget {
  const QuatreLacsPage({super.key});

  @override
  State<QuatreLacsPage> createState() => _QuatreLacsPageState();
}

class _QuatreLacsPageState extends State<QuatreLacsPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuLoch = Color(0xFF2874A6);

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
                'assets/image/11.jpg',
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
                      'Les 4 Lacs 🏴󠁧󠁢󠁳󠁣󠁴󠁿',
                      style: GoogleFonts.cinzel(
                        color: bleuLoch,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Noms", "Ilay, Narlay, Petit & Grand Maclu", bleuLoch),
                    _buildFactLine("Point de vue", "Belvédère du Pic de l'Aigle", bleuLoch),
                    _buildFactLine("Air de", "Highlands (Écosse 🏴󠁧󠁢󠁳󠁣󠁴󠁿)", bleuLoch),

                    const SizedBox(height: 25),
                    Text(
                      "🏴󠁧󠁢󠁳󠁣󠁴󠁿 La Petite Écosse au cœur du Jura",
                      style: GoogleFonts.montserrat(
                        color: bleuLoch.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Surnommée la « Petite Écosse », la région des 4 lacs offre un panorama à couper le souffle. Entourés de denses forêts de sapins, ces joyaux glaciaires aux eaux émeraude et turquoise se dévoilent de façon spectaculaire depuis le sommet du Pic de l'Aigle, dans une ambiance mystique digne des Highlands.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('📅 Meilleures saisons', bleuLoch),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Saison', 'Ambiance & Conseils'], isHeader: true, hColor: bleuLoch),
                        _buildTableRow(['🍂 Automne', 'RECOMMANDÉ : Brumes matinales, couleurs rousses et ambiance 100% écossaise']),
                        _buildTableRow(['☀️ Été', 'Agréable pour de longues randonnées, mais belvédères souvent très fréquentés']),
                        _buildTableRow(['❄️ Hiver', 'À ÉVITER (ou prudence) : Sentiers vers le Pic de l\'Aigle enneigés et parfois verglacés']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('⏰ Horaires conseillés', bleuLoch),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moment', 'Conseils'], isHeader: true, hColor: bleuLoch),
                        _buildTableRow(['✨ Matin', 'RECOMMANDÉ : Magique avec la brume planant au-dessus des lacs']),
                        _buildTableRow(['🌅 Soir', 'RECOMMANDÉ : Couleurs chaudes du coucher de soleil depuis le belvédère']),
                        _buildTableRow(['🌙 Nuit', 'À ÉVITER : Zones non éclairées, danger de chute sur les crêtes']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Aperçu du lieu', bleuLoch),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/10.jpg'),
                          _buildGalleryImage('assets/image/12.jpg'),
                          _buildGalleryImage('assets/image/15.jpeg'),
                          _buildGalleryImage('assets/image/17.jpg'),
                          _buildGalleryImage('assets/image/14.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Indispensables & Infos', bleuLoch),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Situé dans le département du Jura", bleuLoch),
                          _buildTechRow(Icons.directions_walk, "Randonnée indispensable jusqu'au Belvédère des 4 lacs", bleuLoch),
                          _buildTechRow(Icons.do_not_disturb_alt, "Baignade souvent réglementée ou interdite pour préserver les lieux", bleuLoch),
                          _buildTechRow(Icons.camera_alt, "Lieu exceptionnel pour la photographie de paysage", bleuLoch),
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

  // --- HELPERS ---

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