import 'package:in_app_review/in_app_review.dart';

class ReviewHelper {
  static final InAppReview _inAppReview = InAppReview.instance;

  static Future<void> triggerReview() async {
    // Vérifie si le système permet l'affichage de la fenêtre d'avis
    if (await _inAppReview.isAvailable()) {
      _inAppReview.requestReview();
    }
  }
}