import 'dart:convert';
import 'dart:html';

import 'package:dcrown_mart/screen/login%20page/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/home%20page/home_page.dart';
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
  String selectedCountryCode = "select country code";
  List<String> countryCodes = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cantactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController country_codeController = TextEditingController();

  void signup(String name, email, country_code, password, contact) async {
    print(name);
    try {
      final url = Uri.parse("http://localhost:5000/users/register");
      print(emailController.text.toString());
      print("name");
      print(name);
      print(country_code);

      final response = await http.post(url, body: {
        'name': name,
        'email': email,
        'country_code': country_code,
        'password': password,
        'contact': contact,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());

        print(response.body);
        setState(() {
          globalVariable = data["token"];
          print(globalVariable);
          //print(country_code);
          print("Registration successful!");
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Register successfully!'),
            duration: Duration(seconds: 3),
          ));
        });
      } else {
        print(response.body);
        print('Signup failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchData1() async {
    final url = Uri.parse('https://api.dcrownmart.com/country/country_code');
    print(country_codeController.text.toString());

    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);

      countryCodes =
          jsonResponse.map((item) => item["code"].toString()).toList();

      print(countryCodes);
      print('code test');
      print(response.body);
    } else {
      print("Failed to load country codes");
    }
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid name';
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

  void showCountryCodeDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Country Code"),
          content: DropdownButton<String>(
            value: countryCodes.contains(selectedCountryCode)
                ? selectedCountryCode
                : countryCodes.isNotEmpty
                    ? countryCodes[0]
                    : null,
            onChanged: (String? newValue) {
              setState(() {
                selectedCountryCode = newValue!;
                country_codeController.text = newValue;
              });
              Navigator.of(context).pop();
            },
            //items: countryCodes.map<DropdownMenuItem<String>>((String value) {
            items: <String>['select country code', '+91', '+94']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 13.0, color: colorBlack),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    fetchData1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
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
                color: colorBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Create an account on to use all \n the features",
              style: TextStyle(
                fontSize: 15.0,
                color: colorGrey1,
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
                  TextFormField(
                    validator: validateName,
                    controller: nameController,
                    cursorColor: colorGrey1,
                    decoration: InputDecoration(
                      hintText: "Name",
                      filled: true,
                      fillColor: colorWhite,
                      prefixIcon: Icon(Icons.person, color: colorGrey),
                      hintStyle: TextStyle(color: colorGrey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: colorPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: colorPrimary,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            _isButtonClicked ? 30.0 : 20.0),
                        borderSide: BorderSide(
                          color: _isButtonClicked ? colorRed : colorPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    validator: _validateEmail,
                    controller: emailController,
                    cursorColor: colorGrey1,
                    decoration: InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: colorWhite,
                      prefixIcon: Icon(Icons.email, color: colorGrey),
                      hintStyle: TextStyle(color: colorGrey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: colorPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: colorPrimary,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            _isButtonClicked ? 30.0 : 20.0),
                        borderSide: BorderSide(
                          color: _isButtonClicked ? colorRed : colorPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 120.0,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your country code';
                            }
                            return null;
                          },
                          readOnly: true,
                          controller: country_codeController,
                          onTap: () {
                            showCountryCodeDropdown(context);
                          },
                          decoration: InputDecoration(
                            hintText: "Country Code",
                            filled: true,
                            fillColor: colorWhite,
                            prefixIcon: Icon(Icons.phone, color: colorGrey),
                            hintStyle: TextStyle(color: colorGrey),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: colorPrimary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: colorPrimary,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                _isButtonClicked ? 30.0 : 20.0,
                              ),
                              borderSide: BorderSide(
                                color:
                                    _isButtonClicked ? colorRed : colorPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
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
                          controller: cantactController,
                          cursorColor: colorGrey1,
                          decoration: InputDecoration(
                            hintText: "Cantact",
                            filled: true,
                            fillColor: colorWhite,
                            prefixIcon:
                                Icon(Icons.mobile_friendly, color: colorGrey),
                            hintStyle: TextStyle(color: colorGrey),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: colorPrimary),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: colorPrimary,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                _isButtonClicked ? 30.0 : 20.0,
                              ),
                              borderSide: BorderSide(
                                color:
                                    _isButtonClicked ? colorRed : colorPrimary,
                              ),
                            ),
                          ),
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    validator: _validatePassword,
                    controller: passwordController,
                    cursorColor: colorGrey1,
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: colorWhite,
                      prefixIcon: Icon(Icons.lock, color: colorGrey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: colorGrey1,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      hintStyle: TextStyle(color: colorGrey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: colorPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: colorPrimary,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            _isButtonClicked ? 30.0 : 20.0),
                        borderSide: BorderSide(
                          color: _isButtonClicked ? colorRed : colorPrimary,
                        ),
                      ),
                    ),
                    obscureText: !_passwordVisible,
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    controller: confirmPass,
                    cursorColor: colorGrey1,
                    validator: _validatePasswordConfirmation,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      filled: true,
                      fillColor: colorWhite,
                      prefixIcon: Icon(Icons.lock, color: colorGrey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _confirmpasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: colorGrey1,
                        ),
                        onPressed: () {
                          setState(() {
                            _confirmpasswordVisible = !_confirmpasswordVisible;
                          });
                        },
                      ),
                      hintStyle: TextStyle(color: colorGrey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: colorPrimary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: colorPrimary,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            _isButtonClicked ? 30.0 : 20.0),
                        borderSide: BorderSide(
                          color: _isButtonClicked ? colorRed : colorPrimary,
                        ),
                      ),
                    ),
                    obscureText: !_confirmpasswordVisible,
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
                          activeColor: colorPrimary,
                        ),
                      ),
                    ),
                    Text(
                      "By signing up, you agree to our Terms and \nPolicy",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: colorGrey2,
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
                height: 45.0,
                child: ElevatedButton(
                  onPressed: () {
                    print("trues");
                    //print(nameController);
                    //print(country_codeController);
                    if (_formKey.currentState!.validate()) {
                      signup(
                          nameController.text.toString(),
                          emailController.text.toString(),
                          country_codeController.text.toString(),
                          passwordController.text.toString(),
                          cantactController.text.toString());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {
                      print("failed");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: colorGrey,
                    elevation: 8,
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
                      color: colorBlack,
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
                        color: colorPrimary,
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
