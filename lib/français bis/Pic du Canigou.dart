import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PicCanigouPage extends StatefulWidget {
  const PicCanigouPage({super.key});

  @override
  State<PicCanigouPage> createState() => _PicCanigouPageState();
}

class _PicCanigouPageState extends State<PicCanigouPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Orange Catalan (Soleil et terre minérale)
    const Color canigouColor = Color(0xFFE67E22);

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
                'assets/ima/24.jpg',
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
                      'Pic du Canigou ☀️',
                      style: GoogleFonts.cinzel(
                        color: canigouColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Pyrénées-Orientales (Massif du Canigou)", canigouColor),
                    _buildFactLine("Altitude", "2 784 mètres", canigouColor),
                    _buildFactLine("Air de", "Mont Olympus (Grèce 🇬🇷)", canigouColor),

                    const SizedBox(height: 25),
                    Text(
                      "⛰️ La montagne sacrée des Catalans",
                      style: GoogleFonts.montserrat(
                        color: canigouColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Symbole fort de l'identité catalane, le Pic du Canigou domine la plaine du Roussillon. Massif de contrastes, il offre des faces abruptes et des vallées verdoyantes. Que vous cherchiez une balade familiale ou un défi technique dans sa fameuse cheminée, chaque itinéraire raconte une facette différente de cette montagne indomptable.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // --- ITINÉRAIRES ---
                    _buildSectionTitle('🥾 Les 6 itinéraires', canigouColor),
                    const SizedBox(height: 20),
                    _buildRouteCard("1. Sentier des Cortalets", "4h AR | Le classique familial, large et bien balisé.", canigouColor),
                    _buildRouteCard("2. Refuge de Mariailles", "6-7h AR | Immersion sauvage en forêt et clairières.", canigouColor),
                    _buildRouteCard("3. La Cheminée", "7-8h AR | Technique : passage rocheux, mains et pieds requis.", canigouColor),
                    _buildRouteCard("4. Versant Nord", "8h AR | Solitude et grands espaces, départ via Fillols.", canigouColor),
                    _buildRouteCard("5. Vernet-les-Bains", "9-10h AR | L'ascension totale, exigeante et gratifiante.", canigouColor),
                    _buildRouteCard("6. Le Col de Jou", "5-6h AR | Sportif : pentes fortes pour entraînement intensif.", canigouColor),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', canigouColor),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/24.jpg'),
                          _buildGalleryImage('assets/ima/23.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', canigouColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.water_drop, "Eau : prévoyez large ! Les sources sont rares sur certains tronçons.", canigouColor),
                          _buildTechRow(Icons.checkroom, "Équipement : vérifiez la météo avant le départ, la haute montagne change vite.", canigouColor),
                          _buildTechRow(Icons.terrain, "Technique : la cheminée n'est pas pour tout le monde, évaluez bien votre aisance face au vide.", canigouColor),
                          _buildTechRow(Icons.light_mode, "Départ : partez tôt, surtout pour les itinéraires de 8h et plus.", canigouColor),
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

  Widget _buildRouteCard(String title, String desc, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 5),
          Text(desc, style: GoogleFonts.montserrat(color: Colors.white60, fontSize: 13)),
        ],
      ),
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