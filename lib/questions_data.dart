class Question {
  final int id;
  final String question;
  final String reponse;
  final String explication;
  final String difficulte; // Ajouté
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.reponse,
    required this.explication,
    required this.difficulte, // Ajouté
    required this.options
  });
}

final List<Question> questions = [
  Question(id: 1, question: "Sculptées par le temps, les formations des Orgues d'Ille-sur-Têt évoquent les paysages de Cappadoce. Quel est leur département ?", reponse: "Pyrénées-Orientales", explication: "Les Orgues d'Ille-sur-Têt sont situées dans les Pyrénées-Orientales (66).", difficulte: "Facile", options: ["Pyrénées-Orientales", "Ardèche", "Lozère"]),
  Question(id: 2, question: "Reflets émeraude et sommets escarpés : le Lac d'Allos offre un paysage digne de la Norvège. Quel est son département ?", reponse: "Alpes-de-Haute-Provence", explication: "Le Lac d'Allos se trouve dans le département des Alpes-de-Haute-Provence (04).", difficulte: "Difficile", options: ["Alpes-de-Haute-Provence", "Hautes-Alpes", "Isère"]),
  Question(id: 3, question: "Eaux turquoise et sable blanc : l'Île Vierge offre un décor de Caraïbes en Bretagne. Quel est son département ?", reponse: "Finistère", explication: "L'Île Vierge est située dans le Finistère (29), près de la pointe de Crozon.", difficulte: "Facile", options: ["Finistère", "Morbihan", "Côtes-d'Armor"]),
  Question(id: 4, question: "Inspiré par les paysages de Tivoli, le Parc des Buttes-Chaumont cache des trésors escarpés. Quel est son département ?", reponse: "Paris", explication: "Le parc des Buttes-Chaumont est un jardin public situé dans le 19e arrondissement de Paris (75).", difficulte: "Facile", options: ["Paris", "Hauts-de-Seine", "Seine-Saint-Denis"]),
  Question(id: 5, question: "Entre ruines antiques et charmes toscans, le Parc Monceau invite à la flânerie. Quel est son département ?", reponse: "Paris", explication: "Le parc Monceau est situé dans le 8e arrondissement de Paris (75).", difficulte: "Facile", options: ["Paris", "Yvelines", "Val-de-Marne"]),
  Question(id: 6, question: "Chef-d'œuvre romain par ses dimensions et sa structure, ce monument rappelle la majesté du Colisée. Quel est son département ?", reponse: "Gard", explication: "Le Pont du Gard est situé dans le département du Gard (30).", difficulte: "Facile", options: ["Gard", "Vaucluse", "Hérault"]),
  Question(id: 7, question: "Majestueux et solitaire, ce volcan emblématique évoque la silhouette du Mont Fuji. Quel est son département ?", reponse: "Puy-de-Dôme", explication: "Le volcan du Puy de Dôme se trouve dans le département du Puy-de-Dôme (63).", difficulte: "Facile", options: ["Puy-de-Dôme", "Cantal", "Haute-Loire"]),
  Question(id: 8, question: "Perché au-dessus de la Méditerranée, le village d’Èze et ses ruelles ensoleillées rappellent le charme de Santorin. Quel est son département ?", reponse: "Alpes-Maritimes", explication: "Le village d'Èze se situe dans les Alpes-Maritimes (06).", difficulte: "Difficile", options: ["Alpes-Maritimes", "Var", "Bouches-du-Rhône"]),
  Question(id: 9, question: "Eaux roses et étendue infinie, les marais salants d’Aigues-Mortes rappellent le Salar de Uyuni. Quel est leur département ?", reponse: "Gard", explication: "Les marais salants d'Aigues-Mortes se situent dans le département du Gard (30).", difficulte: "Difficile", options: ["Gard", "Aude", "Hérault"]),
  Question(id: 10, question: "Avec son étendue de sable fin à perte de vue, la dune du Pilat ressemble au Sahara. Quel est son département ?", reponse: "Gironde", explication: "La dune du Pilat est située en Gironde (33), sur le bassin d'Arcachon.", difficulte: "Facile", options: ["Gironde", "Landes", "Charente-Maritime"]),
  Question(id: 11, question: "Flamboyant d'ocres et de cheminées de fée, le Colorado provençal ressemble au Colorado National Monument. Quel est son département ?", reponse: "Vaucluse", explication: "Le Colorado provençal se situe à Rustrel, dans le Vaucluse (84).", difficulte: "Difficile", options: ["Vaucluse", "Drôme", "Alpes-de-Haute-Provence"]),
  Question(id: 12, question: "Architecture unique et surréaliste, le Palais idéal du Facteur Cheval évoque la magie des temples d'Angkor. Quel est son département ?", reponse: "Drôme", explication: "Le Palais idéal du Facteur Cheval se trouve à Hauterives, dans la Drôme (26).", difficulte: "Difficile", options: ["Drôme", "Isère", "Ardèche"]),
  Question(id: 13, question: "Rochers, pins et sentiers escarpés : le circuit des 25 Bosses évoque les forêts scandinaves. Quel est son département ?", reponse: "Seine-et-Marne", explication: "Le circuit des 25 Bosses se trouve dans la forêt de Fontainebleau, en Seine-et-Marne (77).", difficulte: "Piege", options: ["Seine-et-Marne", "Essonne", "Yvelines"]),
  Question(id: 14, question: "Avec leurs falaises vertigineuses et leur canyon spectaculaire, les Gorges du Verdon évoquent le Grand Canyon. Quel est leur département ?", reponse: "Alpes-de-Haute-Provence", explication: "Les Gorges du Verdon sont situées entre les départements des Alpes-de-Haute-Provence (04) et du Var (83).", difficulte: "Piege", options: ["Alpes-de-Haute-Provence", "Var", "Vaucluse"]),
  Question(id: 15, question: "Avec ses falaises de grès rouge sculptées, l'Altschlossfelsen évoque les paysages de l'Arizona. Quel est son département ?", reponse: "Moselle", explication: "Le site de l'Altschlossfelsen se situe dans la forêt de Roppeviller, en Moselle (57).", difficulte: "Piege", options: ["Moselle", "Bas-Rhin", "Vosges"]),
  Question(id: 16, question: "Avec sa chute d'eau sauvage au cœur d'une nature brute, la Cascade de la Beaume évoque les paysages d'Islande. Quel est son département ?", reponse: "Haute-Loire", explication: "La Cascade de la Beaume se trouve à Solignac-sur-Loire, en Haute-Loire (43).", difficulte: "Piege", options: ["Haute-Loire", "Cantal", "Puy-de-Dôme"]),
];