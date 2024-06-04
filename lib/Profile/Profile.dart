import 'package:courskids/Profile/MyVerticalList.dart';
import 'package:courskids/Profile/UserComponent.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  BottomNavigationBarItem _bottomIcons(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Nouveau composant pour le logo de l'utilisateur
            UserComponent(),
            SizedBox(
                height:
                    20), // Espacement entre le composant de l'utilisateur et les autres composants
            // La liste verticale des composants existants
            Expanded(child: MyVerticalList()),
          ],
        ),
        // Barre de navigation
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color.fromARGB(255, 101, 47, 166),
          unselectedItemColor: Colors.grey.shade300,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: 3, // Assuming this is the profile page
          items: [
            _bottomIcons(Icons.home),
            _bottomIcons(Icons.star_border),
            _bottomIcons(Icons.book),
            _bottomIcons(Icons.person),
          ],
          onTap: (index) {
            // Navigation en fonction de l'icône sélectionnée
            if (index == 0) {
              Navigator.pushReplacementNamed(context, "/home");
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, "/recomended");
            } else if (index == 2) {
              Navigator.pushReplacementNamed(context, "/favoris");
            } else if (index == 3) {
              Navigator.pushReplacementNamed(context, "/profile");
            }
          },
        ),
      ),
    );
  }
}
