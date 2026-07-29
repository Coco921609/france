import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiguillesBavellaPage extends StatefulWidget {
  const AiguillesBavellaPage({super.key});

  @override
  State<AiguillesBavellaPage> createState() => _AiguillesBavellaPageState();
}

class _AiguillesBavellaPageState extends State<AiguillesBavellaPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Granite Rosé / Vert Pin
    const Color granitBavella = Color(0xFFD35400);

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
                'assets/ima/18.jpg',
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
                      'Aiguilles de Bavella 🏔️',
                      style: GoogleFonts.cinzel(
                        color: granitBavella,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Corse du Sud (Massif de Bavella)", granitBavella),
                    _buildFactLine("Type", "Cimes de granit déchiquetées", granitBavella),
                    _buildFactLine("Air de", "Les Dolomites (Italie 🇮🇹)", granitBavella),

                    const SizedBox(height: 25),
                    Text(
                      "🪨 Le sanctuaire minéral de l'Alta Rocca",
                      style: GoogleFonts.montserrat(
                        color: granitBavella.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Site emblématique de la Corse, les Aiguilles de Bavella forment une muraille de granite rose qui transperce les nuages. Entre les forêts de pins laricio et les parois abruptes, c'est un paradis pour les randonneurs, les grimpeurs et les amoureux de la nature sauvage qui cherchent à ressentir la puissance brute de l'île de Beauté.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', granitBavella),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: granitBavella),
                        _buildTableRow(['🚗 Voiture', 'Col de Bavella, accessible depuis Zonza ou Solenzara']),
                        _buildTableRow(['🥾 Randonnée', 'Sentier du Trou de la Bombe ou variante du GR20']),
                        _buildTableRow(['🧗 Escalade', 'Voies prestigieuses sur granit pur']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', granitBavella),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/18.jpg'),
                          _buildGalleryImage('assets/ima/19.jpg'),
                          _buildGalleryImage('assets/ima/22.jpg'),
                          _buildGalleryImage('assets/ima/21.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', granitBavella),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_sunny, "Météo : le col est connu pour ses changements rapides, prévoyez toujours une veste.", granitBavella),
                          _buildTechRow(Icons.terrain, "Sol : sentiers techniques avec beaucoup de pierres meubles, chaussures montantes vivement conseillées.", granitBavella),
                          _buildTechRow(Icons.landscape, "Panorama : le 'Trou de la Bombe' est la randonnée signature, accessible à tous les bons marcheurs.", granitBavella),
                          _buildTechRow(Icons.directions_walk, "GR20 : c'est un point de passage stratégique, beaucoup de monde en été sur certains secteurs.", granitBavella),
                          _buildTechRow(Icons.photo_size_select_actual, "Lumière : les parois sont magnifiques en fin de journée quand elles prennent une teinte rouge profond.", granitBavella),
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