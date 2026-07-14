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
      question: "Sculpted by time, the formations of the Orgues d'Ille-sur-Têt evoke the landscapes of Cappadocia. Which department are they in ?",
      reponse: "Eastern Pyrenees",
      explication: "The Orgues d'Ille-sur-Têt are located in the Eastern Pyrenees (66).",
      difficulte: "Easy",
      options: ["Eastern Pyrenees", "Ardeche", "Lozere"]),
  Question(
      id: 2,
      question: "Emerald reflections and steep peaks: Lake Allos offers a landscape worthy of Norway. Which department is it in ?",
      reponse: "Alpes-de-Haute-Provence",
      explication: "Lake Allos is located in the Alpes-de-Haute-Provence department (04).",
      difficulte: "Hard",
      options: ["Alpes-de-Haute-Provence", "High Alps", "Isere"]),
  Question(
      id: 3,
      question: "Turquoise waters and white sand: Virgin Island offers a Caribbean-like setting in Brittany. Which department is it in ?",
      reponse: "Finistere",
      explication: "Virgin Island is located in the Finistere (29), near the Crozon peninsula.",
      difficulte: "Easy",
      options: ["Finistere", "Morbihan", "Cotes-d'Armor"]),
  Question(
      id: 4,
      question: "Inspired by the landscapes of Tivoli, the Buttes-Chaumont Park hides steep treasures. Which department is it in ?",
      reponse: "Paris",
      explication: "The Buttes-Chaumont Park is a public park located in the 19th arrondissement of Paris (75).",
      difficulte: "Easy",
      options: ["Paris", "Hauts-de-Seine", "Seine-Saint-Denis"]),
  Question(
      id: 5,
      question: "Between ancient ruins and Tuscan charms, Monceau Park invites you to stroll. Which department is it in ?",
      reponse: "Paris",
      explication: "Monceau Park is located in the 8th arrondissement of Paris (75).",
      difficulte: "Easy",
      options: ["Paris", "Yvelines", "Val-de-Marne"]),
  Question(
      id: 6,
      question: "A Roman masterpiece in its dimensions and structure, this monument recalls the majesty of the Colosseum. Which department is it in ?",
      reponse: "Gard",
      explication: "The Pont du Gard is located in the Gard department (30).",
      difficulte: "Easy",
      options: ["Gard", "Vaucluse", "Herault"]),
  Question(
      id: 7,
      question: "Majestic and solitary, this iconic volcano evokes the silhouette of Mount Fuji. Which department is it in ?",
      reponse: "Puy-de-Dome",
      explication: "The Puy de Dome volcano is in the Puy-de-Dome department (63).",
      difficulte: "Easy",
      options: ["Puy-de-Dome", "Cantal", "Upper Loire"]),
  Question(
      id: 8,
      question: "Perched above the Mediterranean, the village of Èze and its sunny alleys recall the charm of Santorini. Which department is it in ?",
      reponse: "Maritime Alps",
      explication: "The village of Èze is in the Maritime Alps (06).",
      difficulte: "Hard",
      options: ["Maritime Alps", "Var", "Bouches-du-Rhone"]),
  Question(
      id: 9,
      question: "Pink waters and infinite expanses, the salt marshes of Aigues-Mortes recall the Salar de Uyuni. Which department are they in ?",
      reponse: "Gard",
      explication: "The salt marshes of Aigues-Mortes are located in the Gard department (30).",
      difficulte: "Hard",
      options: ["Gard", "Aude", "Herault"]),
  Question(
      id: 10,
      question: "With its stretch of fine sand as far as the eye can see, the Dune of Pilat resembles the Sahara. Which department is it in ?",
      reponse: "Gironde",
      explication: "The Dune of Pilat is located in the Gironde (33), on the Arcachon basin.",
      difficulte: "Easy",
      options: ["Gironde", "Landes", "Charente-Maritime"]),
  Question(
      id: 11,
      question: "Flamboyant with ochre and fairy chimneys, the Provençal Colorado resembles the Colorado National Monument. Which department is it in ?",
      reponse: "Vaucluse",
      explication: "The Provençal Colorado is located in Rustrel, in the Vaucluse (84).",
      difficulte: "Hard",
      options: ["Vaucluse", "Drome", "Alpes-de-Haute-Provence"]),
  Question(
      id: 12,
      question: "Unique and surreal architecture, the Ideal Palace of Postman Cheval evokes the magic of the temples of Angkor. Which department is it in ?",
      reponse: "Drome",
      explication: "The Ideal Palace of Postman Cheval is in Hauterives, in the Drome (26).",
      difficulte: "Hard",
      options: ["Drome", "Isere", "Ardeche"]),
  Question(
      id: 13,
      question: "Rocks, pines, and steep trails: the 25 Bosses circuit evokes Scandinavian forests. Which department is it in ?",
      reponse: "Seine-et-Marne",
      explication: "The 25 Bosses circuit is located in the Fontainebleau forest, in Seine-et-Marne (77).",
      difficulte: "Trick",
      options: ["Seine-et-Marne", "Essonne", "Yvelines"]),
  Question(
      id: 14,
      question: "With their vertiginous cliffs and spectacular canyon, the Verdon Gorge evoke the Grand Canyon. Which department are they in ?",
      reponse: "Alpes-de-Haute-Provence",
      explication: "The Verdon Gorge are located between the Alpes-de-Haute-Provence (04) and Var (83) departments.",
      difficulte: "Trick",
      options: ["Alpes-de-Haute-Provence", "Var", "Vaucluse"]),
  Question(
      id: 15,
      question: "With its sculpted red sandstone cliffs, the Altschlossfelsen evokes the landscapes of Arizona. Which department is it in ?",
      reponse: "Moselle",
      explication: "The Altschlossfelsen site is located in the Roppeviller forest, in Moselle (57).",
      difficulte: "Trick",
      options: ["Moselle", "Lower Rhine", "Vosges"]),
  Question(
      id: 16,
      question: "With its wild waterfall in the heart of raw nature, the Beaume Waterfall evokes the landscapes of Iceland. Which department is it in ?",
      reponse: "Upper Loire",
      explication: "The Beaume Waterfall is located in Solignac-sur-Loire, in Upper Loire (43).",
      difficulte: "Trick",
      options: ["Upper Loire", "Cantal", "Puy-de-Dome"]),
];