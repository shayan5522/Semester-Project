import 'package:flutter/material.dart';
import '../Screens/drawer.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {'question': 'Is Flutter a mobile app development framework?', 'answer': true},
    {'question': 'Is Dart the primary language for Flutter?', 'answer': true},
    {'question': 'Is OpenAI the creator of Flutter?', 'answer': false},
    {'question': 'Is Flutter used for web development?', 'answer': true},
  ];

  List<Icon> iconsRow = [];
  int questionNo = 0;

  bool quizCompleted = false; // Added to track quiz completion
  int correctAnswers = 0; // Added to track the number of correct answers

  void checkAnswer(bool userAnswer) {
    if (quizCompleted) return; // Don't check answers if quiz is completed

    bool correctAnswer = questions[questionNo]['answer'];
    if (userAnswer == correctAnswer) {
      iconsRow.add(Icon(Icons.check, color: Colors.green));
      correctAnswers++; // Increment correct answers count
    } else {
      iconsRow.add(Icon(Icons.close, color: Colors.red));
    }

    setState(() {
      if (questionNo < questions.length - 1) {
        questionNo++;
      } else {
        quizCompleted = true; // Mark quiz as completed
        // Calculate the percentage score
        double percentageScore = (correctAnswers / questions.length) * 100;

        // Handle quiz completion here, e.g., show a dialog or navigate to a new screen.
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Quiz Completed'),
            content: Text('You have completed the quiz.\nPercentage Score: ${percentageScore.toStringAsFixed(2)}%'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  void restartQuiz() {
    setState(() {
      quizCompleted = false; // Reset quiz completion status
      questionNo = 0; // Reset question number
      iconsRow.clear(); // Clear answer icons
      correctAnswers = 0; // Reset correct answers count
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: Center(
                    child: Text(
                      quizCompleted ? 'Quiz Completed' : questions[questionNo]['question'] ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              if (!quizCompleted) // Show buttons only if the quiz is not completed
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Center(
                      child: Text(
                        'TRUE',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 15),
              if (!quizCompleted) // Show buttons only if the quiz is not completed
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: Center(
                      child: Text(
                        'FALSE',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 15),
              Expanded(child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (cc){
                    return drawerScreen();
                  }));
                },
                child: Text('Go To Home-Page'),
              )),
              SizedBox(height: 15),
              SingleChildScrollView(
                child: Row(
                  children: iconsRow,
                ),
              ),
              SizedBox(height: 15),
              if (quizCompleted) // Show buttons only if the quiz is completed
                ElevatedButton(
                  onPressed: restartQuiz,
                  child: Text('Restart Quiz'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
