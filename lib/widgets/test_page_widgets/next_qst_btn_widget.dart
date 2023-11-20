import 'package:flutter/material.dart';
import 'package:medical_app_final/constants/constants.dart';


class NextButton extends StatelessWidget {
  final int qstNum;
  final int qstsLen;
  final VoidCallback? onNextBtnClicked;

  const NextButton({
    super.key,
    required this.qstNum,
    required this.qstsLen,
    required this.onNextBtnClicked,
  });


  @override
  Widget build(BuildContext context) {
    final isThereNext = qstNum < qstsLen;
    return Row(
      // this for the button to be add the right bottom of the page.
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton.icon(
          onPressed: onNextBtnClicked,
          // i reverse them to achieve the text before the icon .
          label: const Icon(Icons.arrow_forward_ios),
          icon: Text(isThereNext ? "Next" : "See Results"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kAppColor),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.fromLTRB(25, 15, 25, 15)),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            iconSize: MaterialStateProperty.all<double>(16),
          ),
        ),
      ],
    );
  }
}
