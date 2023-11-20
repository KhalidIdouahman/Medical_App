import 'package:flutter/material.dart';
import 'package:medical_app_final/constants/constants.dart';
import 'package:medical_app_final/models/question.dart';
import 'package:medical_app_final/pages/home_page.dart';

class ResultPage extends StatelessWidget {
  final int score;
  const ResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //  to make the column take all the width of the screen and to be centered .
          SizedBox(width: MediaQuery.of(context).size.width),
          const Text(
            "Your Score ",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: kAppColor,
                  strokeWidth: 10,
                  value: score / questions.length,
                ),
              ),
              Column(
                children: [
                  Text(
                    score.toString(),
                    style: const TextStyle(
                        fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    // "${((score / questions.length * 100) / 3).round()}%",
                    "${((score / 3) / questions.length * 100).round()}%",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          // if he has an account will be saved in his profile , else until he register .
          const Text(
            "Your Score of this Test Will be Saved !",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ),
            icon: const Icon(Icons.arrow_back_ios),
            label: const Text("Go Back To Dashboard"),
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
      ),
    );
  }
}
