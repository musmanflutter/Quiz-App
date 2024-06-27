class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  //answer will be a list of strings.
  final List<String> answers;

  List<String> getShuffledAnswer() {
    //of is a method of list
    //it copies existing list into another
    final shuffledList = List.of(answers);
    //shuffle() : shuffles the existing list
    //thats why we are creating a new shuffled list so
    //that the existing list in question[] doesnt change
    shuffledList.shuffle();
    return shuffledList;
  }
}
