import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DentellesMontmirailPage extends StatefulWidget {
  const DentellesMontmirailPage({super.key});

  @override
  State<DentellesMontmirailPage> createState() => _DentellesMontmirailPageState();
}

class _DentellesMontmirailPageState extends State<DentellesMontmirailPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Vert Olivier / Calcaire clair
    const Color dentellesColor = Color(0xFF829356);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/ima/33.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENU
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
                      'Dentelles de Montmirail 🧗',
                      style: GoogleFonts.cinzel(
                        color: dentellesColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Vaucluse (Massif des Dentelles)", dentellesColor),
                    _buildFactLine("Structure", "Crêtes calcaires découpées", dentellesColor),
                    _buildFactLine("Air de", "Parc National des Calanques (France 🇫🇷)", dentellesColor),

                    const SizedBox(height: 25),
                    Text(
                      "🌿 La dentelle rocheuse au milieu des vignes",
                      style: GoogleFonts.montserrat(
                        color: dentellesColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Surgissant des vignobles de Gigondas et Vacqueyras, les Dentelles de Montmirail sont de véritables sculptures naturelles de calcaire. Ces crêtes déchiquetées offrent un paysage unique en Provence, où l'escalade, la randonnée et la dégustation de vins prestigieux se mêlent dans un cadre exceptionnel.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', dentellesColor),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: dentellesColor),
                        _buildTableRow(['🚗 Voiture', 'Villages de Lafare ou Suzette pour les accès centraux']),
                        _buildTableRow(['🥾 Randonnée', 'Crêtes et sentiers en forêt domaniale']),
                        _buildTableRow(['🧗 Escalade', 'Un spot majeur du sud de la France']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', dentellesColor),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/30.jpg'),
                          _buildGalleryImage('assets/ima/31.jpg'),
                          _buildGalleryImage('assets/ima/32.jpg'),
                          _buildGalleryImage('assets/ima/33.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', dentellesColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.landscape, "Panoramas : le tour des crêtes offre une vue imprenable sur le Mont Ventoux.", dentellesColor),
                          _buildTechRow(Icons.wine_bar, "Art de vivre : combinez votre sortie avec la découverte des caves de Gigondas.", dentellesColor),
                          _buildTechRow(Icons.terrain, "Sol : calcaire parfois glissant, privilégiez des chaussures avec une bonne adhérence.", dentellesColor),
                          _buildTechRow(Icons.wb_sunny, "Été : exposition forte, préférez les randonnées le matin pour éviter la chaleur.", dentellesColor),
                          _buildTechRow(Icons.map, "Balisage : bien que présent, le réseau de sentiers est dense, une carte reste utile.", dentellesColor),
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