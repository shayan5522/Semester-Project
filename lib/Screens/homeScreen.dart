import 'package:flutter/material.dart';
import 'drawer.dart';
import '../QuizApp/quizScreen.dart';
import '../AboutUS/AboutusScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Stack( // Use a Stack to layer the background image and content
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'Images/bgm1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (v){
                      return  QuizScreen();
                      }));
                    },
                    child: Text(
                      'Start-Quiz',
                      style: GoogleFonts.gabriela(
                        color: Colors.white, // Text color
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
