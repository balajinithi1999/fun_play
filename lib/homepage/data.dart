class QueAndAns {
  final String question;
  final List<String> answer;
  QueAndAns({
    required this.question,
    required this.answer,
  });
}

class DataModel {
  final String imagePath;
  final List<QueAndAns> queAndAnsList;
  DataModel({
    required this.imagePath,
    required this.queAndAnsList,
  });
}

List<DataModel> sampleData = [
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 1s are there?",
        answer: [
          "2",
          "two",
        ],
      ),
    ],
  ),
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 2s are there?",
        answer: [
          "5",
          "five",
        ],
      ),
    ],
  ),
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 3s are there?",
        answer: ["5", "five"],
      ),
    ],
  ),
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 4s are there?",
        answer: [
          "6",
          "six",
        ],
      ),
    ],
  ),
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 5s are there?",
        answer: [
          "6",
          "six",
        ],
      ),
    ],
  ),
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 6s are there?",
        answer: [
          "8",
          "eight",
        ],
      ),
    ],
  ),
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 7s are there?",
        answer: [
          "3",
          "three",
        ],
      ),
    ],
  ),
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 8s are there?",
        answer: [
          "6",
          "six",
        ],
      ),
    ],
  ),
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 9s are there?",
        answer: [
          "3",
          "three",
        ],
      ),
    ],
  ),
  DataModel(
    imagePath: "assets/123.jpeg",
    queAndAnsList: [
      QueAndAns(
        question: "How many 0s are there?",
        answer: [
          "3",
          "three",
        ],
      ),
    ],
  ),
];

class DataRepository {
  static getData() {
    final data = sampleData;
    data.shuffle();
    return data;
  }
}

List<String> rules = [
  "1.There are 10 levels in this game.",
  "2.Each level consists of one image.",
  "3.Player is given maximum 30 seconds to watch the contents of image.",
  "4.After 30 seconds,image will be hidden.",
  "5.Based on content of the image, the question will be framed.",
  "6.Question related to the image will be shown.",
  "7.The player has to submit the answer to move to the next level.",
  "8.Each correct answer carries one point,those who secures more than eight points has good IQ."
];
