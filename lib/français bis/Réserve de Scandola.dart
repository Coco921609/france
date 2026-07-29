import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReserveScandolaPage extends StatefulWidget {
  const ReserveScandolaPage({super.key});

  @override
  State<ReserveScandolaPage> createState() => _ReserveScandolaPageState();
}

class _ReserveScandolaPageState extends State<ReserveScandolaPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Bleu mer / Rouge roche volcanique
    const Color scandolaColor = Color(0xFF4A90E2);

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
                'assets/ima/39.jpg',
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
                      'Réserve de Scandola 🐠',
                      style: GoogleFonts.cinzel(
                        color: scandolaColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Corse (Parc naturel régional)", scandolaColor),
                    _buildFactLine("Structure", "Réserve marine et terrestre", scandolaColor),
                    _buildFactLine("Air de", "Paradis terrestre (UNESCO 🌍)", scandolaColor),

                    const SizedBox(height: 25),
                    Text(
                      "🌋 L'union fascinante du feu et de l'eau",
                      style: GoogleFonts.montserrat(
                        color: scandolaColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "La réserve naturelle de Scandola est un chef-d'œuvre géologique et biologique. Ses falaises de porphyre rouge plongent dans des eaux cristallines protégées, offrant un sanctuaire aux balbuzards pêcheurs et une biodiversité marine exceptionnelle. Un site sauvage où l'accès est strictement régulé pour préserver l'intégrité de l'écosystème.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', scandolaColor),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: scandolaColor),
                        _buildTableRow(['🛥️ Bateau', 'Excursions au départ de Calvi, Galéria ou Porto']),
                        _buildTableRow(['🤿 Plongée', 'Zones autorisées en périphérie de la réserve']),
                        _buildTableRow(['🚫 Accès', 'Accès pédestre interdit dans la réserve intégrale']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', scandolaColor),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/41.webp'),
                          _buildGalleryImage('assets/ima/50.jpg'),
                          _buildGalleryImage('assets/ima/44.webp'),
                          _buildGalleryImage('assets/ima/45.jpg'),

                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', scandolaColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.eco, "Protection : la zone est protégée, aucun prélèvement (plantes, pierres, coquillages) n'est autorisé.", scandolaColor),
                          _buildTechRow(Icons.camera_alt, "Photo : les contrastes entre le rouge de la roche et le bleu de la mer sont parfaits pour les clichés.", scandolaColor),
                          _buildTechRow(Icons.directions_boat, "Booking : réservez vos sorties en bateau à l'avance, surtout en juillet et août.", scandolaColor),
                          _buildTechRow(Icons.waves, "Observation : gardez vos distances avec la faune marine, respectez le silence.", scandolaColor),
                          _buildTechRow(Icons.wb_sunny, "Météo : en cas de mer agitée, les sorties sont annulées, restez flexibles.", scandolaColor),
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