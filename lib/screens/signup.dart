import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/screens/login.dart';
import 'package:todoapp/services/authservice.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passcontroller = TextEditingController();
    final namepasscontroller = TextEditingController();
    void signUp() async {
      final _authservice = Provider.of<AuthService>(context, listen: false);
      try {
        await _authservice.signUpWithEmailAndPassword(
            emailcontroller.text, passcontroller.text);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
    return Scaffold(
      backgroundColor: Colors.teal[100], // Soft blue background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo (Replace with your logo widget)
              FlutterLogo(size: 100.0),
              SizedBox(height: 20.0),
              // Name Field
              TextField(
                controller: namepasscontroller,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              // Email Field
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              // Password Field
              TextField(
                controller: passcontroller,
                obscureText: true, // Hide password
                decoration: InputDecoration(
                  hintText: "Password",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {}, // Implement password visibility toggle
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Sign Up Button
              ElevatedButton(
                onPressed: signUp,
                child: Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              // Already have an account text with Login option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
