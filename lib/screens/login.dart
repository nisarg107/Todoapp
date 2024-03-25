import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/screens/signup.dart';
import 'package:todoapp/services/authservice.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final emailcontroller=TextEditingController();
  final passcontroller=TextEditingController();
   void signIn() async {
    final _authservice = Provider.of<AuthService>(context, listen: false);
    try {
      await _authservice.signInWithEmailAndPassword(
          emailcontroller.text, passcontroller.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  @override
  Widget build(BuildContext context) {
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
              // Username/Email Field
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Username or Email",
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
              // Login Button
              ElevatedButton(
                onPressed: signIn,
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Remember Me Checkbox
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: Text("Sign Up"),
                      ),
                    ],
                  ),
                  // Forgot Password Link
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?"),
                  ),
                ],
              ),
              // Optional Sign Up Link
            ],
          ),
        ),
      ),
    );
  }
}
