import 'package:flutter/material.dart';
import 'package:quizapp/views/quiz_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("QUICK QUIZ"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.10),
        child: Column(
          children: [
            const SizedBox(
              height: 40, // use for space between the image and text
            ),
            Image.asset(
              'assets/images/quiz.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "LET'S PUT YOUR KNOWLEDGE TO THE TEST !",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(10.10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
                    ),
                  );
                },
                tileColor: Colors.cyan,
                textColor: Colors.white,
                iconColor: Colors.white,
                title: const Text("GET STARTED"),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
