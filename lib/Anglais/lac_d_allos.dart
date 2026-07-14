import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDAllosPage extends StatefulWidget {
  const LacDAllosPage({super.key});

  @override
  State<LacDAllosPage> createState() => _LacDAllosPageState();
}

class _LacDAllosPageState extends State<LacDAllosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. IMAGE DE FOND
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/20.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. CONTENU
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
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Allos Lake 🇳🇴',
                          style: GoogleFonts.cinzel(color: const Color(0xFF5DADE2), fontSize: 28, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10),
                    Text("🏔️ A touch of Norway in the heart of the Alps",
                        style: GoogleFonts.montserrat(color: const Color(0xFF5DADE2).withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic)),
                    const SizedBox(height: 25),

                    Text("Located at an altitude of 2,228 meters, Lake Allos is the largest natural high-altitude lake in Europe. With its clear waters surrounded by steep peaks, it offers a landscape worthy of Norwegian fjords, inviting you to contemplate and recharge in the heart of wild nature.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6)),
                    const SizedBox(height: 35),

                    _buildSectionTitle('Seasons & Calendar'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      children: [
                        _buildTableRow(['Season', 'Tip'], isHeader: true),
                        _buildTableRow(['🍂 Autumn', 'Magnificent tree colors.']),
                        _buildTableRow(['🌱 Spring', 'Fresh air, nature awakening.']),
                        _buildTableRow(['❄️ Winter/Summer', 'Avoid (Difficult access/Crowds).']),
                      ],
                    ),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Recommended Times'),
                    const SizedBox(height: 15),
                    Text("To enjoy the calm and the most beautiful light, choose the early morning (before 9am). Avoid the 12pm-3pm window, which is often more crowded.",
                        style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5)),

                    const SizedBox(height: 35),
                    // GALERIE D'IMAGES
                    _buildSectionTitle('Site Preview'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/21.jpg'),
                          _buildGalleryImage('assets/images/22.jpg'),
                          _buildGalleryImage('assets/images/23.jpg'),
                          _buildGalleryImage('assets/images/24.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Practical Info'),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: const Color(0xFF1A1C20), borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.camera_alt, "Camera essential, especially in autumn: the sunset on the tree colors is magical."),
                          _buildTechRow(Icons.hiking, "Plan for good hiking shoes."),
                          _buildTechRow(Icons.landscape, "Protected area: stay on the marked trails."),
                          _buildTechRow(Icons.thermostat, "Cool temperatures at altitude: bring layers."),
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

  // --- MÉTHODES ---

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(children: cells.map((cell) => Padding(padding: const EdgeInsets.all(10), child: Text(cell, style: GoogleFonts.montserrat(color: isHeader ? const Color(0xFF5DADE2) : Colors.white70, fontSize: 12, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)))).toList());
  }

  Widget _buildSectionTitle(String title) {
    return Text(title.toUpperCase(), style: GoogleFonts.cinzel(color: const Color(0xFF5DADE2), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
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

  Widget _buildTechRow(IconData icon, String label) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: const Color(0xFF5DADE2).withOpacity(0.5), size: 20), const SizedBox(width: 15), Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13, height: 1.4)))]));
  }
}