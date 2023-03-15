import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class MyColumnExampleWidget extends StatelessWidget {
//   const MyColumnExampleWidget({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var questions = ['Question 1', 'Question 2', 'Question 3'];
//     return Row(
//       children: [
//         Text(questions[0], style: TextStyle(fontSize: 40)),
//         Text(questions[1], style: TextStyle(fontSize: 40)),
//         Text(questions[2], style: TextStyle(fontSize: 40)),
//       ],
//     );
//   }
// }

// class MyColumnExampleWidget2 extends StatelessWidget {
//   const MyColumnExampleWidget2({Key? key}) : super(key: key);

//   void answer() {
//     print('Answer');
//   }

//   @override
//   Widget build(BuildContext context) {
//     var questions = [
//       {
//         'question': 'Question 1 - simple',
//         'answer1': 'Answer 1.1',
//         'answer2': 'Answer 1.2',
//         'answer3': 'Answer 1.3',
//       },
//       {
//         'question': 'Question 2',
//         'answer1': 'Answer 2.1',
//         'answer2': 'Answer 2.2',
//         'answer3': 'Answer 2.3',
//       },
//     ];
//     return Column(
//       children: [
//         Text(questions[1]['question']!, style: TextStyle(fontSize: 25)),
//         ElevatedButton(
//           onPressed: () {
//             answer();
//           },
//           child: Text(questions[0]['answer1']!),
//         ),
//         ElevatedButton(
//           onPressed: answer,
//           child: Text(questions[0]['answer2']!),
//         ),
//         ElevatedButton(
//             onPressed: () => {answer()}, child: Text(questions[0]['answer3']!)),
//       ],
//     );
//   }
// }

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
    //  else {
    //   points = points - 1;
    // }
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
          // Text('Points: ${points.toString()}'),
        ] else ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Your score is: ${points.toString()}/${questions.length}',
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
