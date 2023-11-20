import 'package:flutter/material.dart';
import 'package:medical_app_final/models/question.dart';

class QuestionWidget extends StatelessWidget {

  final Question question;
  final Widget optionWidget;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.optionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.questionSentence,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 30),
        // i will pass the option widget in the test page to change the ui and work on it .
        Expanded(child: optionWidget),
      ],
    );
  }
}
