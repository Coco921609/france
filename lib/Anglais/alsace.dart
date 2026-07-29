import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheminCimesAlsacePage extends StatefulWidget {
  const CheminCimesAlsacePage({super.key});

  @override
  State<CheminCimesAlsacePage> createState() => _CheminCimesAlsacePageState();
}

class _CheminCimesAlsacePageState extends State<CheminCimesAlsacePage> {
  @override
  Widget build(BuildContext context) {
    const Color vertCime = Color(0xFF27AE60);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT (Intégrée au défilement global)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset('assets/images/55.jpg', fit: BoxFit.cover),
            ),

            // 2. CONTENU (Remonté légèrement pour le design)
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
                    Text('Treetop Walk 🌳', style: GoogleFonts.cinzel(color: vertCime, fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    Text("🇩🇪 A touch of Black Forest in Alsace", style: GoogleFonts.montserrat(color: vertCime.withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic)),
                    const SizedBox(height: 25),
                    Text("Perched in the heart of the Northern Vosges, the Treetop Walk invites you for a unique stroll above the trees. A spectacular panoramic path offering a new perspective on the forest and the surrounding landscapes.", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6)),

                    // --- TARIFS ---
                    const SizedBox(height: 35),
                    _buildSectionTitle('🎟️ Prices'),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Type', 'Price'],
                      ['Adult', '15.00 €'],
                      ['Child (4-14 years)*', '12.00 €'],
                      ['Family Pass', '39.00 €'],
                      ['Reduced Rate (Disab/Stud/Sen)', '13.00 €'],
                      ['Child < 4 years', 'Free'],
                      ['Slide', '2.00 €'],
                    ], vertCime),
                    Text("*Children under 14 must be accompanied by an adult.", style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 11)),

                    const SizedBox(height: 25),
                    _buildSectionTitle('💳 Season Pass'),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Type', 'Price'],
                      ['Adult', '45.00 €'],
                      ['Reduced Rate', '39.00 €'],
                      ['Child (4-14 years)', '32.00 €'],
                      ['Family Pass', '99.00 €'],
                    ], vertCime),

                    const SizedBox(height: 25),
                    _buildSectionTitle('🎫 Combined Tickets'),
                    const SizedBox(height: 15),
                    Text("Family Pass (Adventure Forest + Treetop Walk) : 53.00 €", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14)),

                    // --- CALENDRIER ---
                    const SizedBox(height: 35),
                    _buildSectionTitle('🗓️ Opening Calendar'),
                    const SizedBox(height: 15),
                    Text("Annual closure: from November to March.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 10),
                    _buildTable([
                      ['Period', 'Details'],
                      ['April', '10am-6pm (Closed: 1, 2, 7, 28)'],
                      ['May - June', '10am-7pm (Closed Tuesdays)'],
                      ['July - Sept', '10am-7pm (Sept: Closed Tuesdays)'],
                      ['October', '10am-6pm (Closed: 6, 13)'],
                    ], vertCime),

                    // --- GALERIE ---
                    const SizedBox(height: 35),
                    _buildSectionTitle('📸 Gallery'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/54.jpg'),
                          _buildGalleryImage('assets/images/66.jpg'),
                          _buildGalleryImage('assets/images/33.jpg'),
                          _buildGalleryImage('assets/images/36.jpg'),
                        ],
                      ),
                    ),

                    // --- ACCÈS ---
                    const SizedBox(height: 35),
                    _buildSectionTitle('🚗 Arrival & Parking'),
                    const SizedBox(height: 15),
                    Text("GPS Address: Route de Schoenenbourg, 67160 Drachenbronn.\n\nPlease park at the large free parking lot next to the 7 Fontaines swimming pool. The lot offers spaces for cars, buses, bikes, and two Izivia charging stations. Parking along the roads is prohibited for safety reasons. Direct access to the entrance by car or bike is not possible.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                    const SizedBox(height: 20),
                    _buildSectionTitle('🚌 Shuttle & Walking'),
                    const SizedBox(height: 15),
                    Text("A free shuttle takes you from the parking to the entrance. The stop is located right next to the parking. Enjoy the impressive nature of the Northern Vosges during the ride! \n\nPrefer to walk? A marked hiking trail allows you to reach the site in about an hour, with information panels and rest areas along the way.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                    // --- TOUR, TOBOGGAN, SENTIER ---
                    const SizedBox(height: 35),
                    _buildSectionTitle('🗼 360° View'),
                    const SizedBox(height: 15),
                    Text("The panoramic tower reaches 29m over 10 floors. Accessible via a gentle spiral ramp for wheelchairs and strollers. Unique 360° panorama of the Rhine Plain, the Black Forest, and the Northern Vosges (even Strasbourg Cathedral on a clear day).\n\nStats: Length 425m, Gradient 6%.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                    const SizedBox(height: 20),
                    _buildSectionTitle('🎢 Slide'),
                    const SizedBox(height: 15),
                    Text("75m tunnel slide for a thrilling descent! Price: 2€/run. Sliding mat from age 6. Free for under 6s accompanied. Closed in case of rain, snow, or high humidity.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                    const SizedBox(height: 20),
                    _buildSectionTitle('🌿 The Trail'),
                    const SizedBox(height: 15),
                    Text("1050 meters of barrier-free trail between 5 and 23m high. Educational games and balance stations about local fauna (lynx, wildcat) to learn while having fun. Very safe for children.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                    // --- AVERTISSEMENTS ---
                    const SizedBox(height: 35),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                      child: Text("⚠️ Warning: Prices and hours may change during the year. Check conditions and opening times before you leave.", style: GoogleFonts.montserrat(color: Colors.orangeAccent, fontSize: 13, fontStyle: FontStyle.italic)),
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

  Widget _buildSectionTitle(String title) {
    return Text(title.toUpperCase(), style: GoogleFonts.cinzel(color: const Color(0xFF27AE60), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
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

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        bool isHeader = entry.key == 0;
        return TableRow(
          children: entry.value.map((cell) => Padding(
            padding: const EdgeInsets.all(10),
            child: Text(cell, style: GoogleFonts.montserrat(
              color: isHeader ? hColor : Colors.white70,
              fontSize: 12, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            )),
          )).toList(),
        );
      }).toList(),
    );
  }
}