import 'package:courskids/Profile/Profile.dart'; // Importer la page de profil
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ListeCourse extends StatefulWidget {
  const ListeCourse({Key? key}) : super(key: key);

  @override
  _ListeCourseState createState() => _ListeCourseState();
}

class _ListeCourseState extends State<ListeCourse> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'S7IDZnvxSV0', // YouTube video ID
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lesson 1 : DataScience Course'),
          actions: [
            // Ajoutez ici un bouton pour naviguer vers le profil
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.grey[200],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:
                        300, // Ajustez la hauteur du lecteur vidéo au besoin
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: YoutubePlayer(controller: _controller),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'LESSON #1',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text('Lorem ipsum dolor sit amet...'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
