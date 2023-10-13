import 'package:dcrown_mart/screen/login_page.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();

}
bool _passwordVisible = false;
bool _confirmPasswordVisible = false;


class _NewPasswordState extends State<NewPassword> {
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
              SizedBox(height:40.0),
              Image.asset("forgotpage_icon.PNG",height: 100.0,width: 100.0,),
              SizedBox(height: 10.0,),
              Text(
                "Enter New Password",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,

                    ),onPressed: () {
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
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,

                    ),onPressed: () {
                    setState(() {
                      _confirmPasswordVisible = !_confirmPasswordVisible;
                    });
                  },
                  ),
                ),
                obscureText: !_confirmPasswordVisible,
              ),
              SizedBox(height: 40.0),
              Container(
                width: 140.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
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
