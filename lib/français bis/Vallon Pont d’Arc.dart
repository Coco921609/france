import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VallonPontDArcPage extends StatefulWidget {
  const VallonPontDArcPage({super.key});

  @override
  State<VallonPontDArcPage> createState() => _VallonPontDArcPageState();
}

class _VallonPontDArcPageState extends State<VallonPontDArcPage> {
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
              'assets/image/23.jpg',
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
                      'Vallon Pont d’Arc 🪨',
                      style: GoogleFonts.cinzel(
                        color: turquoise,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇧🇦 Un air de Mostar située en Ardèche",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // SECTION RANDONNÉE
                    _buildSectionTitle('🥾 Fiche technique rando'),
                    const SizedBox(height: 15),
                    _buildRandoInfo(),
                    const SizedBox(height: 35),

                    // SUR LE PARCOURS
                    _buildSectionTitle('✅ Sur le parcours'),
                    const SizedBox(height: 20),
                    _buildPointItem("Le Chastelas & Vieux Vallon", "Vestiges d'un village castral du 11ème siècle, détruit lors des guerres de religion."),
                    _buildPointItem("Pont sur l'Ibie", "Ouvrage submersible du 19ème siècle reliant le village au hameau de Châmes."),
                    _buildPointItem("Cirque d'Estre", "Amphithéâtre calcaire offrant une vue plongeante sur la Combe d'Arc."),
                    _buildPointItem("Combe d'Arc", "Ancien méandre de la rivière, carrefour naturel et historique."),
                    _buildPointItem("Grotte Chauvet", "Chef-d'œuvre de l'humanité vieux de 36 000 ans, inscrit à l'UNESCO."),
                    _buildPointItem("Le Pont d'Arc", "Arche monumentale de 54m, sculptée par la rivière, unique au monde."),

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
                          _buildGalleryImage('assets/image/24.jpeg'),
                          _buildGalleryImage('assets/image/25.jpg'),
                          _buildGalleryImage('assets/image/22.jpg'),
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
                          _buildTechRow(Icons.calendar_today, "Saison idéale : Printemps pour la nature", turquoise),
                          _buildTechRow(Icons.block, "À éviter : Juillet/Août (très forte affluence)", turquoise),
                          _buildTechRow(Icons.access_time, "Horaires : Tôt le matin ou fin de journée", turquoise),
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

  // --- WIDGETS DÉDIÉS ---

  Widget _buildRandoInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTechRow(Icons.straighten, "Distance : 4,9 km", Colors.white70),
        _buildTechRow(Icons.timer, "Durée : 1h35", Colors.white70),
        _buildTechRow(Icons.north_east, "Dénivelé positif : + 263 m", Colors.white70),
        _buildTechRow(Icons.south_east, "Dénivelé négatif : - 255 m", Colors.white70),
        const SizedBox(height: 10),
        Text("💡 Possibilité de retour par navette gratuite.", style: GoogleFonts.montserrat(color: const Color(0xFF40E0D0), fontStyle: FontStyle.italic)),
      ],
    );
  }

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