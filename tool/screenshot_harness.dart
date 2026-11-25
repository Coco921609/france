import 'package:flutter/material.dart';
import '../lib/langues.dart';
import '../lib/presentation.dart';
import '../lib/profil.dart';
import '../lib/accueil.dart';
import '../lib/parametres.dart';
import '../lib/favoris.dart';
import '../lib/chateaux/chateau_de_verseilles.dart';
import '../lib/chateaux/chateau_de_chambord.dart';
import '../lib/paysages/calanques/calanque_de_sugiton.dart';
import '../lib/paysages/canyons/dune_du_pilat.dart';
import '../lib/paysages/eaux/gorges_du_verdon.dart';
import '../lib/paysages/panoramas/etretat.dart';
import '../lib/paysages/parcs/mont_saint_michel.dart';

const accent = Color(0xFF7C5CFF);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final screen = Uri.base.queryParameters['screen'] ?? 'language';
  final Widget page = switch (screen) {
    'language' => const LanguesPage(isProfileCreated: false),
    'presentation' => const PresentationScreen(languageCode: 'fr'),
    'profile' => const ProfileScreen(languageCode: 'fr'),
    'home' => const AccueilScreen(
        userName: 'Camille',
        languageCode: 'fr',
        selectedAvatar: '👩',
        themeColor: accent,
      ),
    'settings' => const ParametresScreen(languageCode: 'fr'),
    'favorites' => const FavorisPage(languageCode: 'fr', themeColor: accent),
    'versailles' => const ChateauDeVersaillesPage(languageCode: 'fr', themeColor: accent),
    'chambord' => const ChateauDeChambordPage(languageCode: 'fr', themeColor: accent),
    'sugiton' => const CalanqueDeSugitonPage(languageCode: 'fr', themeColor: accent),
    'pilat' => const DuneDuPilatPage(languageCode: 'fr', themeColor: accent),
    'verdon' => const GorgesDuVerdonPage(languageCode: 'fr', themeColor: accent),
    'etretat' => const EtretatPage(languageCode: 'fr', themeColor: accent),
    'mont-saint-michel' => const MontSaintMichelPage(languageCode: 'fr', themeColor: accent),
    _ => const LanguesPage(isProfileCreated: false),
  };
  runApp(MaterialApp(
    title: 'France Secrète — aperçu',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF07080F),
      colorScheme: const ColorScheme.dark(
        primary: accent,
        secondary: Color(0xFFFF5C8A),
        surface: Color(0xFF10121F),
      ),
    ),
    home: page,
  ));
}
