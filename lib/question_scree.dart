import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectAnswers, {super.key});
  final void Function(String) onSelectAnswers;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    //widget property allows to access data in widget class while staying in
    //state class.
    //whenever answerQuestion will be called, it will give a value to selectedAnswer
    //that value is passed to quiz.
    widget.onSelectAnswers(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      //here we took full available width
      width: double.infinity,
      child: Container(
        //we wrap column inside container becuase we want to give margin(outside spacing)
        margin: const EdgeInsets.all(10),
        child: Column(
          //here we are centering, since column take full available height
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 247, 155, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //current question contains all items of question[0]
            //.map converting list of string into a list of widgets.
            //... then pulled all those iems in a list of widgets created
            //by .map and made them children widgets for column.
            //we are doing this on shuffledlist
            ...currentQuestion.getShuffledAnswer().map(
              (answer) {
                return AnswerButton(
                    answerText: answer,
                    //we wrapped answerQuestion inside (){} becuase
                    //onTap needs a function with no return value
                    //while answerQuestion returns a string
                    onTap: () {
                      answerQuestion(answer);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
