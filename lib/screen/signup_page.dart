import 'dart:convert';

import 'package:dcrown_mart/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/home_page.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

bool _passwordVisible = false;
bool _confirmpasswordVisible = false;
bool _isButtonClicked = false;

class _SignupPageState extends State<SignupPage> {
  String? countryCode = '+1';
  bool rememberMe = false;
  bool isNameValid = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String globalVariable = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  void signup(String name, email, mobile, password) async {
    try {
      final url = Uri.parse("http://localhost:5000/api/users/register");

      final response = await http.post(url, body: {
        'name': name,
        'email': email,
        'phone': mobile,
        'password': password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());

        print(response.body);
        setState(() {
          globalVariable = data["token"];
          print(globalVariable);
          print("Registration successful!");
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Register successfully!'),
            duration: Duration(seconds: 3),
          ));
          /*       showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Registeration Successful"),
                content: Text("You have successfully registered."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK")),
                ],
              );
            },
          );*/
        });
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _validatePasswordConfirmation(
    String? confirmPassword,
  ) {
    final password = confirmPassword;
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please enter your password';
    }
    if (password != passwordController.text) {
      return 'Passwords do not match';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        controller: nameController,
                        cursorColor: Colors.grey[700],
                        decoration: InputDecoration(
                          hintText: "Name",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.yellow,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                _isButtonClicked ? 30.0 : 20.0),
                            borderSide: BorderSide(
                              color:
                                  _isButtonClicked ? Colors.red : Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: Container(
                      height: 50.0,
                      child: TextFormField(
                        validator: _validateEmail,
                        controller: emailController,
                        cursorColor: Colors.grey[700],
                        decoration: InputDecoration(
                          hintText: "Email",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.email, color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.yellow,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                _isButtonClicked ? 30.0 : 20.0),
                            borderSide: BorderSide(
                              color:
                                  _isButtonClicked ? Colors.red : Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: Row(
                      children: [
                        Container(
                          width: 120.0,
                          height: 50.0,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your country code';
                              }
                              return null;
                            },
                            cursorColor: Colors.grey[700],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Colors.yellow),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    _isButtonClicked ? 30.0 : 20.0),
                                borderSide: BorderSide(
                                  color: _isButtonClicked
                                      ? Colors.red
                                      : Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Container(
                            width: 338.0,
                            height: 50.0,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your mobile number';
                                }
                                if (value.length < 10) {
                                  return 'Mobile number must be 10 digits';
                                }
                                return null;
                              },
                              controller: mobileController,
                              cursorColor: Colors.grey[700],
                              decoration: InputDecoration(
                                hintText: "Mobile",
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.mobile_friendly,
                                    color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(color: Colors.yellow),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      _isButtonClicked ? 30.0 : 20.0),
                                  borderSide: BorderSide(
                                    color: _isButtonClicked
                                        ? Colors.red
                                        : Colors.yellow,
                                  ),
                                ),
                              ),
                              obscureText: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: Container(
                      height: 50.0,
                      child: TextFormField(
                        validator: _validatePassword,
                        controller: passwordController,
                        cursorColor: Colors.grey[700],
                        decoration: InputDecoration(
                          hintText: "Password",
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
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.yellow,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                _isButtonClicked ? 30.0 : 20.0),
                            borderSide: BorderSide(
                              color:
                                  _isButtonClicked ? Colors.red : Colors.yellow,
                            ),
                          ),
                        ),
                        obscureText: !_passwordVisible,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: Container(
                      height: 50.0,
                      child: TextFormField(
                        controller: confirmPass,
                        cursorColor: Colors.grey[700],
                        validator: _validatePasswordConfirmation,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmpasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmpasswordVisible =
                                    !_confirmpasswordVisible;
                              });
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.yellow,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                _isButtonClicked ? 30.0 : 20.0),
                            borderSide: BorderSide(
                              color:
                                  _isButtonClicked ? Colors.red : Colors.yellow,
                            ),
                          ),
                        ),
                        obscureText: !_confirmpasswordVisible,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
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
                        fontSize: 14.0,
                        color: Colors.grey[700],
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
                    /* signup(
                      nameController.text.toString(),
                      emailController.text.toString(),
                      mobileController.text.toString(),
                      confirmPass.text.toString(),
                    );*/

                    if (_formKey.currentState!.validate()) {
                      signup(
                          nameController.text.toString(),
                          emailController.text.toString(),
                          mobileController.text.toString(),
                          passwordController.text.toString());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
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
