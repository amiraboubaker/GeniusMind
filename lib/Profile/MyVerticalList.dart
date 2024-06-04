import 'package:courskids/ListeCourse/ListeCourse.dart';
import 'package:courskids/Profile/MyComponent.dart';
import 'package:courskids/Quizzler/main.dart';
import 'package:flutter/material.dart';

class MyVerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListeCourse()),
            );
          },
          child: MyComponent(
            title: 'My Tutos',
            icon: Icons.school,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizPage()),
            );
          },
          child: MyComponent(
            title: 'Quiz',
            icon: Icons.quiz,
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => QuizePage()),
        //     );
        //   },
        //   child: MyComponent(
        //     title: 'Quize',
        //     icon: Icons.quiz,
        //   ),
        // ),
      ],
    );
  }
}
