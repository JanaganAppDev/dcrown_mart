import 'package:dcrown_mart/screen/signup_page.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key });
  @override
  State<LoginPage> createState() => _LoginPageState();
}
bool _passwordVisible = false;

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email mobile number, or user id';
    }

    return null;
  }
  final emailPattern = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  final mobilePattern = RegExp(r'^\d{10}$');

  

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
            Container(
              height: 50.0,
              child: TextFormField(
    decoration: InputDecoration(
                  hintText: 'Mobile No/Email id/User id',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person,color: Colors.grey),
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
                ),
                validator: validateEmail,
              ),
            ),

            SizedBox(height: 10),
            Container(
              height: 50.0,
              child: TextFormField(

                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock,color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
                ),
                obscureText: !_passwordVisible,
              ),
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
              width: 140.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  // Validate the form
                  if (_formKey.currentState!.validate()) {
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
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
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
    );
  }

  void handleForgotPassword() {
    print("Forget your password? clicked");
  }

  void handleSignup() {
    if(_formKey.currentState!.validate()){
      print("Login Button clicked");
    }
  }
}
