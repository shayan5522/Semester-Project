import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to the Quiz App!',
                style: GoogleFonts.b612Mono(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'We are a passionate group of six individuals who came together to create this quiz app project. Our shared love for knowledge and a desire to make learning fun and interactive led us on this incredible journey.',
                style: GoogleFonts.alike(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Meet the Team:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Rehan Anjum:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rehan Anjum is our junior requirement engineer who played a crucial role in gathering requirements. With their expertise, we were able to gather proper requirements for this app.',
                style: GoogleFonts.alike(
                  fontSize: 16,
                ),
              ),
              Text(
                'Rizwan:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rizwan is our designer responsible for designing our app. Their creativity and dedication helped us to design the UI as well as basic implementation.',
                style: GoogleFonts.alike(
                  fontSize: 16,
                ),
              ),
              Text(
                'Shayan Ahmed:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Shayan is our developer and has been instrumental in developing this app. Thanks to their skills, we were able to develop this app on the implementation level.',
                style: GoogleFonts.alike(
                  fontSize: 16,
                ),
              ),
              Text(
                'Akash Manzoor:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Akash serves as our tester and has been responsible for testing the software. Their attention to detail and problem-solving abilities played a vital role in developing an error-free app.',
                style: GoogleFonts.alike(
                  fontSize: 16,
                ),
              ),
              Text(
                'Muhammad Haseeb:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Haseeb serves as our mentor and has also shown his expertise in the development phase with Shayan as well.',
                style: GoogleFonts.alike(
                  fontSize: 16,
                ),
              ),
              Text(
                'Wasif:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Last but not least, we have Wasif as our Project manager. They have been instrumental in managing the whole group. Their commitment and hard work contributed significantly to work other members to work efficiently in a group.',
                style: GoogleFonts.alike(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'At Quiz App, our mission is to make learning fun, engaging, and accessible to all. We believe that quizzes are not just a means of testing knowledge but also a way to foster curiosity and spark a lifelong love for learning. Our goal is to provide a platform where you can challenge yourself, learn something new, and have a great time while doing it.',
                style: GoogleFonts.alike(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Have a question, suggestion, or just want to say hello? We would love to hear from you! Feel free to reach out to us at quizzteam@gmail.com.',
                style: GoogleFonts.alike(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
