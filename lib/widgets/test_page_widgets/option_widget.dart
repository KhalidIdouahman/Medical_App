import 'package:flutter/material.dart';
import 'package:medical_app_final/models/question.dart';

class OptionWidget extends StatelessWidget {
  final Question question;
  final PsychoState? groupValue;
  final ValueChanged? onRadioBtnClicked;

  const OptionWidget(
      {super.key,
      required this.question,
      required this.groupValue,
      required this.onRadioBtnClicked,
      });

  @override
  Widget build(BuildContext context) => Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: question.options
            .map((option) => buildOption(context, option))
            .toList(),
      );

  Widget buildOption(BuildContext ctx, Option opt) {
    return RadioListTile<PsychoState>(
      contentPadding: const EdgeInsets.all(0),
      value: opt.state,
      title: Text(
        opt.state.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      groupValue: groupValue,
      onChanged: onRadioBtnClicked,
    );
  }
}
