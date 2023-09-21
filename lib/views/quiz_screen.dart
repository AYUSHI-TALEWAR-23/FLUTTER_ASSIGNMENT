import 'package:flutter/material.dart';
import 'package:quizapp/views/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List quizListData = [
    {
      "id": 1,
      "answer": "'C'",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "Which of the following is not an Operating System ?",
      "options": [
        {
          "option": "a. ",
          "value": "DOS",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b. ",
          "value": "Mac",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c. ",
          "value": "Linux",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d. ",
          "value": "'C'",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 2,
      "answer": "Apple",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "Mac Operating System is developed by which Company ?",
      "options": [
        {
          "option": "a. ",
          "value": "IBM",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b. ",
          "value": "Microsoft",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c. ",
          "value": "Apple",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d. ",
          "value": "Samsung",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 3,
      "answer": "Linux",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "Which one is the first fully supported 64-bit operating system.",
      "options": [
        {
          "option": "a. ",
          "value": "Windows Vista",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b. ",
          "value": "Mac",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c. ",
          "value": "Windows XP",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d. ",
          "value": "Linux",
          "color": "0xFFFFFFFF",
        },
      ],
    },
  ];

  final _pageController = PageController(initialPage: 0);
  int questionINdex = 0;

  int userPercentage = 0;
  int wrongQ = 0;
  int skippedQuestion = 0;
  int totalRight = 0;

  quizResult(context) {
    userPercentage = 0;
    wrongQ = 0;
    skippedQuestion = 0;
    totalRight = 0;

    for (int i = 0; i < quizListData.length; i++) {
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 0) {
        skippedQuestion++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 1) {
        totalRight++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 2) {
        wrongQ++;
      }
    }

    userPercentage = ((totalRight / quizListData.length) * 100).round();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userPercentage: userPercentage,
            totalRight: totalRight,
            wrongQ: wrongQ,
            skippedQuestion: skippedQuestion,
          ),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 148, 156),
      appBar: AppBar(
        title: const Text("Quiz Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question :${questionINdex + 1}/${quizListData.length}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'TanseekModernProArabic',
                color: Colors.white,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: quizListData.length,
                onPageChanged: (page) {
                  setState(
                    () {
                      questionINdex = page;
                    },
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 122, 210, 252),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.10),
                          child: Text(
                            quizListData[index]['title'],
                            style: const TextStyle(
                                fontFamily: 'TanseekModernProArabic',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      quizListData[index]
                                  ['is_answer_status_right_wrong_omitted'] ==
                              2
                          ? Text(
                              "Sorry : Right answer is -> ${quizListData[index]['answer']} ",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 122, 8, 2),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      ...quizListData[index]['options']
                          .map(
                            (data) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: SizedBox(
                                width: double.maxFinite,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(
                                        int.parse(
                                          data['color'],
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (quizListData[index]['is_answered'] ==
                                          0) {
                                        setState(() {
                                          if (data['value'] ==
                                              quizListData[index]['answer']) {
                                            data['color'] = "0xFF31CD63";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 1;
                                          } else {
                                            data['color'] = "0xFFFF0000";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 2;
                                          }
                                          quizListData[index]['is_answered'] =
                                              1;
                                        });
                                      } else {}
                                    },
                                    //option css
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Color(
                                                int.parse(
                                                  data['color'],
                                                ),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                data['option'].toUpperCase(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            data['value'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (questionINdex == quizListData.length - 1) {
            quizResult(context);
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeIn,
            );
          }
        },
        label:
            Text(questionINdex == quizListData.length - 1 ? "Submit" : "Next"),
      ),
    );
  }
}
