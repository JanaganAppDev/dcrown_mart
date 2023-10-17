import 'package:dcrown_mart/screen/otp_page.dart';
import 'package:dcrown_mart/service/api_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../service/api_response.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

bool _isButtonClicked = false;

String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  } else {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
  }
  return null;
}


class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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

  Future<void> generateOTP() async {
    // final String baseUrl = "http://localhost:5000/api/forgots/forgot";
    final url = Uri.parse("http://192.168.1.11:5000/api/forgots/forgot");
    final response = await http.post(
      url,
      body: {"email": emailController.text},
    );
    print(response.body);
    print(emailController.text);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.body)));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dcrown Mart'),
          backgroundColor: Colors.yellow,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 40.0),
                Image.asset(
                  "forgotpage_icon.PNG",
                  height: 100.0,
                  width: 100.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  "Enter your Registered Email",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "We Will send you the 6 digit verification code",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: (Alignment.centerLeft),
                ),
                Text(
                  "Email",
                  style: TextStyle(color: Colors.grey),
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.grey[700],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
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
                      borderRadius: BorderRadius.circular(_isButtonClicked ? 30.0 : 20.0),
                      borderSide: BorderSide(
                        color: _isButtonClicked ? Colors.red : Colors.yellow,
                      )
                    )
                  ),
                  validator: _validateEmail,
                ),
                SizedBox(height: 40.0),
                Container(
                  width: 140.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // The form is valid, proceed to generate OTP and navigate to the next page
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Otp sent successfully'),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                        generateOTP();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage()));
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text('Generate OTP'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
