import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //we are wrapping singlechildScrollview with sizedbox
      //because we just want to make the height of 400 scrollable
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          //summaryData.map is converting that list of maps into
          //list of widgets.
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //data: means current index
                  //we are saying question index+1 becuase first question
                  //is 1 for human and 0 for machine
                  //machine got confused that which type of object data is ,
                  //so we explicitly tell it using as int
                  //since text want string while we had int so we convert it,
                  //type cast it to String using .toString
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: data['user_answer'] == data['correct_answer']
                          ? const Color.fromARGB(255, 79, 255, 188)
                          : const Color.fromARGB(255, 251, 123, 255),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        // fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 20,
                  ),
                  //bydefault column takes all the available height, even below the
                  //screen so we use expanded, it limits its child(column) size with parent
                  //(row) means it can only take space get by row above.
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(135, 255, 255, 255),
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 116, 255, 121),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            //it gave an error saying argument type'Iterable<Row>' can't be
            // assigned to the parameter type 'List<Widget>'. that's why we
            //used .tolist to convert this list of widgets into Iterables.
          ).toList(),
        ),
      ),
    );
  }
}
