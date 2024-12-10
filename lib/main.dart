import 'package:flutter/material.dart';
import 'Screens/homeScreen.dart';
import 'Screens/drawer.dart';
import 'SplashScreen/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
void main (){
  runApp(mainApp());
}
class mainApp extends StatelessWidget {
  const mainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
