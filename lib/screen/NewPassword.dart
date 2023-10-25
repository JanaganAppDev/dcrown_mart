import 'dart:convert';

import 'package:dcrown_mart/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dcrown_mart/service/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

bool _passwordVisible = false;
bool _confirmPasswordVisible = false;

class _NewPasswordState extends State<NewPassword> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email = "";
  String globalVariable = "";

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("first");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> generateOTP(String confirmpass, password) async {
    print("checkmail1");
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('email');
      email = await prefs.getString('email') ?? "";
      print("checkmail");
      print(email);
      print(confirmpass);

      final url = Uri.parse("http://localhost:5000/api/users/update");
      // final response = await http.post(
      //   url,
      //   body: {
      //     "password": passwordController.text,
      //     "confirmpass": confirmpassController.text,
      //   },
      // );
      final response = await http.put(url, body: {
        "email": email,
        "cpassword": confirmpass,
      });

      //print(confirmpassController.text);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(response.body);
        setState(() {
          globalVariable = data["token"];
          print(globalVariable);
          print("otp sent successfully");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response.body)));
        });
      } else {
        print("failed");
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
    //return null;
  }

  String? _validateconfirmpass(
    String? confirmpass,
  ) {
    final password = confirmpass;
    if (confirmpass == null || confirmpass.isEmpty) {
      return 'Please enter your password';
    }
    if (password != passwordController.text) {
      return 'Passwords do not match';
    }
    //return null;
  }

  void handleLogin() {
    if (_formkey.currentState!.validate()) {
      print("LoginPage Button clicked");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dcrow Mart'),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.0),
              Image.asset(
                "forgotpage_icon.PNG",
                height: 100.0,
                width: 100.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Enter New Password",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: _validatePassword,
                      controller: passwordController,
                      cursorColor: Colors.grey[700],
                      decoration: InputDecoration(
                        hintText: 'Password',
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
                      ),
                      obscureText: !_passwordVisible,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: _validateconfirmpass,
                      controller: confirmpassController,
                      cursorColor: Colors.grey[700],
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _confirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_confirmPasswordVisible,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                width: 140.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    print("test1");

                    /*generateOTP(
                      passwordController.text.toString(),
                      confirmpassController.text.toString()
                    );*/
                    print("test2");

                    if (_formkey.currentState!.validate()) {
                      generateOTP(passwordController.text.toString(),
                          confirmpassController.text.toString());

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {
                      print("failed");
                    }
                    print("test3");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
