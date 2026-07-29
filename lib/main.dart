import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'exploration_page.dart';

void main() async {
  // 1. Nécessaire pour appeler du code natif (Firebase, AdMob, Orientations) avant runApp
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Forcer le mode portrait uniquement
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 3. Initialisation des services tiers (Firebase & Google Mobile Ads)
  // On utilise "await" pour s'assurer que tout est prêt avant de dessiner l'interface.
  try {
    await Firebase.initializeApp();
    await MobileAds.instance.initialize();
    FirebaseMessaging.instance.requestPermission();
  } catch (e) {
    debugPrint("Erreur d'initialisation des services: $e");
  }

  // 4. Lancement de l'interface utilisateur
  runApp(const FranceSecreteApp());
}

class FranceSecreteApp extends StatelessWidget {
  const FranceSecreteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'France Secrete',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050A0E),
        useMaterial3: true,
      ),
      home: const ExplorationPage(langueInitiale: ''),
    );
  }
}