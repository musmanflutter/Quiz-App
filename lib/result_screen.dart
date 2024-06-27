import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.onRestart});

  final List<String> choosenAnswer;
  final void Function() onRestart;
//we are using type of value as object because its not fixed
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          //because the first value of asnwer is always right
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    //we are using getSummaryData with () because we dont want
    //to point to a function, instead we want it to run, and give us
    //the list here.
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    //.where is used to check a condition
    //we checked if user entered data is equal to correct data
    //then convert it to lenth because we just need it.
    final numCorrectAnswer = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswer out of $numTotalQuestion questions correctly',
              style: GoogleFonts.aBeeZee(
                color: const Color.fromARGB(255, 220, 176, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.refresh),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
