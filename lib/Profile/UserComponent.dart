import 'package:flutter/material.dart';

class UserComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 30.0), // Ajout de padding en bas
      color: Color.fromARGB(255, 117, 13, 161), // Background bleu foncé
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Alignement des enfants en bas
        crossAxisAlignment: CrossAxisAlignment.center, // Alignement horizontal au centre
        children: [
          Icon(Icons.account_circle, size: 60.0, color: Colors.white), // Logo de l'utilisateur
          SizedBox(height: 8.0),
          Text(
            'Nom de l\'utilisateur',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}