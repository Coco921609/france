import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForetDeBroceliandePage extends StatefulWidget {
  const ForetDeBroceliandePage({super.key});

  @override
  State<ForetDeBroceliandePage> createState() => _ForetDeBroceliandePageState();
}

class _ForetDeBroceliandePageState extends State<ForetDeBroceliandePage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Vert Émeraude (Forêt légendaire)
    const Color vertEmeraude = Color(0xFF27AE60);

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
                'assets/image/55.jpg',
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
                      'Forêt de Brocéliande 🌳',
                      style: GoogleFonts.cinzel(
                        color: vertEmeraude,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Bretagne (Ille-et-Vilaine)", vertEmeraude),
                    _buildFactLine("Ambiance", "Mythique et féerique", vertEmeraude),
                    _buildFactLine("Légende", "L'enchanteur Merlin et la Fée Viviane", vertEmeraude),

                    const SizedBox(height: 25),
                    Text(
                      "✨ Le royaume des légendes arthuriennes",
                      style: GoogleFonts.montserrat(
                        color: vertEmeraude.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Plongez au cœur du mystère breton. La forêt de Brocéliande, célèbre pour ses liens avec les légendes arthuriennes, invite à la méditation entre les chênes centenaires, les étangs secrets et les pierres chargées d'histoire. Un lieu où le réel et le merveilleux se rencontrent.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', vertEmeraude),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: vertEmeraude),
                        _buildTableRow(['🚗 Voiture', 'Accès par Paimpont (D773)']),
                        _buildTableRow(['🥾 Randonnée', 'Sentiers balisés de la Porte des Secrets']),
                        _buildTableRow(['🚲 Vélo', 'Voies vertes traversant la forêt']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', vertEmeraude),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/52.jpeg'),
                          _buildGalleryImage('assets/image/53.jpg'),
                          _buildGalleryImage('assets/image/54.jpg'),
                          _buildGalleryImage('assets/image/56.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', vertEmeraude),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_cloudy, "Climat breton : prévoyez une veste", vertEmeraude),
                          _buildTechRow(Icons.directions_walk, "Restez sur les sentiers balisés", vertEmeraude),
                          _buildTechRow(Icons.mosque, "Respectez le calme des lieux sacrés", vertEmeraude),
                          _buildTechRow(Icons.camera_alt, "Lumière magique à l'aube", vertEmeraude),
                          _buildTechRow(Icons.delete_outline, "Zéro trace : la fée vous remercie", vertEmeraude),
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