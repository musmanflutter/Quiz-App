import 'package:flutter/material.dart';

import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/question_scree.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //we are lifting the stateup, means passing the pointer
  //to switchscreen to the StartScreen
  // ? means it can be null as well
//   Widget? activeScreen;

//   @override
//   //initState() method is called before the build() method, so any
//   // initialization done in initState() will occur before the widget
//   // is built and displayed on the screen
//   void initState() {
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }

// //we are changing the data conditionally, if this method is called,
// //active screen changes.
//   void switchScreen() {
//     setState(() {
//       activeScreen = QuestionScreen();
//     });
//   }

//another approach could be
  var activeScreen = 'start-screen';
  //selected answers will be stored here
  List<String> selectedAnswers = [];
  //this method will add the selected answer to selectedAnswers
  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      //selected answers will be null when this method is called
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionScreen(choosenAnswer);

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswer: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 61, 5, 104),
                Color.fromARGB(255, 122, 5, 146),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
