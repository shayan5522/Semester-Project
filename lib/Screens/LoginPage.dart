import 'package:flutter/material.dart';
import 'package:semester_project/Screens/drawer.dart';
import 'package:semester_project/Database/DatabaseHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';
  bool isPasswordVisible = false; // Track password visibility

  void _login() async {
    final email = emailController.text;
    final password = passwordController.text;

    final dbHelper = DatabaseHelper.instance;

    try {
      final user = await dbHelper.getUserByEmail(email);

      if (user != null && user['password'] == password) {
        // Successful login, navigate to the next screen or perform desired actions.
        setState(() {
          errorMessage = ''; // Clear the error message
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => drawerScreen()));
      } else {
        // Login failed, show an error message.
        setState(() {
          errorMessage = 'Invalid email or password. Please try again.';
        });
      }
    } catch (e) {
      // Handle any exceptions that occur during database operations.
      print('Error during login: $e');
      setState(() {
        errorMessage = 'An error occurred while logging in. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 60,
              child: ClipOval(
                child: Image.asset('Images/bgm1.jpg'),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 1000,
              height: 100,
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  labelText: 'Email',
                  hoverColor: Colors.brown,
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            Container(
              width: 1000,
              height: 100,
              child: TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible, // Toggle password visibility
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: 'Enter password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible; // Toggle password visibility on tap
                      });
                    },
                    child: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _login,
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0), // Adjust the value as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
