import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  var points = 0;
  var questionId = 0;
  bool endOfQuiz = false;
  var questions = [
    {
      'question': '2+2=?',
      'answer1': '1',
      'answer2': '3',
      'answer3': '4',
      'correct': 'answer3',
    },
    {
      'question': '5+5=?',
      'answer1': '10',
      'answer2': '2',
      'answer3': '10.5',
      'correct': 'answer1',
    },
    {
      'question': '1+1=?',
      'answer1': '1',
      'answer2': '2',
      'answer3': '4',
      'correct': 'answer2',
    },
  ];

  @override
  void checkAnswer(String answer_given) {
    if (answer_given == questions[questionId]['correct']) {
      points = points + 1;
    }
    if (questionId + 1 >= questions.length) {
      endOfQuiz = true;
    }
    setState(() {
      questionId = (questionId + 1) % questions.length;
    });

    print('Answer');
  }

  void resetQuiz() {
    setState(() {
      questionId = 0;
      points = 0;
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!endOfQuiz) ...[
          Text(questions[questionId]['question']!,
              style: TextStyle(fontSize: 25)),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () => checkAnswer('answer1'),
              child: Text(questions[questionId]['answer1']!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () => checkAnswer('answer2'),
              child: Text(questions[questionId]['answer2']!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () => {checkAnswer('answer3')},
                child: Text(questions[questionId]['answer3']!)),
          ),
          Text('Current score: ${points.toString()}'),
        ] else ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Your score: ${points.toString()}/${questions.length}',
                style: TextStyle(fontSize: 25)),
          ),
          ElevatedButton(
            onPressed: () => resetQuiz(),
            child: Text("RESTART QUIZ", style: TextStyle(fontSize: 25)),
          )
        ]
      ],
    );
  }
}
