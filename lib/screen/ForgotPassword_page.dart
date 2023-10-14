import 'package:dcrown_mart/screen/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
            Align(
              alignment: (Alignment.centerLeft),
            ),
            Text("Email",style: TextStyle(color: Colors.grey),
            ),
            Container(
              height: 50.0,
              child: TextFormField(
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
                ),
                validator: _validateEmail,
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              width: 140.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpPage()));
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
      )
    );

  }
}
