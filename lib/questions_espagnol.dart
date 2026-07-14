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
      question: "Esculpidas por el tiempo, las formaciones de los Órganos de Ille-sur-Têt evocan los paisajes de Capadocia. ¿ Cuál es su departamento ?",
      reponse: "Pirineos Orientales",
      explication: "Los Órganos de Ille-sur-Têt están situados en los Pirineos Orientales (66).",
      difficulte: "Fácil",
      options: ["Pirineos Orientales", "Ardèche", "Lozère"]
  ),
  Question(
      id: 2,
      question: "Reflejos esmeralda y cumbres escarpadas: el Lago de Allos ofrece un paisaje digno de Noruega. ¿ Cuál es su departamento ?",
      reponse: "Alpes de Alta Provenza",
      explication: "El Lago de Allos se encuentra en el departamento de Alpes de Alta Provenza (04).",
      difficulte: "Difícil",
      options: ["Alpes de Alta Provenza", "Altos Alpes", "Isère"]
  ),
  Question(
      id: 3,
      question: "Aguas turquesas y arena blanca: la Isla de la Virgen ofrece un paisaje caribeño en Bretaña. ¿ Cuál es su departamento ?",
      reponse: "Finisterre",
      explication: "La Isla de la Virgen está situada en Finisterre (29), cerca de la península de Crozon.",
      difficulte: "Fácil",
      options: ["Finisterre", "Morbihan", "Costas de Armor"]
  ),
  Question(
      id: 4,
      question: "Inspirado en los paisajes de Tivoli, el Parque des Buttes-Chaumont esconde tesoros escarpados. ¿ Cuál es su departamento ?",
      reponse: "París",
      explication: "El Parque des Buttes-Chaumont es un jardín público situado en el distrito 19 de París (75).",
      difficulte: "Fácil",
      options: ["París", "Altos del Sena", "Sena-Saint-Denis"]
  ),
  Question(
      id: 5,
      question: "Entre ruinas antiguas y encanto toscano, el Parque Monceau invita a pasear. ¿ Cuál es su departamento ?",
      reponse: "París",
      explication: "El Parque Monceau está situado en el distrito 8 de París (75).",
      difficulte: "Fácil",
      options: ["París", "Yvelines", "Valle del Marne"]
  ),
  Question(
      id: 6,
      question: "Una obra maestra romana por sus dimensiones y estructura, este monumento recuerda la majestad del Coliseo. ¿ Cuál es el departamento del Puente del Gard ?",
      reponse: "Gard",
      explication: "El Puente del Gard está situado en el departamento de Gard (30).",
      difficulte: "Fácil",
      options: ["Gard", "Vaucluse", "Hérault"]
  ),
  Question(
      id: 7,
      question: "Majestuoso y solitario, este emblemático volcán evoca la silueta del Monte Fuji. ¿ Cuál es su departamento ?",
      reponse: "Puy-de-Dôme",
      explication: "El volcán del Puy-de-Dôme se encuentra en el departamento de Puy-de-Dôme (63).",
      difficulte: "Fácil",
      options: ["Puy-de-Dôme", "Cantal", "Alto Loira"]
  ),
  Question(
      id: 8,
      question: "Encaramado sobre el Mediterráneo, el pueblo de Èze y sus callejuelas soleadas recuerdan el encanto de Santorini. ¿Cuál es su departamento ?",
      reponse: "Alpes Marítimos",
      explication: "El pueblo de Èze se sitúa en los Alpes Marítimos (06).",
      difficulte: "Difícil",
      options: ["Alpes Marítimos", "Var", "Bocas del Ródano"]
  ),
  Question(
      id: 9,
      question: "Aguas rosadas y una extensión infinita, las marismas de Aigues-Mortes recuerdan al Salar de Uyuni. ¿Cuál es su departamento ?",
      reponse: "Gard",
      explication: "Las marismas salinas de Aigues-Mortes se sitúan en el departamento de Gard (30).",
      difficulte: "Difícil",
      options: ["Gard", "Aude", "Hérault"]
  ),
  Question(
      id: 10,
      question: "Con su extensión de arena fina hasta donde alcanza la vista, la Duna de Pilat se parece al Sahara. ¿Cuál es su departamento ?",
      reponse: "Gironda",
      explication: "La Duna de Pilat está situada en Gironda (33), en la bahía de Arcachón.",
      difficulte: "Fácil",
      options: ["Gironda", "Landas", "Charente Marítimo"]
  ),
  Question(
      id: 11,
      question: "Llamativo por sus ocres y chimeneas de hadas, el Colorado provenzal se parece al Colorado National Monument. ¿ Cuál es su departamento ?",
      reponse: "Vaucluse",
      explication: "El Colorado provenzal se sitúa en Rustrel, en Vaucluse (84).",
      difficulte: "Difícil",
      options: ["Vaucluse", "Drôme", "Alpes de Alta Provenza"]
  ),
  Question(
      id: 12,
      question: "Con una arquitectura única y surrealista, el Palacio Ideal del Cartero Cheval evoca la magia de los templos de Angkor. ¿Cuál es su departamento ?",
      reponse: "Drôme",
      explication: "El Palacio Ideal del Cartero Cheval se encuentra en Hauterives, en Drôme (26).",
      difficulte: "Difícil",
      options: ["Drôme", "Isère", "Ardèche"]
  ),
  Question(
      id: 13,
      question: "Rocas, pinos y senderos escarpados: el circuito de las 25 Bosses evoca los bosques escandinavos. ¿Cuál es su departamento ?",
      reponse: "Sena y Marne",
      explication: "El circuito de las 25 Bosses se encuentra en el bosque de Fontainebleau, en Sena y Marne (77).",
      difficulte: "Trampa",
      options: ["Sena y Marne", "Essonne", "Yvelines"]
  ),
  Question(
      id: 14,
      question: "Con sus acantilados vertiginosos y su espectacular cañón, las Gargantas del Verdon evocan el Gran Cañón. ¿Cuál es su departamento ?",
      reponse: "Alpes de Alta Provenza",
      explication: "Las Gargantas del Verdon están situadas entre los departamentos de Alpes de Alta Provenza (04) y Var (83).",
      difficulte: "Trampa",
      options: ["Alpes de Alta Provenza", "Var", "Vaucluse"]
  ),
  Question(
      id: 15,
      question: "Con sus acantilados de arenisca roja esculpidos, el Altschlossfelsen evoca los paisajes de Arizona. ¿Cuál es su departamento ?",
      reponse: "Mosela",
      explication: "El sitio de Altschlossfelsen se sitúa en el bosque de Roppeviller, en Mosela (57).",
      difficulte: "Trampa",
      options: ["Mosela", "Bajo Rin", "Vosgos"]
  ),
  Question(
      id: 16,
      question: "Con su cascada salvaje en el corazón de una naturaleza virgen, la Cascada de la Beaume evoca los paisajes de Islandia. ¿Cuál es su departamento ?",
      reponse: "Alto Loira",
      explication: "La Cascada de la Beaume se encuentra en Solignac-sur-Loire, en el Alto Loira (43).",
      difficulte: "Trampa",
      options: ["Alto Loira", "Cantal", "Puy-de-Dôme"]
  ),
];