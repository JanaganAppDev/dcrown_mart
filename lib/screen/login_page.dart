import 'package:flutter/material.dart';




class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? _email;
  String? _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
           Image(
               width: 100.0,
               height: 100.0,
               image: AssetImage("assets/crown_logo.png")

           ),
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
              decoration: InputDecoration(
                labelText: 'Mobile No/Email id/User id',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                final emailRegex = RegExp(
                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                );
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) {
                _email = value;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }

                return null;
              },
              onSaved: (value) {
                _password = value;
              },
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: handleForgotPassword,
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
              width: 150.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  // Validate the form
                  if (Form.of(context)!.validate()) {

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
          ],
        ),
      ),
    );
  }

  void handleForgotPassword() {
    print("Forget your password? clicked");
  }
}
