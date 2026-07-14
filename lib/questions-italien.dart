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
      question: "Scolpite dal tempo, le formazioni degli Organi di Ille-sur-Têt ricordano i paesaggi della Cappadocia. In quale dipartimento si trovano ?",
      reponse: "Pirenei Orientali",
      explication: "Gli Organi di Ille-sur-Têt si trovano nel dipartimento dei Pirenei Orientali (66).",
      difficulte: "Facile",
      options: ["Pirenei Orientali", "Ardèche", "Lozère"]
  ),
  Question(
      id: 2,
      question: "Riflessi smeraldo e vette scoscese: il Lago d'Allos offre un paesaggio degno della Norvegia. In quale dipartimento si trova ?",
      reponse: "Alpi dell'Alta Provenza",
      explication: "Il Lago d'Allos si trova nel dipartimento delle Alpi dell'Alta Provenza (04).",
      difficulte: "Difficile",
      options: ["Alpi dell'Alta Provenza", "Alte Alpi", "Isère"]
  ),
  Question(
      id: 3,
      question: "Acque turchesi e sabbia bianca: l'Isola Vergine offre uno scenario caraibico in Bretagna. In quale dipartimento si trova ?",
      reponse: "Finistère",
      explication: "L'Isola Vergine si trova nel Finistère (29), vicino alla penisola di Crozon.",
      difficulte: "Facile",
      options: ["Finistère", "Morbihan", "Côtes-d'Armor"]
  ),
  Question(
      id: 4,
      question: "Ispirato ai paesaggi di Tivoli, il Parco delle Buttes-Chaumont nasconde tesori scoscesi. In quale dipartimento si trova ?",
      reponse: "Parigi",
      explication: "Il Parco delle Buttes-Chaumont è un giardino pubblico situato nel 19° arrondissement di Parigi (75).",
      difficulte: "Facile",
      options: ["Parigi", "Alti della Senna", "Senna-Saint-Denis"]
  ),
  Question(
      id: 5,
      question: "Tra rovine antiche e fascino toscano, il Parco Monceau invita a una piacevole passeggiata. In quale dipartimento si trova ?",
      reponse: "Parigi",
      explication: "Il Parco Monceau si trova nell'8° arrondissement di Parigi (75).",
      difficulte: "Facile",
      options: ["Parigi", "Yvelines", "Valle della Marna"]
  ),
  Question(
      id: 6,
      question: "Capolavoro romano per dimensioni e struttura, questo monumento ricorda la maestosità del Colosseo. In quale dipartimento si trova il Ponte del Gard ?",
      reponse: "Gard",
      explication: "Il Ponte del Gard si trova nel dipartimento del Gard (30).",
      difficulte: "Facile",
      options: ["Gard", "Vaucluse", "Hérault"]
  ),
  Question(
      id: 7,
      question: "Maestoso e solitario, questo vulcano emblematico ricorda la silhouette del Monte Fuji. In quale dipartimento si trova ?",
      reponse: "Puy-de-Dôme",
      explication: "Il vulcano del Puy-de-Dôme si trova nel dipartimento del Puy-de-Dôme (63).",
      difficulte: "Facile",
      options: ["Puy-de-Dôme", "Cantal", "Alta Loira"]
  ),
  Question(
      id: 8,
      question: "Arroccato sopra il Mediterraneo, il villaggio di Èze e i suoi vicoli assolati ricordano il fascino di Santorini. In quale dipartimento si trova ?",
      reponse: "Alpi Marittime",
      explication: "Il villaggio di Èze si trova nelle Alpi Marittime (06).",
      difficulte: "Difficile",
      options: ["Alpi Marittime", "Var", "Bocche del Rodano"]
  ),
  Question(
      id: 9,
      question: "Acque rosa e distese infinite, le saline di Aigues-Mortes ricordano il Salar de Uyuni. In quale dipartimento si trovano ?",
      reponse: "Gard",
      explication: "Le saline di Aigues-Mortes si trovano nel dipartimento del Gard (30).",
      difficulte: "Difficile",
      options: ["Gard", "Aude", "Hérault"]
  ),
  Question(
      id: 10,
      question: "Con la sua distesa di sabbia fine a perdita d'occhio, la Duna di Pilat sembra il Sahara. In quale dipartimento si trova ?",
      reponse: "Gironda",
      explication: "La Duna di Pilat si trova in Gironda (33), sul bacino di Arcachon.",
      difficulte: "Facile",
      options: ["Gironda", "Lande", "Charente Marittima"]
  ),
  Question(
      id: 11,
      question: "Fiammeggiante di ocra e camini delle fate, il Colorado provenzale assomiglia al Colorado National Monument. In quale dipartimento si trova ?",
      reponse: "Vaucluse",
      explication: "Il Colorado provenzale si trova a Rustrel, nel Vaucluse (84).",
      difficulte: "Difficile",
      options: ["Vaucluse", "Drôme", "Alpi dell'Alta Provenza"]
  ),
  Question(
      id: 12,
      question: "Un'architettura unica e surrealista, il Palazzo Ideale del Postino Cheval evoca la magia dei templi di Angkor. In quale dipartimento si trova ?",
      reponse: "Drôme",
      explication: "Il Palazzo Ideale del Postino Cheval si trova a Hauterives, nella Drôme (26).",
      difficulte: "Difficile",
      options: ["Drôme", "Isère", "Ardèche"]
  ),
  Question(
      id: 13,
      question: "Rocce, pini e sentieri scoscesi: il Circuito delle 25 Gobbe ricorda le foreste scandinave. In quale dipartimento si trova ?",
      reponse: "Senna e Marna",
      explication: "Il Circuito delle 25 Gobbe si trova nella foresta di Fontainebleau, nella Senna e Marna (77).",
      difficulte: "Trabocchetto",
      options: ["Senna e Marna", "Essonne", "Yvelines"]
  ),
  Question(
      id: 14,
      question: "Con le loro falesie vertiginose e il canyon spettacolare, le Gole del Verdon ricordano il Grand Canyon. In quale dipartimento si trovano ?",
      reponse: "Alpi dell'Alta Provenza",
      explication: "Le Gole del Verdon si trovano tra i dipartimenti delle Alpi dell'Alta Provenza (04) e del Var (83).",
      difficulte: "Trabocchetto",
      options: ["Alpi dell'Alta Provenza", "Var", "Vaucluse"]
  ),
  Question(
      id: 15,
      question: "Con le sue falesie scolpite in arenaria rossa, l'Altschlossfelsen ricorda i paesaggi dell'Arizona. In quale dipartimento si trova ?",
      reponse: "Mosella",
      explication: "Il sito dell'Altschlossfelsen si trova nella foresta di Roppeviller, nella Mosella (57).",
      difficulte: "Trabocchetto",
      options: ["Mosella", "Basso Reno", "Vosgi"]
  ),
  Question(
      id: 16,
      question: "Con la sua cascata selvaggia nel cuore di una natura incontaminata, la Cascata della Beaume ricorda i paesaggi dell'Islanda. In quale dipartimento si trova ?",
      reponse: "Alta Loira",
      explication: "La Cascata della Beaume si trova a Solignac-sur-Loire, nell'Alta Loira (43).",
      difficulte: "Trabocchetto",
      options: ["Alta Loira", "Cantal", "Puy-de-Dôme"]
  ),
];