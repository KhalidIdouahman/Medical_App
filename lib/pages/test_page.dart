import 'package:flutter/material.dart';
import 'package:medical_app_final/constants/constants.dart';
import 'package:medical_app_final/models/question.dart';
import 'package:medical_app_final/pages/result_page.dart';
import 'package:medical_app_final/widgets/test_page_widgets/next_qst_btn_widget.dart';
import 'package:medical_app_final/widgets/test_page_widgets/option_widget.dart';
import 'package:medical_app_final/widgets/test_page_widgets/question_widget.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // to display the number of the current question .
  int questionNum = 1;
  // this contains the number total of questions .
  final int questionLength = questions.length;
  // this controlles the pageview .
  late PageController _pageController;
  // to get the score of the clicked option.
  int _score = 0;
  // the total score
  int _totalScore = 0;
  // this contains the value of the clicked radio btn to see the selected option.
  PsychoState? radioBtnGroupValue;
  // this var for the next btn to change it's state between enabled and disable depands on the click on any option.
  bool _isOptionPicked = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 234, 234),
      appBar: AppBar(
        title: const Text('Taking The Test'),
        centerTitle: true,
        // to make the toolbar a little bigger .
        toolbarHeight: 70.0,
        backgroundColor: kAppColor,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            Text(
              '$questionNum / ${questions.length}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 32),
            Expanded(
              // this is like the recycler view , it's the container that displays the questions .
              child: PageView.builder(
                controller: _pageController,
                itemCount: questionLength,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return QuestionWidget(
                    question: question,
                    optionWidget: OptionWidget(
                      question: question,
                      groupValue: radioBtnGroupValue,
                      onRadioBtnClicked: (val) {
                        setState(() {
                          radioBtnGroupValue = val;
                          _isOptionPicked = true;
                          // pass the score in the PsychoState object , like always(score: 3).
                          _score = val.score;
                        });
                      },
                    ),
                  );
                },
                // for the pageview to not be scrolled until the next button to be clicked .
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            NextButton(
              qstNum: questionNum,
              qstsLen: questionLength,
              // here if he doesn't select a radio btn the next btn should be disabled , else enable it.
              onNextBtnClicked: _isOptionPicked ? handleNextBtnActions : null,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void handleNextBtnActions() {
      if (questionNum < questionLength) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );

        setState(() {
          questionNum++;
          radioBtnGroupValue = null;
          _isOptionPicked = false;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(score: _totalScore),
          ),
        );
      }
      // here i get the score and add to the total in all cases.
      _totalScore += _score;
      // print(_score);
      // print(_totalScore);
  }
}
