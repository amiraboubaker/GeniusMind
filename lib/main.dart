import 'package:courskids/ListeCourse/ListeCourse.dart';
import 'package:courskids/LoginEtSignup/Login.dart';
import 'package:courskids/LoginEtSignup/Signup.dart';
import 'package:courskids/PageAccueil/PageAccueil.dart';
import 'package:courskids/Profile/Profile.dart';
import 'package:courskids/Quize/quiz.dart';
import 'package:courskids/Quizzler/main.dart';
import 'package:courskids/VedeoCourse/VideoCourse.dart';
import 'package:courskids/dashboard/src/pages/favoris.dart';
import 'package:courskids/dashboard/src/pages/home_page.dart';
import 'package:courskids/dashboard/src/pages/recomended_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const PageAccueil(),
        "/login": (context) => const Login(),
        "/signup": (context) => const Signup(),
        "/home": (context) => HomePage(key: UniqueKey()),
        "/recomended": (context) => const RecomendedPage(),
        "/favoris": (context) => const FavoritesPage(),
        "/profile": (context) => const Profile(),
        "/list_course": (context) => const ListeCourse(),
        "/video_course": (context) => const VideoCourse(),
        "/quiz": (context) => const Quizzler(),
        '/quize': (context) => const QuizPage(),
      },
    );
  }
}
