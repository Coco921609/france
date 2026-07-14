import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColliourePage extends StatefulWidget {
  const ColliourePage({super.key});

  @override
  State<ColliourePage> createState() => _ColliourePageState();
}

class _ColliourePageState extends State<ColliourePage> {
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
              'assets/image/46.jpg',
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
                      'Collioure 🎨',
                      style: GoogleFonts.cinzel(
                        color: turquoise,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇮🇹 Un air de Portofino sur la Côte Vermeille",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "La cité des peintres",
                      style: GoogleFonts.montserrat(
                        color: turquoise.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Joyau des Pyrénées-Orientales, Collioure est célèbre pour son clocher surplombant la mer, son château royal et ses ruelles colorées. Berceau du Fauvisme, cette cité catalane offre un mélange vibrant de patrimoine historique et de lumières méditerranéennes intenses.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // POINTS D'INTÉRÊT
                    _buildSectionTitle('✨ À voir absolument'),
                    const SizedBox(height: 20),
                    _buildPointItem("Le Clocher de l'Église", "L'emblème absolu de la ville, posé au bord de l'eau, ancien phare médiéval."),
                    _buildPointItem("Château Royal", "Une forteresse imposante témoignant de l'histoire tumultueuse entre France et Aragon."),
                    _buildPointItem("Le Chemin du Fauvisme", "Un parcours balisé sur les traces d'Henri Matisse et André Derain dans les rues du village."),
                    _buildPointItem("Plage Saint-Vincent", "Le lieu idéal pour une baignade avec une vue unique sur l'église et la baie."),

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
                          _buildGalleryImage('assets/image/44.jpg'),
                          _buildGalleryImage('assets/image/45.jpg'),
                          _buildGalleryImage('assets/image/47.jpg'),
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
                          _buildTechRow(Icons.calendar_today, "Saison idéale : Printemps et Septembre", turquoise),
                          _buildTechRow(Icons.block, "À éviter : Juillet/Août (affluence extrême)", turquoise),
                          _buildTechRow(Icons.access_time, "Horaires : Tôt le matin ou soirée pour la lumière", turquoise),
                          _buildTechRow(Icons.directions_car, "Stationnement : Parking obligatoire en périphérie", turquoise),
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