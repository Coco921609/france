import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaCamarguePage extends StatefulWidget {
  const LaCamarguePage({super.key});

  @override
  State<LaCamarguePage> createState() => _LaCamarguePageState();
}

class _LaCamarguePageState extends State<LaCamarguePage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Rose Flamant (L'identité visuelle de la Camargue)
    const Color roseCamargue = Color(0xFFEC407A);

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
                'assets/ima/9.webp',
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
                      'La Camargue 🦩',
                      style: GoogleFonts.cinzel(
                        color: roseCamargue,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Bouches-du-Rhône / Gard (Camargue)", roseCamargue),
                    _buildFactLine("Type", "Parc naturel régional / Zone humide", roseCamargue),
                    _buildFactLine("Air de", "Parc de Doñana (Espagne 🇪🇸)", roseCamargue),

                    const SizedBox(height: 25),
                    Text(
                      "🌾 Terre sauvage entre ciel et sel",
                      style: GoogleFonts.montserrat(
                        color: roseCamargue.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "La Camargue est un delta unique, façonné par les eaux du Rhône et les embruns de la Méditerranée. Entre ses lagunes, ses manades de taureaux, ses chevaux blancs et ses colonies de flamants roses, c'est un sanctuaire de biodiversité. Le spectacle de la lumière qui se reflète sur ses étangs immenses, particulièrement au lever et au coucher du soleil, est inoubliable.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', roseCamargue),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: roseCamargue),
                        _buildTableRow(['🚗 Voiture', 'Accès par Arles ou Saintes-Maries-de-la-Mer']),
                        _buildTableRow(['🐎 Cheval', 'L\'exploration incontournable au rythme des chevaux camarguais']),
                        _buildTableRow(['🚲 Vélo', 'Sentiers plats à travers les marais et les rizières']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', roseCamargue),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/7.webp'),
                          _buildGalleryImage('assets/ima/8.webp'),
                          _buildGalleryImage('assets/ima/10.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', roseCamargue),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.brightness_5, "Lever/Coucher : les ciels camarguais sont légendaires pour leurs teintes pourpres.", roseCamargue),
                          _buildTechRow(Icons.bug_report, "Répulsif puissant : les moustiques sont omniprésents en zones humides.", roseCamargue),
                          _buildTechRow(Icons.camera_alt, "Emportez un téléobjectif : la faune (flamants, chevaux) est distante pour préserver le calme.", roseCamargue),
                          _buildTechRow(Icons.directions_bike, "Ne sortez pas des sentiers balisés pour protéger les écosystèmes fragiles.", roseCamargue),
                          _buildTechRow(Icons.wb_sunny, "Le soleil réverbère sur l'eau : lunettes et crème solaire obligatoires.", roseCamargue),
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