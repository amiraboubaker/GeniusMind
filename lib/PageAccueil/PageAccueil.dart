import 'package:flutter/material.dart';

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // 1- //_________ debut position__________
        body: Container(
          width: double.infinity,
          height: double.infinity,
          //color: Colors.amber[200],
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 22,
                    ),
                    Text("GeniusMind",
                        style: TextStyle(
                            fontSize: 33,
                            fontFamily: "Poppins",
                            color: Color.fromARGB(255, 101, 47, 166))),

                    //deuxgarçon.jpg

                    Image.asset(
                      "assets/images/accueil.jpeg",
                      width: 300,
                      height: 500,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 101, 47, 166)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "login",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 101, 47, 166)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 77, vertical: 13)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 24,
                            color: const Color.fromARGB(255, 245, 241, 241)),
                      ),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   left: 0,
              //   child: Image.asset(
              //     "assets/images/main_top.png",
              //     width: 111,
              //   ),
              // ),
              // Positioned(
              //   bottom: 0,
              //   child: Image.asset(
              //     "assets/images/main_bottom.png",
              //     width: 111,
              //   ),
              // ),
            ],
            // 1- //_________ fin position__________
          ),
        ),
      ),
    );
  }
}
