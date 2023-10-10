import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
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
class _ForgotPasswordState extends State<ForgotPassword> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            Image.asset("forgotpage_icon.PNG",
            height: 100.0,width: 100.0,),
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
            Text("Email",
            ),
            Container(
              height: 50.0,
              child: TextFormField(
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
                ),
                validator: _validateEmail,
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              width: 140.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: (){},
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
      )
    );

  }
}
