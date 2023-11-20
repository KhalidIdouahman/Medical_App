class Question {
  final String questionSentence;
  final List<Option> options;
  Option? selectedOption;

  Question({
    required this.questionSentence,
    required this.options,
    this.selectedOption,
  });

  @override
  String toString() {
    return 'Question : $questionSentence , Options : $options';
  }
}

class Option {
  final PsychoState state;

  const Option({required this.state});
}

enum PsychoState {
  Always(score: 3),
  Often(score: 2),
  Never(score: 1);

  const PsychoState({required this.score});
  final int score;
}

List<Question> questions = [
  Question(
    questionSentence: 'Are you feel stressed all the time ',
    options: PsychoState.values.map((value) => Option(state: value)).toList(),
  ),
  Question(
    questionSentence: 'Are you feel unconfortable all the time ',
    options: PsychoState.values.map((value) => Option(state: value)).toList(),
  ),
  Question(
    questionSentence: 'Are you feel afraid all the time ',
    options: PsychoState.values.map((value) => Option(state: value)).toList(),
  )
];
