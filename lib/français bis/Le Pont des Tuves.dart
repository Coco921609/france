import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PontDesTuvesPage extends StatefulWidget {
  const PontDesTuvesPage({super.key});

  @override
  State<PontDesTuvesPage> createState() => _PontDesTuvesPageState();
}

class _PontDesTuvesPageState extends State<PontDesTuvesPage> {
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
              'assets/image/28.jpg',
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
                      'Pont des Tuves 🌉',
                      style: GoogleFonts.cinzel(
                        color: turquoise,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇬🇹 Un air de temple Maya située dans le Var",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // FICHE TECHNIQUE
                    _buildSectionTitle('🥾 Fiche technique'),
                    const SizedBox(height: 15),
                    _buildTechGrid(),
                    const SizedBox(height: 35),

                    // DESCRIPTION
                    Text(
                      "Situé à Montauroux, ce pont médiéval enjambe la Siagne dans un cadre sauvage et préservé. Son architecture de pierre se fond parfaitement dans cette vallée encaissée, évoquant des vestiges oubliés au milieu d'une jungle luxuriante.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
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
                          _buildGalleryImage('assets/image/27.jpg'),
                          _buildGalleryImage('assets/image/30.jpg'),
                          _buildGalleryImage('assets/image/29.jpg'),
                          _buildGalleryImage('assets/image/31.jpg'),
                          _buildGalleryImage('assets/image/32.jpg'),
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
                          _buildTechRow(Icons.calendar_today, "Saison idéale : Printemps et Automne", turquoise),
                          _buildTechRow(Icons.block, "À éviter : Hiver (froid, humidité) et été (chaleur)", turquoise),
                          _buildTechRow(Icons.access_time, "Horaires : Matinée conseillée pour la lumière", turquoise),
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

  Widget _buildTechGrid() {
    return Column(
      children: [
        _buildTechRow(Icons.place, "Commune : Montauroux", Colors.white70),
        _buildTechRow(Icons.height, "Dénivelé : +/- 250 m", Colors.white70),
        _buildTechRow(Icons.timer, "Durée : 1h30", Colors.white70),
        _buildTechRow(Icons.straighten, "Distance : 4,2 km", Colors.white70),
        _buildTechRow(Icons.landscape, "Altitude : 166m - 395m", Colors.white70),
        _buildTechRow(Icons.star_half, "Difficulté : Facile (★★☆☆☆)", Colors.white70),
      ],
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