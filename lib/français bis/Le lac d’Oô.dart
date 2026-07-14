import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacOoPage extends StatefulWidget {
  const LacOoPage({super.key});

  @override
  State<LacOoPage> createState() => _LacOoPageState();
}

class _LacOoPageState extends State<LacOoPage> {
  @override
  Widget build(BuildContext context) {
    const Color turquoise = Color(0xFF40E0D0);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. IMAGE DE FOND FIXE
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/image/12.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. PANNEAU DE CONTENU DÉFILABLE
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF141619),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lac d’Oô 🏔️',
                      style: GoogleFonts.cinzel(
                        color: turquoise,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇨🇦 Un air de Canada sauvage dans les Pyrénées",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Le cirque pyrénéen grandiose",
                      style: GoogleFonts.montserrat(
                        color: turquoise.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Située au sud de Bagnères-de-Luchon dans la vallée du Larboust, le lac d'Oô est une retenue hydroélectrique emblématique. Il est dominé par une cascade spectaculaire de 275 mètres, dévalant directement du lac d'Espingo pour alimenter ce bassin d'altitude.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU RANDONNÉE
                    _buildSectionTitle('🥾 Fiche technique rando'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1.5), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Info', 'Détails'], isHeader: true, hColor: turquoise),
                        _buildTableRow(['Départ', 'Granges d\'Astau (1 139m)']),
                        _buildTableRow(['Dénivelé', '+ 365m']),
                        _buildTableRow(['Temps', '2h30 à 3h (A/R)']),
                        _buildTableRow(['Difficulté', 'Facile à modérée']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Aperçu du lieu'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/15.png'),
                          _buildGalleryImage('assets/image/14.jpeg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de visite'),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.calendar_today, "Saison idéale : Juin à septembre", turquoise),
                          _buildTechRow(Icons.block, "À éviter : Périodes enneigées (risque avalanche)", turquoise),
                          _buildTechRow(Icons.access_time, "Horaires : Départ matinal impératif (parking)", turquoise),
                          _buildTechRow(Icons.warning_amber_rounded, "Équipement : Chaussures de marche obligatoires", turquoise),
                          _buildTechRow(Icons.pets, "Chiens admis en laisse (Attention aux troupeaux)", turquoise),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- MÉTHODES DE STYLE ---

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

  Widget _buildSectionTitle(String title) {
    return Text(title, style: GoogleFonts.cinzel(color: const Color(0xFF40E0D0), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
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