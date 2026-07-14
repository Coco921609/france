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
      question: "Esculpidas pelo tempo, as formações do Trilho dos Ocres evocam as paisagens da Capadócia. Qual é o seu departamento ?",
      reponse: "Vaucluse",
      explication: "O Trilho dos Ocres (Sentier des Ocres) está localizado no departamento de Vaucluse (84).",
      difficulte: "Fácil",
      options: ["Vaucluse", "Ardèche", "Lozère"]
  ),
  Question(
      id: 2,
      question: "Reflexos de esmeralda e picos escarpados: o Lago de Allos oferece uma paisagem digna da Noruega. Qual é o seu departamento ?",
      reponse: "Alpes da Alta Provença",
      explication: "O Lago de Allos fica no departamento dos Alpes da Alta Provença (04).",
      difficulte: "Difícil",
      options: ["Alpes da Alta Provença", "Altos Alpes", "Isère"]
  ),
  Question(
      id: 3,
      question: "Águas turquesa e areia branca: a Ilha da Virgem oferece um cenário caribenho na Bretanha. Qual é o seu departamento ?",
      reponse: "Finistère",
      explication: "A Ilha da Virgem (Île Vierge) está localizada em Finistère (29), perto da península de Crozon.",
      difficulte: "Fácil",
      options: ["Finistère", "Morbihan", "Côtes-d'Armor"]
  ),
  Question(
      id: 4,
      question: "Inspirado nas paisagens de Tivoli, o Parque de Buttes-Chaumont esconde tesouros escarpados. Qual é o seu departamento ?",
      reponse: "Paris",
      explication: "O Parque de Buttes-Chaumont é um jardim público localizado no 19º arrondissement de Paris (75).",
      difficulte: "Fácil",
      options: ["Paris", "Altos do Sena", "Sena-Saint-Denis"]
  ),
  Question(
      id: 5,
      question: "Entre ruínas antigas e encantos toscanos, o Parque Monceau convida a um passeio relaxante. Qual é o seu departamento ?",
      reponse: "Paris",
      explication: "O Parque Monceau está localizado no 8º arrondissement de Paris (75).",
      difficulte: "Fácil",
      options: ["Paris", "Yvelines", "Val-de-Marne"]
  ),
  Question(
      id: 6,
      question: "Uma obra-prima romana pelas suas dimensões e estrutura, a Ponte do Gard lembra a majestade do Coliseu. Qual é o seu departamento ?",
      reponse: "Gard",
      explication: "A Ponte do Gard está localizada no departamento de Gard (30).",
      difficulte: "Fácil",
      options: ["Gard", "Vaucluse", "Hérault"]
  ),
  Question(
      id: 7,
      question: "Majestoso e solitário, o vulcão Puy de Dôme evoca a silhueta do Monte Fuji. Qual é o seu departamento ?",
      reponse: "Puy-de-Dôme",
      explication: "O vulcão do Puy de Dôme fica no departamento de Puy-de-Dôme (63).",
      difficulte: "Fácil",
      options: ["Puy-de-Dôme", "Cantal", "Alto Loire"]
  ),
  Question(
      id: 8,
      question: "Situada acima do Mediterrâneo, a vila de Èze e as suas ruelas ensolaradas lembram o charme de Santorini. Qual é o seu departamento ?",
      reponse: "Alpes Marítimos",
      explication: "A vila de Èze fica nos Alpes Marítimos (06).",
      difficulte: "Difícil",
      options: ["Alpes Marítimos", "Var", "Bocas do Ródano"]
  ),
  Question(
      id: 9,
      question: "Águas rosas e uma extensão infinita, as Salinas de Aigues-Mortes lembram o Salar de Uyuni. Qual é o seu departamento ?",
      reponse: "Gard",
      explication: "As salinas de Aigues-Mortes ficam no departamento de Gard (30).",
      difficulte: "Difícil",
      options: ["Gard", "Aude", "Hérault"]
  ),
  Question(
      id: 10,
      question: "Com a sua extensão de areia fina a perder de vista, a Duna de Pilat assemelha-se ao Saara. Qual é o seu departamento ?",
      reponse: "Gironda",
      explication: "A Duna de Pilat está localizada na Gironda (33), na bacia de Arcachon.",
      difficulte: "Fácil",
      options: ["Gironda", "Landes", "Charente-Maritime"]
  ),
  Question(
      id: 11,
      question: "Exuberante em ocres e chaminés de fada, o Colorado Provençal assemelha-se ao Colorado National Monument. Qual é o seu departamento ?",
      reponse: "Vaucluse",
      explication: "O Colorado Provençal fica em Rustrel, no departamento de Vaucluse (84).",
      difficulte: "Difícil",
      options: ["Vaucluse", "Drôme", "Alpes da Alta Provença"]
  ),
  Question(
      id: 12,
      question: "Com uma arquitetura única e surrealista, o Palácio Ideal do Facteur Cheval evoca a magia dos templos de Angkor. Qual é o seu departamento ?",
      reponse: "Drôme",
      explication: "O Palácio Ideal do Facteur Cheval fica em Hauterives, em Drôme (26).",
      difficulte: "Difícil",
      options: ["Drôme", "Isère", "Ardèche"]
  ),
  Question(
      id: 13,
      question: "Rochas, pinheiros e trilhos escarpados: o Circuito das 25 Bosses evoca as florestas escandinavas. Qual é o seu departamento ?",
      reponse: "Sena e Marne",
      explication: "O Circuito das 25 Bosses fica na floresta de Fontainebleau, em Sena e Marne (77).",
      difficulte: "Pegadinha",
      options: ["Sena e Marne", "Essonne", "Yvelines"]
  ),
  Question(
      id: 14,
      question: "Com as suas falésias vertiginosas e o seu desfiladeiro espetacular, as Gargantas do Verdon evocam o Grand Canyon. Qual é o seu departamento ?",
      reponse: "Alpes da Alta Provença",
      explication: "As Gargantas do Verdon estão localizadas entre os departamentos dos Alpes da Alta Provença (04) e de Var (83).",
      difficulte: "Pegadinha",
      options: ["Alpes da Alta Provença", "Var", "Vaucluse"]
  ),
  Question(
      id: 15,
      question: "Com as suas falésias de arenito vermelho esculpidas, o Altschlossfelsen evoca as paisagens do Arizona. Qual é o seu departamento ?",
      reponse: "Mosela",
      explication: "O local do Altschlossfelsen fica na floresta de Roppeviller, em Mosela (57).",
      difficulte: "Pegadinha",
      options: ["Mosela", "Baixo Reno", "Vosges"]
  ),
  Question(
      id: 16,
      question: "Com a sua queda d'água selvagem no coração de uma natureza bruta, a Cascata de Beaume evoca as paisagens da Islândia. Qual é o seu departamento ?",
      reponse: "Alto Loire",
      explication: "A Cascata de Beaume fica em Solignac-sur-Loire, no Alto Loire (43).",
      difficulte: "Pegadinha",
      options: ["Alto Loire", "Cantal", "Puy-de-Dôme"]
  ),
];