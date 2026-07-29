import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalanquesDeCassisPage extends StatefulWidget {
  const CalanquesDeCassisPage({super.key});

  @override
  State<CalanquesDeCassisPage> createState() => _CalanquesDeCassisPageState();
}

class _CalanquesDeCassisPageState extends State<CalanquesDeCassisPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuCassis = Color(0xFF2E86C1);

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
                'assets/image/35.jpg',
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
                      'Les Calanques de Cassis 🌊',
                      style: GoogleFonts.cinzel(
                        color: bleuCassis,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Provence-Alpes-Côte d’Azur", bleuCassis),
                    _buildFactLine("Accès", "Train, Car, Voiture, Bateau", bleuCassis),
                    _buildFactLine("Air de", "Parc National de La Maddalena (Sardaigne 🇮🇹)", bleuCassis),

                    const SizedBox(height: 25),
                    Text(
                      "⚓ Un joyau méditerranéen incontournable",
                      style: GoogleFonts.montserrat(
                        color: bleuCassis.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Les Calanques de Cassis offrent une expérience unique de nature, accessible par plusieurs moyens de transport. Ce site est un incontournable de la région Provence-Alpes-Côte d’Azur, offrant des paysages à couper le souffle et des expériences inoubliables entre falaises calcaires et eaux turquoise.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', bleuCassis),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: bleuCassis),
                        _buildTableRow(['🚆 Train', 'Gare SNCF de Cassis']),
                        _buildTableRow(['🚌 Car', 'Ligne M05 (La Marcouline) depuis La Ciotat']),
                        _buildTableRow(['🚗 Voiture', 'Autoroute A50, route de la Gineste depuis Marseille']),
                        _buildTableRow(['🚢 Bateau', 'Port de Cassis (services de pompage disponibles)']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', bleuCassis),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/34.webp'),
                          _buildGalleryImage('assets/image/37.webp'),
                          _buildGalleryImage('assets/image/37.webp'),
                          _buildGalleryImage('assets/image/38.jpg'),
                          _buildGalleryImage('assets/image/39.webp'),
                          _buildGalleryImage('assets/image/40.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', bleuCassis),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.directions_run, "Préparez-vous : ça grimpe et ça glisse !", bleuCassis),
                          _buildTechRow(Icons.water_drop, "Minimum 1,5 L d'eau + snacks", bleuCassis),
                          _buildTechRow(Icons.map, "GPS ou carte indispensable", bleuCassis),
                          _buildTechRow(Icons.sync, "Sens conseillé : à l'envers (anti-foule)", bleuCassis),
                          _buildTechRow(Icons.delete_outline, "Zéro déchet : respectez la forêt 🙏", bleuCassis),
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