import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionsScreen();
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == "start-screen"
    //           ? StartScreen(switchScreen)
    //           : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    } 

    if(activeScreen=="results-screen"){
      screenWidget = ResultsScreen(choosenAnswers: selectedAnswers,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          // child: activeScreen == "start-screen"
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
