import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EtretatPage extends StatefulWidget {
  const EtretatPage({super.key});

  @override
  State<EtretatPage> createState() => _EtretatPageState();
}

class _EtretatPageState extends State<EtretatPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Craie et Mer (Teintes douces et minérales)
    const Color etretatColor = Color(0xFF607D8B);

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
                'assets/imag/31.jpg',
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
                      'Étretat 🌊',
                      style: GoogleFonts.cinzel(
                        color: etretatColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Normandie (Seine-Maritime)", etretatColor),
                    _buildFactLine("Structure", "Falaise d'Aval, d'Amont et Manneporte", etretatColor),
                    _buildFactLine("Air de", "Côte Jurassique (UK 🇬🇧)", etretatColor),

                    const SizedBox(height: 25),
                    Text(
                      "🎨 La quintessence de la lumière impressionniste",
                      style: GoogleFonts.montserrat(
                        color: etretatColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Célèbre pour ses arches naturelles monumentales et ses falaises de craie blanche plongeant dans la Manche, Étretat est un chef-d'œuvre naturel. Inspiratrice des plus grands peintres comme Monet, cette côte offre un spectacle géologique unique qui change radicalement au gré des marées et des heures de la journée.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', etretatColor),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: etretatColor),
                        _buildTableRow(['🚗 Voiture', 'Parkings en périphérie (navettes disponibles l\'été)']),
                        _buildTableRow(['🥾 Marche', 'Chemin des douaniers (GR21) sur le haut des falaises']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', etretatColor),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/34.jpeg'),
                          _buildGalleryImage('assets/imag/32.jpg'),
                          _buildGalleryImage('assets/imag/39.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', etretatColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.brightness_5, "Lever et coucher du soleil : c'est là que les falaises s'embrasent avec des ciels incroyables.", etretatColor),
                          _buildTechRow(Icons.waves, "Vérifiez les horaires des marées : certaines grottes ne sont accessibles qu'à marée basse.", etretatColor),
                          _buildTechRow(Icons.camera_alt, "Emportez un trépied pour les photos longue pose de l'écume sur la craie.", etretatColor),
                          _buildTechRow(Icons.wind_power, "Le vent est constant sur le haut des falaises, prévoyez un coupe-vent.", etretatColor),
                          _buildTechRow(Icons.directions_walk, "Évitez de marcher trop près du bord, l'érosion est active.", etretatColor),
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