import 'package:courskids/dashboard/src/pages/favoris.dart';
import 'package:flutter/material.dart';

import 'src/pages/home_page.dart';
import 'src/pages/recomended_page.dart'; // Import RecommendedPage
import 'src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(key: UniqueKey()),
        '/recomended': (context) => RecomendedPage(),
        '/favoris': (context) => FavoritesPage(),
      },
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
