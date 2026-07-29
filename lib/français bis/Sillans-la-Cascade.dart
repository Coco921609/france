import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SillansLaCascadePage extends StatefulWidget {
  const SillansLaCascadePage({super.key});

  @override
  State<SillansLaCascadePage> createState() => _SillansLaCascadePageState();
}

class _SillansLaCascadePageState extends State<SillansLaCascadePage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Turquoise (La couleur de l'eau de la cascade)
    const Color turquoiseSillans = Color(0xFF1ABC9C);

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
                'assets/imag/21.jpg',
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
                      'Sillans-la-Cascade 💦',
                      style: GoogleFonts.cinzel(
                        color: turquoiseSillans,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Provence-Alpes-Côte d'Azur (Var)", turquoiseSillans),
                    _buildFactLine("Type", "Cascade de 44 mètres de haut", turquoiseSillans),
                    _buildFactLine("Air de", "Cascades de Krka (Croatie 🇭🇷)", turquoiseSillans),

                    const SizedBox(height: 25),
                    Text(
                      "🌴 Un lagon tropical au cœur du Var",
                      style: GoogleFonts.montserrat(
                        color: turquoiseSillans.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Sillans-la-Cascade offre l'un des spectacles naturels les plus impressionnants du sud de la France. Ses eaux tumultueuses chutent de 44 mètres de haut dans une magnifique vasque aux reflets émeraude et turquoise, nichée au sein d'une forêt verdoyante. Un joyau rafraîchissant très prisé à l'arrivée des beaux jours.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', turquoiseSillans),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: turquoiseSillans),
                        _buildTableRow(['🚗 Voiture', 'Parkings payants à l\'entrée du village (vite saturés l\'été)']),
                        _buildTableRow(['🥾 Marche', 'Sentier aménagé de 800m (environ 15 min) jusqu\'au belvédère']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', turquoiseSillans),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/21.webp'),
                          _buildGalleryImage('assets/imag/22.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', turquoiseSillans),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.not_interested, "Baignade strictement interdite dans la vasque principale (chute de pierres)", turquoiseSillans),
                          _buildTechRow(Icons.security, "Restez sur le chemin balisé et ne franchissez pas les barrières", turquoiseSillans),
                          _buildTechRow(Icons.pool, "Baignade autorisée uniquement en aval (plus bas dans la rivière)", turquoiseSillans),
                          _buildTechRow(Icons.sunny_snowing, "Très fréquenté en été : venez tôt le matin pour la meilleure lumière", turquoiseSillans),
                          _buildTechRow(Icons.hiking, "Chaussures fermées recommandées, le chemin peut être glissant", turquoiseSillans),
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