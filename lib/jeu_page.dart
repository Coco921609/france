import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Importation des fichiers de questions
import 'questions_data.dart' as fr;
import 'questions anglais.dart' as en;
import 'questions arabe.dart' as ar;

class JeuPage extends StatefulWidget {
  final bool isEnglish;
  final bool isArabic;
  final bool isSpanish;

  const JeuPage({
    super.key,
    this.isEnglish = false,
    this.isArabic = false,
    this.isSpanish = false,
  });

  @override
  State<JeuPage> createState() => _JeuPageState();
}

class _JeuPageState extends State<JeuPage> {
  late List<dynamic> questions;
  final Map<int, String> _reponsesUtilisateur = {};
  bool _estValide = false;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    // Sélection de la bonne liste de questions selon les paramètres reçus
    if (widget.isArabic) {
      questions = ar.questions;
    } else if (widget.isEnglish) {
      questions = en.questions;
    } else {
      // Par défaut (Français, Espagnol si non traduit séparément)
      questions = fr.questions;
    }
  }

  Color _getCouleurDifficulte(String diff) {
    switch (diff.toLowerCase()) {
      case "easy": case "facile": case "fácil": case "einfach": case "سهل":
      return Colors.greenAccent;
      case "hard": case "difficile": case "difícil": case "schwer": case "صعب":
      return Colors.orangeAccent;
      case "trick": case "piege": case "trampa": case "trappola": case "truque": case "خدعة":
      return Colors.purpleAccent;
      default:
        return Colors.blueAccent;
    }
  }

  void _validerQuiz() {
    int s = 0;
    for (var q in questions) {
      if (_reponsesUtilisateur[q.id] == q.reponse) s++;
    }
    setState(() {
      _score = s;
      _estValide = true;
    });
  }

  void _rejouer() {
    setState(() {
      _estValide = false;
      _reponsesUtilisateur.clear();
      _score = 0;
    });
  }

  Widget _buildBackgroundGlow(Color color) {
    return Container(
      width: 300, height: 300,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(),
      ),
    );
  }

  Widget _buildGlassCard(dynamic q) {
    bool aRepondu = _reponsesUtilisateur.containsKey(q.id);
    Color couleurCard = _getCouleurDifficulte(q.difficulte);

    String textExplication = widget.isArabic ? 'الشرح'
        : (widget.isSpanish ? 'Explicación'
        : (widget.isEnglish ? 'Explanation' : 'Explication'));

    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: aRepondu ? couleurCard : Colors.white.withOpacity(0.2), width: 2),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: couleurCard.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
                    child: Text(
                        q.difficulte.toUpperCase(),
                        style: widget.isArabic
                            ? GoogleFonts.cairo(color: couleurCard, fontSize: 10, fontWeight: FontWeight.bold)
                            : GoogleFonts.montserrat(color: couleurCard, fontSize: 10, fontWeight: FontWeight.bold)
                    )
                ),
              ]
          ),
          const SizedBox(height: 10),
          Text(
              q.question,
              style: widget.isArabic
                  ? GoogleFonts.cairo(color: Colors.white, fontSize: 16)
                  : GoogleFonts.montserrat(color: Colors.white, fontSize: 16)
          ),
          const SizedBox(height: 15),
          ...q.options.map((option) => RadioListTile<String>(
            title: Text(
                option,
                style: widget.isArabic
                    ? GoogleFonts.cairo(color: Colors.white70)
                    : GoogleFonts.montserrat(color: Colors.white70)
            ),
            value: option,
            groupValue: _reponsesUtilisateur[q.id],
            activeColor: couleurCard,
            onChanged: (aRepondu || _estValide) ? null : (val) => setState(() => _reponsesUtilisateur[q.id] = val!),
          )),
          if (_estValide && _reponsesUtilisateur[q.id] != q.reponse)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                  "$textExplication : ${q.explication}",
                  style: widget.isArabic
                      ? GoogleFonts.cairo(color: Colors.redAccent, fontStyle: FontStyle.italic)
                      : GoogleFonts.montserrat(color: Colors.redAccent, fontStyle: FontStyle.italic)
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String appTitle = widget.isArabic ? "فرنسا السرية - مسابقة"
        : (widget.isSpanish ? "Francia Secreta - Quiz"
        : (widget.isEnglish ? "Secret France - Quiz" : "France Secrète - Quiz"));

    String btnValidate = widget.isArabic ? "تحقق"
        : (widget.isSpanish ? "COMPROBAR"
        : (widget.isEnglish ? "VALIDATE" : "VALIDER"));

    String btnReplay = widget.isArabic ? "إعادة"
        : (widget.isSpanish ? "VOLVER A JUGAR"
        : (widget.isEnglish ? "REPLAY" : "REJOUER"));

    String labelScore = widget.isArabic ? "النتيجة"
        : (widget.isSpanish ? "Puntuación" : "Score");

    return Directionality(
      textDirection: widget.isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0C0E),
        body: Stack(
          children: [
            PositionedDirectional(top: -50, start: -50, child: _buildBackgroundGlow(Colors.blue.withOpacity(0.15))),
            PositionedDirectional(bottom: 100, end: -50, child: _buildBackgroundGlow(Colors.purple.withOpacity(0.1))),

            ListView(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 50),
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                            appTitle,
                            style: widget.isArabic
                                ? GoogleFonts.cairo(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
                                : GoogleFonts.cinzel(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 30),
                ...questions.map((q) => _buildGlassCard(q)),
                const SizedBox(height: 20),
                !_estValide
                    ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  onPressed: _reponsesUtilisateur.length == questions.length ? _validerQuiz : null,
                  child: Text(
                      btnValidate,
                      style: widget.isArabic
                          ? GoogleFonts.cairo(fontWeight: FontWeight.bold)
                          : GoogleFonts.montserrat(fontWeight: FontWeight.bold)
                  ),
                )
                    : Column(
                  children: [
                    Text(
                        "$labelScore : $_score/${questions.length}",
                        style: widget.isArabic
                            ? GoogleFonts.cairo(color: Colors.white, fontSize: 30)
                            : GoogleFonts.montserrat(color: Colors.white, fontSize: 30)
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                        onPressed: _rejouer,
                        child: Text(
                            btnReplay,
                            style: widget.isArabic
                                ? GoogleFonts.cairo(fontWeight: FontWeight.bold)
                                : GoogleFonts.montserrat(fontWeight: FontWeight.bold)
                        )
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}