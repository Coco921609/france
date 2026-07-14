class Question {
  final int id;
  final String question;
  final String reponse;
  final String explication;
  final String difficulte;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.reponse,
    required this.explication,
    required this.difficulte,
    required this.options
  });
}

final List<Question> questions = [
  Question(
      id: 1,
      question: "Durch die Zeit geformt, erinnern die Felsformationen des Ockerpfads an die Landschaften von Kappadokien. In welchem Département liegen sie ?",
      reponse: "Vaucluse",
      explication: "Der Ockerpfad (Sentier des Ocres) befindet sich im Département Vaucluse (84).",
      difficulte: "Leicht",
      options: ["Vaucluse", "Ardèche", "Lozère"]
  ),
  Question(
      id: 2,
      question: "Smaragdgrüne Reflexe und schroffe Gipfel: Der Allos-See bietet eine Landschaft wie in Norwegen. In welchem Département liegt er ?",
      reponse: "Alpes-de-Haute-Provence",
      explication: "Der Allos-See befindet sich im Département Alpes-de-Haute-Provence (04).",
      difficulte: "Schwer",
      options: ["Alpes-de-Haute-Provence", "Obere Alpen", "Isère"]
  ),
  Question(
      id: 3,
      question: "Türkisfarbenes Wasser und weißer Sand: Die Jungferninsel bietet eine karibische Kulisse in der Bretagne. In welchem Département liegt sie ?",
      reponse: "Finistère",
      explication: "Die Jungferninsel befindet sich im Finistère (29), nahe der Halbinsel Crozon.",
      difficulte: "Leicht",
      options: ["Finistère", "Morbihan", "Côtes-d'Armor"]
  ),
  Question(
      id: 4,
      question: "Inspiriert von den Landschaften von Tivoli, verbirgt der Parc des Buttes-Chaumont schroffe Schätze. In welchem Département liegt er ?",
      reponse: "Paris",
      explication: "Der Parc des Buttes-Chaumont ist ein öffentlicher Park im 19. Arrondissement von Paris (75).",
      difficulte: "Leicht",
      options: ["Paris", "Hauts-de-Seine", "Seine-Saint-Denis"]
  ),
  Question(
      id: 5,
      question: "Zwischen antiken Ruinen und toskanischem Charme lädt der Parc Monceau zum Flanieren ein. In welchem Département liegt er ?",
      reponse: "Paris",
      explication: "Der Parc Monceau befindet sich im 8. Arrondissement von Paris (75).",
      difficulte: "Leicht",
      options: ["Paris", "Yvelines", "Val-de-Marne"]
  ),
  Question(
      id: 6,
      question: "Dieses Monument ist aufgrund seiner Ausmaße und Struktur ein römisches Meisterwerk, das an die Erhabenheit des Kolosseums erinnert. In welchem Département liegt es ?",
      reponse: "Gard",
      explication: "Die Pont du Gard befindet sich im Département Gard (30).",
      difficulte: "Leicht",
      options: ["Gard", "Vaucluse", "Hérault"]
  ),
  Question(
      id: 7,
      question: "Majestätisch und einsam erinnert dieser ikonische Vulkan an die Silhouette des Berges Fuji. In welchem Département liegt er ?",
      reponse: "Puy-de-Dôme",
      explication: "Der Vulkan Puy de Dôme befindet sich im Département Puy-de-Dôme (63).",
      difficulte: "Leicht",
      options: ["Puy-de-Dôme", "Cantal", "Oberloire"]
  ),
  Question(
      id: 8,
      question: "Hoch über dem Mittelmeer gelegen, erinnern das Dorf Èze und seine sonnigen Gassen an den Charme von Santorin. In welchem Département liegt es ?",
      reponse: "Alpes-Maritimes",
      explication: "Das Dorf Èze befindet sich im Département Alpes-Maritimes (06).",
      difficulte: "Schwer",
      options: ["Alpes-Maritimes", "Var", "Bouches-du-Rhône"]
  ),
  Question(
      id: 9,
      question: "Rosafarbenes Wasser und endlose Weiten: Die Salzgärten von Aigues-Mortes erinnern an den Salar de Uyuni. In welchem Département liegen sie ?",
      reponse: "Gard",
      explication: "Die Salzgärten von Aigues-Mortes befinden sich im Département Gard (30).",
      difficulte: "Schwer",
      options: ["Gard", "Aude", "Hérault"]
  ),
  Question(
      id: 10,
      question: "Mit ihrer feinen Sandfläche bis zum Horizont gleicht die Düne von Pilat der Sahara. In welchem Département liegt sie ?",
      reponse: "Gironde",
      explication: "Die Düne von Pilat befindet sich in der Gironde (33) am Becken von Arcachon.",
      difficulte: "Leicht",
      options: ["Gironde", "Landes", "Charente-Maritime"]
  ),
  Question(
      id: 11,
      question: "Das flammende Ocker und die Feenkamine des Provenzalischen Colorados ähneln dem Colorado National Monument. In welchem Département liegt es ?",
      reponse: "Vaucluse",
      explication: "Der Provenzalische Colorado befindet sich in Rustrel im Département Vaucluse (84).",
      difficulte: "Schwer",
      options: ["Vaucluse", "Drôme", "Alpes-de-Haute-Provence"]
  ),
  Question(
      id: 12,
      question: "Einzigartige Architektur: Der Ideale Palast des Postboten Cheval erinnert an die Magie der Tempel von Angkor. In welchem Département liegt er ?",
      reponse: "Drôme",
      explication: "Der Ideale Palast des Postboten Cheval befindet sich in Hauterives im Département Drôme (26).",
      difficulte: "Schwer",
      options: ["Drôme", "Isère", "Ardèche"]
  ),
  Question(
      id: 13,
      question: "Felsen, Kiefern und schroffe Pfade: Der Rundweg „Circuit des 25 Bosses“ erinnert an skandinavische Wälder. In welchem Département liegt er ?",
      reponse: "Seine-et-Marne",
      explication: "Der Circuit des 25 Bosses befindet sich im Wald von Fontainebleau im Département Seine-et-Marne (77).",
      difficulte: "Fangfrage",
      options: ["Seine-et-Marne", "Essonne", "Yvelines"]
  ),
  Question(
      id: 14,
      question: "Mit ihren Klippen und der spektakulären Schlucht erinnern die Verdonschluchten an den Grand Canyon. In welchem Département liegen sie ?",
      reponse: "Alpes-de-Haute-Provence",
      explication: "Die Verdonschluchten liegen zwischen den Départements Alpes-de-Haute-Provence (04) und Var (83).",
      difficulte: "Fangfrage",
      options: ["Alpes-de-Haute-Provence", "Var", "Vaucluse"]
  ),
  Question(
      id: 15,
      question: "Mit seinen roten Sandsteinfelsen erinnert der Altschlossfelsen an die Landschaften von Arizona. In welchem Département liegt er ?",
      reponse: "Moselle",
      explication: "Der Altschlossfelsen befindet sich im Wald von Roppeviller im Département Moselle (57).",
      difficulte: "Fangfrage",
      options: ["Moselle", "Bas-Rhin", "Vogesen"]
  ),
  Question(
      id: 16,
      question: "Mit seinem wilden Wasserfall inmitten unberührter Natur erinnert der Beaume-Wasserfall an die Landschaften Islands. In welchem Département liegt er ?",
      reponse: "Haute-Loire",
      explication: "Der Beaume-Wasserfall befindet sich in Solignac-sur-Loire im Département Haute-Loire (43).",
      difficulte: "Fangfrage",
      options: ["Haute-Loire", "Cantal", "Puy-de-Dôme"]
  ),
];