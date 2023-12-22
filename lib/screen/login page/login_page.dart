import 'dart:convert';
import 'package:dcrown_mart/screen/login%20page/ForgotPassword_page.dart';
import 'package:dcrown_mart/screen/home%20page/home_page.dart';
import 'package:dcrown_mart/screen/signup%20page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool _passwordVisible = false;
bool _isButtonClicked = false;

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  void login(String email, password) async {
    print(email);
    print(password);
    try {
      final response = await http
          .post(Uri.parse('http://localhost:5000/api/users/login'), body: {
        'email': email.toString(),
        'password': password.toString(),
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(response.body);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Successful"),
              content: Text("You have successfully Login."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK")),
              ],
            );
          },
        );
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.0),
              Image(
                  width: 100.0,
                  height: 100.0,
                  image: AssetImage("assets/crown_logo.png")),
              SizedBox(height: 10.0),
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Log in to your existing account",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailControler,
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                  hintText: 'Mobile No/Email id/User id',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: _isButtonClicked ? Colors.red : Colors.yellow,
                    ),
                  ),
                ),
                validator: _validateEmail,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordControler,
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(_isButtonClicked ? 30.0 : 20.0),
                    borderSide: BorderSide(
                      color: _isButtonClicked ? Colors.grey : Colors.yellow,
                    ),
                  ),
                ),
                obscureText: !_passwordVisible,
                validator: _validatePassword,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                width: 140.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate the form

                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isButtonClicked = true;
                      });
                      print("test");
                      login(emailControler.text.toString(),
                          passwordControler.text.toString());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      print("test1");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Log In'),
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: Text(
                        "Sign up",
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
      ),
    );
  }
}
