import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'exploration_page.dart';

// Gestionnaire pour les notifications en arrière-plan
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  // 1. Initialisation des services Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialisation de Firebase
  await Firebase.initializeApp();

  // Gestion des messages en arrière-plan
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // 3. Configuration des permissions pour les notifications (iOS/Android)
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  // Gestion de la réception quand l'app est ouverte
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // La notification est reçue alors que l'utilisateur utilise l'app
    debugPrint("Notification reçue: ${message.notification?.title}");
  });

  // 4. Blocage de l'orientation en mode Portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const FranceSecreteApp());
  });
}

class FranceSecreteApp extends StatelessWidget {
  const FranceSecreteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'France Secrete',
      debugShowCheckedModeBanner: false,

      // Configuration du thème (Sombre et Turquoise)
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050A0E),
        primaryColor: const Color(0xFF40E0D0),
        useMaterial3: true,
      ),

      // Page de démarrage sans paramètre,
      // car la gestion de la langue se fait désormais dans ExplorationPage
      home: const ExplorationPage(langueInitiale: '',),
    );
  }
}