import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  //we are telling that startQuiz will take a function
  //that will return nothing(void) and have no parameter, Function(empty)
  //we can just use function as well
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            //we are using color, becuase we want to decrease the opacity to 150 from 255
            //alternative approach could be using Opacity widget
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Learn flutter the fun way',
            style: GoogleFonts.aBeeZee(
              fontSize: 24,
              color: const Color.fromARGB(255, 240, 216, 248),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // .icon means we can use outlined button with icon
          OutlinedButton.icon(
            onPressed: startQuiz,
            //when we use .icon, we need to use label instead of child
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
