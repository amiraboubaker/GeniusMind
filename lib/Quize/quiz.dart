import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quickalert/quickalert.dart';

class QuizePage extends StatefulWidget {
  const QuizePage({Key? key});

  @override
  State<QuizePage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizePage> {
  var questions = [];
  late int index;
  int trying = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;

  final _quizBox = Hive.box('appBox');

  void fetchData() {
    questions = [
      {
        "question": "What is Undo shortcut in computer?",
        "options": ["ctl+y", "ctl+z", "ctl+s", "ctl+p"],
        "answer": 1
      },
      {
        "question": "What is Redo shortcut in computer?",
        "options": ["ctl+y", "ctl+z", "ctl+s", "ctl+p"],
        "answer": 0
      },
      {
        "question": "which is not a program language?",
        "options": ["python", "dart", "html", "typescript"],
        "answer": 2
      },
      {
        "question": "flutter's programming language?",
        "options": ["python", "dart", "swift", "java"],
        "answer": 1
      },
      {
        "question": "backend python framework?",
        "options": ["flask", "fast api", "django", "all"],
        "answer": 3
      }
    ];
  }

  @override
  void initState() {
    super.initState();
    _quizBox.put('chance', 3);
    fetchData();
    index = Random().nextInt(questions.length);
  }

  void validate(choice) {
    if (choice == questions[index]["answer"]) {
      setState(() {
        correctAnswers++;
        trying++;
      });
    } else {
      setState(() {
        incorrectAnswers++;
        trying++;
        _quizBox.put('chance', _quizBox.get('chance') - 1);
      });
    }

    if (trying == questions.length || _quizBox.get('chance') == 0) {
      Navigator.pushNamed(context, '/result', arguments: {
        "correctAnswers": correctAnswers,
        "incorrectAnswers": incorrectAnswers,
        "totalAnswers": questions.length
      });
    }
    index = Random().nextInt(questions.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(48, 32, 77, 1.0),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Icon(
                      Icons.keyboard_backspace_rounded,
                      color: Colors.red,
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(Icons.help_outlined, color: Colors.red),
                    onTap: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.info,
                        text: 'answer ${questions.length} computer questions.',
                        confirmBtnColor: Colors.red,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/quiz.jpg',
                        width: 300,
                        height: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Text(
                        questions[index]["question"],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < 2; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int j = i * 2; j < (i * 2) + 2; j++)
                                SizedBox(
                                  width: 130,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      validate(j);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: Text(questions[index]["options"][j]),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        _quizBox.get("chance").toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
