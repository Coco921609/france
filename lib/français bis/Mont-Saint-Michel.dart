import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MontSaintMichelPage extends StatefulWidget {
  const MontSaintMichelPage({super.key});

  @override
  State<MontSaintMichelPage> createState() => _MontSaintMichelPageState();
}

class _MontSaintMichelPageState extends State<MontSaintMichelPage> {
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
              'assets/image/53.jpg',
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
                      'Mont-Saint-Michel 🏰',
                      style: GoogleFonts.cinzel(
                        color: turquoise,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇯🇵 Un air de Miyajima au cœur de la Normandie",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "La merveille de l'Occident",
                      style: GoogleFonts.montserrat(
                        color: turquoise.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Dressée au milieu d'une baie spectaculaire soumise aux plus grandes marées d'Europe, cette abbaye millénaire semble flotter entre ciel et mer. Entre ses remparts médiévaux et ses ruelles escarpées, le Mont offre une immersion mystique hors du temps.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // POINTS D'INTÉRÊT
                    _buildSectionTitle('✨ À voir absolument'),
                    const SizedBox(height: 20),
                    _buildPointItem("L'Abbaye", "Le joyau architectural au sommet, véritable prouesse technique du Moyen Âge."),
                    _buildPointItem("La Grande Rue", "L'artère principale chargée d'histoire, bordée de maisons anciennes et de boutiques."),
                    _buildPointItem("La Baie", "Un écosystème unique où la mer se retire à perte de vue lors des grandes marées."),
                    _buildPointItem("Remparts", "Le chemin de ronde offrant une vue imprenable sur l'immensité maritime environnante."),

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
                          _buildGalleryImage('assets/image/49.jpg'),
                          _buildGalleryImage('assets/image/50.webp'),
                          _buildGalleryImage('assets/image/52.webp'),
                          _buildGalleryImage('assets/image/51.jpg'),
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
                          _buildTechRow(Icons.calendar_today, "Saison idéale : Hors saison (Octobre - Mars)", turquoise),
                          _buildTechRow(Icons.block, "À éviter : Milieu de journée en été (très forte foule)", turquoise),
                          _buildTechRow(Icons.access_time, "Horaires : Privilégier le soir pour le calme", turquoise),
                          _buildTechRow(Icons.directions_walk, "Navette : Accès facilité par les navettes gratuites", turquoise),
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

  // --- WIDGETS ---

  Widget _buildPointItem(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.montserrat(color: const Color(0xFF40E0D0), fontWeight: FontWeight.bold, fontSize: 14)),
          Text(desc, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5)),
        ],
      ),
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