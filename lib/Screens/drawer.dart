import 'package:flutter/material.dart';
import '../AboutUS/AboutusScreen.dart';
import '../QuizApp/quizScreen.dart';
import 'homeScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class drawerScreen extends StatefulWidget {
  const drawerScreen  ({super.key});

  @override
  State<drawerScreen> createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App',style: GoogleFonts.abrilFatface(),),
          bottom: TabBar(
            indicatorColor: Colors.amberAccent,
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.quiz)),
                Tab(icon: Icon(Icons.book)),
              ],
                ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(key: Key('HomeScreen'),),
            QuizScreen(key: Key('quizScreen'),),
            AboutScreen(key: Key('AboutScreen'),),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Center(
                child: UserAccountsDrawerHeader(
                    accountName: Text('Group'),
                    accountEmail: Text('group743@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                     // clipBehavior: Clip.antiAlias,
                        child: Image.asset('Images/right.png',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,),

                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.quiz),
                title: Text('Quiz'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (b)=>
                  QuizScreen(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('AboutUs'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (d)=>
                  AboutScreen()
                  ));
                },
              ),
            ],
          ),
        ),

      ),
    );
  }
}
