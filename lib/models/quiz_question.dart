class QuizQuestion{
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() { // get shuffuledAnswers //this is a getter
    final shuffledList = List.of(answers); 
    shuffledList.shuffle();
    return shuffledList;
  }
}