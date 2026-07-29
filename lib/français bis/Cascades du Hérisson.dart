import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CascadesDuHerissonPage extends StatefulWidget {
  const CascadesDuHerissonPage({super.key});

  @override
  State<CascadesDuHerissonPage> createState() => _CascadesDuHerissonPageState();
}

class _CascadesDuHerissonPageState extends State<CascadesDuHerissonPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Vert Émeraude (Forêt jurassienne et nature luxuriante)
    const Color vertHerisson = Color(0xFF27AE60);

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
                'assets/imag/24.webp',
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
                      'Cascades du Hérisson 💦',
                      style: GoogleFonts.cinzel(
                        color: vertHerisson,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Bourgogne-Franche-Comté (Jura)", vertHerisson),
                    _buildFactLine("Type", "Série de 31 sauts et cascades", vertHerisson),
                    _buildFactLine("Air de", "Lacs de Plitvice (Croatie 🇭🇷)", vertHerisson),

                    const SizedBox(height: 25),
                    Text(
                      "🌿 La magie de l'eau au cœur du Jura",
                      style: GoogleFonts.montserrat(
                        color: vertHerisson.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "La vallée du Hérisson offre un spectacle naturel éblouissant avec son parcours jalonné de 31 sauts et cascades. Les plus célèbres, l'Éventail (65 mètres) et le Grand Saut (60 mètres), déploient toute leur puissance dans un écrin de forêt préservée. C'est l'une des randonnées incontournables de l'est de la France, particulièrement majestueuse après les pluies.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', vertHerisson),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: vertHerisson),
                        _buildTableRow(['🚗 Voiture', 'Trois accès : Doucier (Maison des Cascades), Bonlieu ou Ilay. Parkings payants en saison.']),
                        _buildTableRow(['🥾 Randonnée', 'Sentier aller-retour de 7,4 km (environ 3h de marche) pour voir l\'intégralité des chutes.']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', vertHerisson),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/26.jpg'),
                          _buildGalleryImage('assets/imag/28.jpg'),
                          _buildGalleryImage('assets/imag/27.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', vertHerisson),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.water_drop, "Le débit varie fortement : sublime au printemps ou après la pluie, parfois à sec l'été.", vertHerisson),
                          _buildTechRow(Icons.not_interested, "Baignade strictement interdite sur l'ensemble du site naturel (arrêté préfectoral).", vertHerisson),
                          _buildTechRow(Icons.hiking, "Bonnes chaussures indispensables, les roches et sentiers sont très glissants.", vertHerisson),
                          _buildTechRow(Icons.wb_sunny, "Site très prisé l'été : préférez le matin ou les couleurs de l'automne.", vertHerisson),
                          _buildTechRow(Icons.pets, "Chiens autorisés, mais doivent être impérativement tenus en laisse.", vertHerisson),
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