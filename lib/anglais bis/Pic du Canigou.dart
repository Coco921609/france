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
    // Theme color: Catalan Orange (Sun and mineral earth)
    const Color canigouColor = Color(0xFFE67E22);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. TOP IMAGE
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/ima/24.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENT
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
                      'Canigou Peak ☀️',
                      style: GoogleFonts.cinzel(
                        color: canigouColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Pyrénées-Orientales (Canigou Massif)", canigouColor),
                    _buildFactLine("Elevation", "2,784 meters", canigouColor),
                    _buildFactLine("Looks like", "Mount Olympus (Greece 🇬🇷)", canigouColor),

                    const SizedBox(height: 25),
                    Text(
                      "⛰️ The sacred mountain of the Catalans",
                      style: GoogleFonts.montserrat(
                        color: canigouColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A strong symbol of Catalan identity, the Canigou Peak dominates the Roussillon plain. A massif of contrasts, it offers steep faces and lush valleys. Whether you are looking for a family stroll or a technical challenge in its famous chimney, each route tells a different facet of this indomitable mountain.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // --- ROUTES ---
                    _buildSectionTitle('🥾 The 6 routes', canigouColor),
                    const SizedBox(height: 20),
                    _buildRouteCard("1. Cortalets Trail", "4h round trip | The family classic, wide and well-marked.", canigouColor),
                    _buildRouteCard("2. Mariailles Refuge", "6-7h round trip | Wild immersion in forests and clearings.", canigouColor),
                    _buildRouteCard("3. The Chimney", "7-8h round trip | Technical: rocky passage, hands and feet required.", canigouColor),
                    _buildRouteCard("4. North Face", "8h round trip | Solitude and open spaces, departure via Fillols.", canigouColor),
                    _buildRouteCard("5. Vernet-les-Bains", "9-10h round trip | The full ascent, demanding and rewarding.", canigouColor),
                    _buildRouteCard("6. Jou Pass", "5-6h round trip | Athletic: steep slopes for intensive training.", canigouColor),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', canigouColor),
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

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', canigouColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.water_drop, "Water: plan generously! Springs are rare on some sections.", canigouColor),
                          _buildTechRow(Icons.checkroom, "Equipment: check the weather before leaving, the high mountains change quickly.", canigouColor),
                          _buildTechRow(Icons.terrain, "Technical: the chimney is not for everyone, carefully evaluate your comfort with heights.", canigouColor),
                          _buildTechRow(Icons.light_mode, "Departure: leave early, especially for routes of 8 hours or more.", canigouColor),
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