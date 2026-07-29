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
      // Le SingleChildScrollView englobe désormais tout l'écran pour défiler comme un site
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            // 1. IMAGE DE FOND (qui défile maintenant avec le reste)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset('assets/images/55.jpg', fit: BoxFit.cover),
            ),

            // 2. PANNEAU DE CONTENU (qui s'étend selon son contenu)
            Container(
              // 1.0 - 0.62 = 0.38 -> reproduit exactement l'alignement d'origine
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.38),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF141619),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chemin des Cimes 🌳', style: GoogleFonts.cinzel(color: vertCime, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Text("🇩🇪 Un air de Forêt-Noire en Alsace", style: GoogleFonts.montserrat(color: vertCime.withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic)),
                  const SizedBox(height: 25),
                  Text("Perché au cœur des Vosges du Nord, le Chemin des Cimes vous invite à une balade unique au sommet des arbres. Un sentier panoramique spectaculaire qui offre une perspective inédite sur la forêt et les paysages environnants.", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6)),

                  // --- TARIFS ---
                  const SizedBox(height: 35),
                  _buildSectionTitle('🎟️ Tarifs Chemin des Cimes'),
                  const SizedBox(height: 15),
                  _buildTable([
                    ['Type', 'Tarif'],
                    ['Adulte', '15,00 €'],
                    ['Enfant (4-14 ans)*', '12,00 €'],
                    ['Pass Famille', '39,00 €'],
                    ['Tarif réduit (PMR/Étud/Retr)', '13,00 €'],
                    ['Enfant < 4 ans', 'Gratuit'],
                    ['Toboggan', '2,00 €'],
                  ], vertCime),
                  Text("*Enfants de -14 ans accompagnés d'un adulte.", style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 11)),

                  const SizedBox(height: 25),
                  _buildSectionTitle('💳 Abonnement Saison'),
                  const SizedBox(height: 15),
                  _buildTable([
                    ['Type', 'Tarif'],
                    ['Adulte', '45,00 €'],
                    ['Tarif réduit', '39,00 €'],
                    ['Enfant (4-14 ans)', '32,00 €'],
                    ['Pass Famille', '99,00 €'],
                  ], vertCime),

                  const SizedBox(height: 25),
                  _buildSectionTitle('🎫 Billets Combinés'),
                  const SizedBox(height: 15),
                  Text("Pass famille (Forêt d'Aventure + Chemin des Cimes) : 53,00 €", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14)),

                  // --- CALENDRIER ---
                  const SizedBox(height: 35),
                  _buildSectionTitle('🗓️ Calendrier d\'ouverture'),
                  const SizedBox(height: 15),
                  Text("Fermeture annuelle : de novembre à mars.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 10),
                  _buildTable([
                    ['Période', 'Détails'],
                    ['Avril', '10h-18h (Fermé : 1, 2, 7, 28)'],
                    ['Mai - Juin', '10h-19h (Fermé les mardis)'],
                    ['Juil - Sept', '10h-19h (Sept: Fermé les mardis)'],
                    ['Octobre', '10h-18h (Fermé : 6, 13)'],
                  ], vertCime),

                  // --- GALERIE ---
                  const SizedBox(height: 35),
                  _buildSectionTitle('📸 Aperçu du lieu'),
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
                  _buildSectionTitle('🚗 Arrivée & Parking'),
                  const SizedBox(height: 15),
                  Text("Adresse GPS : Route de Schoenenbourg, 67160 Drachenbronn.\n\nVeuillez vous garer sur le grand parking gratuit à côté de la piscine des 7 Fontaines. Le parking propose des emplacements voitures, autocars, vélos et deux bornes de recharge Izivia. Il est interdit de se garer le long des routes pour des raisons de sécurité. L'accès direct à l'entrée en voiture ou vélo n'est pas possible.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                  const SizedBox(height: 20),
                  _buildSectionTitle('🚌 Navette & Marche'),
                  const SizedBox(height: 15),
                  Text("Une navette gratuite vous emmène du parking à l'entrée. L'arrêt est situé juste à côté. Profitez de la nature impressionnante des Vosges du Nord pendant le trajet ! \n\nVous préférez marcher ? Un sentier de randonnée balisé vous permet de rejoindre le site en environ une heure, avec des panneaux informatifs et des aires de repos.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                  // --- TOUR, TOBOGGAN, SENTIER ---
                  const SizedBox(height: 35),
                  _buildSectionTitle('🗼 Vue à 360°'),
                  const SizedBox(height: 15),
                  Text("La tour panoramique culmine à 29m sur 10 étages. Accessible en spirale douce aux fauteuils roulants et poussettes. Panorama unique sur la plaine du Rhin, la Forêt-Noire et les Vosges du Nord (voire la cathédrale de Strasbourg par ciel dégagé).\n\nChiffres : Longueur 425m, Pente 6%.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                  const SizedBox(height: 20),
                  _buildSectionTitle('🎢 Toboggan'),
                  const SizedBox(height: 15),
                  Text("Toboggan tunnel de 75m pour une descente en trombe ! Prix : 2€/descente. Tapis de glisse dès 6 ans. Gratuit pour les -6 ans accompagnés. Fermé en cas de pluie, neige ou forte humidité.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                  const SizedBox(height: 20),
                  _buildSectionTitle('🌿 Le Sentier'),
                  const SizedBox(height: 15),
                  Text("1050 mètres de sentier sans obstacles entre 5 et 23m de haut. Jeux éducatifs et parcours d'équilibre sur la faune locale (lynx, chat sauvage) pour apprendre en s'amusant. Très sécurisé pour les enfants.", style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),

                  // --- AVERTISSEMENTS ---
                  const SizedBox(height: 35),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                    child: Text("⚠️ Attention : les prix et horaires peuvent changer au cours de l'année. Vérifiez les conditions et ouvertures avant de partir.", style: GoogleFonts.montserrat(color: Colors.orangeAccent, fontSize: 13, fontStyle: FontStyle.italic)),
                  ),

                  const SizedBox(height: 60),
                ],
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