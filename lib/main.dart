import 'package:flutter/material.dart';
// ♦ Importing the "rFlutter_Alert" Package:
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

// ♦♦ The "quizBrain" Object:
QuizBrain quizBrain = QuizBrain();

// ♦♦ The First Function Rolled:
void main() => runApp(Quizzler());

// ♦♦ The "Quizzler" Child Class
//    → that Extends the "StatelessWidget" Parent Class:
class Quizzler extends StatelessWidget {
  // ♦♦ The "build(){}" Inherited Parent Method & "Override It":
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

// ♦♦ The "QuizPage" Child Class
//    → that Extends the "StatefulWidget" Parent Class:
class QuizPage extends StatefulWidget {
  // ♦♦ The "createState(){}" Inherited Parent Method & "Override It":
  @override
  State<QuizPage> createState() => _QuizPageState();
}

// ♦♦ The "_QuizPageState" Child Class
//     → that Extends the "State<QuizPage>" Parent Class:
class _QuizPageState extends State<QuizPage> {
  // "List" of "Icon()" Widgets:
  List<Icon> scoreKeeper = [];

  // ♦♦ The "checkAnswer()" Method:
  void checkAnswer(bool userPickedAnswer) {
    // Calling the "getCorrectAnswer()" Method
    // → that Accesses the "Private Property"
    //   ("_quizBrain" Object")
    // → from the "QuizBrain" Class
    // → to Obtain the "questionNumber":
    bool correctAnswer = quizBrain.getCorrectAnswer();

    // ♦ Calling the Method:
    quizBrain.getCorrectAnswer();

    // State Setting:
    setState(() {
      // Checking the Conditions:
      if (quizBrain.isFinished() == true) {
        // ♦ Showing an Alert
        //   → using "rFlutter_alert":

        // ♦ Basic Alert  Syntax
        //    → from the Docs for "rFlutter Alert":
        //   Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        // ♦ The "Alert()" Method Call:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        // ♦ Reset the "questionNumber":        quizBrain.reset();

        // ♦ Empty out the scoreKeeper.
        scoreKeeper = [];
      }

      // Else we've Not Reached the End
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        // Calling the "nextQuestion()" Method
        // → to Get the "Next Question"
        // → from "quizBrain" Object:
        quizBrain.nextQuestion();
      }
    });
  }

  // ♦♦ The "build(){}" Inherited Parent Method & "Override It":
  @override
  Widget build(BuildContext context) {
    return Column(
      // ♦ Alignment:
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // Calling the "getQuestionText" Method
                // → that Accesses the "Private Property"
                //   ("_quizBrain" Object")
                // → from the "QuizBrain" Class
                // → to Obtain the "questionNumber":
                quizBrain.getQuestionText(),

                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.white),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
