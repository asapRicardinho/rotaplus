class QuestionModel {
  const QuestionModel({required this.text, required this.answers});

  final String text;
  final List<AnswerOption> answers;
}

class AnswerOption {
  const AnswerOption({required this.text, required this.area});

  final String text;
  final String area;
}
