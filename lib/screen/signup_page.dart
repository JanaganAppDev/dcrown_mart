import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  bool rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      print("Signup Button Clicked");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            Text(
              "Let's get Started!",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Create an account on to use all the features",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.0),
            Image.asset(
              "assets/signup_logo.jpg",
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 50.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Name",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Container(
                      height: 50.0,
                      child: TextFormField(
                        validator: _validateEmail,
                        decoration: InputDecoration(
                          labelText: "Email",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Container(
                      height: 50.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Mobile",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.mobile_friendly),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Container(
                      height: 50.0,
                      child: TextFormField(
                        validator: _validatePassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Container(
                      height: 50.0,
                      child: TextFormField(
                        validator: _validatePassword,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                          activeColor: Colors.yellow,
                        ),
                      ),
                    ),
                    Text(
                      "By signing up, you agree to our Terms and Policy",
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 140.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Signup"),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you have an account?",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: handleLogin,
                    child: Text(
                      "Login Here",
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
