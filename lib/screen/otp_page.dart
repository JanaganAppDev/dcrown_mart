import 'dart:async';
import 'dart:convert';
import 'package:dcrown_mart/screen/NewPassword.dart';
import 'package:dcrown_mart/screen/ForgotPassword_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OtpPage extends StatefulWidget {
  final String email;
  OtpPage({Key? key, required this.email}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

bool isOtpValid = false;

class _OtpPageState extends State<OtpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  String i = "";

  List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  int countdown = 60;
  late Timer timer;

  get email => emailController;

  get emailController => null;

  void otp(String otp) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      //id = await prefs.getString('id');

      final url = Uri.parse("http://localhost:5000/api/forgots/otpVerify/71");
      print("object");
      print(otp);

      final response = await http.post(url, body: {
        "otp": otp,
        //"email": widget.email,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        //var globalVariable = data["token"];
        var message = data["message"];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.body),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          duration: Duration(seconds: 2),
        ));

        // Check if the response indicates OTP verification success
        /*if (globalVariable == "OTP verified successfully") {
          setState(() {
            isOtpValid = true;
          });

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response.body),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            duration: Duration(seconds: 2),
          ));

          */ /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPassword()),
          );*/ /*
        }*/ /*else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response.body),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            duration: Duration(seconds: 2),
          ));
          print("failed");
        }*/
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.body),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          duration: Duration(seconds: 2),
        ));
        print('failed');
        print("Request failed with status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    isOtpValid = false;

    for (int i = 0; i < otpControllers.length; i++) {
      otpControllers[i].text = '';
      otpControllers[i].addListener(() {
        if (otpControllers[i].text.isNotEmpty && i < 5) {
          FocusScope.of(context).nextFocus();
        }
      });
    }

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      print("Submit Button Clicked");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dcrown Mart"),
        backgroundColor: Colors.yellow[600],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Center(
              child: Image.asset("assets/otp_image.png",
                  width: 200.0, height: 200.0),
            ),
            Text(
              "Enter OTP",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "We have sent you an MAIL on \n${widget.email}\nwith 6-digit verification code",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              height: 130.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    spreadRadius: -2.1,
                    offset: Offset(-1, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 30.0,
                          child: TextField(
                            controller: otpControllers[index],
                            focusNode: _focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            cursorColor: Colors.grey[700],
                            maxLength: 1,
                            decoration: InputDecoration(
                              counterText: '',
                            ),
                            onChanged: (text) {
                              if (text.isEmpty) {
                                if (index > 0) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusNodes[index - 1]);
                                }
                              } else if (text.isNotEmpty && index < 5) {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[index + 1]);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Container(
                      width: 140.0,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          print("shared");

                          if (otpControllers.every(
                              (controller) => controller.text.isNotEmpty)) {
                            setState(() {
                              isOtpValid = true;
                            });
                            if (otpControllers!.isNotEmpty) {
                              print(otpControllers[0].text.toString());
                              print(otpControllers[1].text.toString());
                              print(otpControllers[2].text.toString());
                              print(otpControllers[3].text.toString());
                              print(otpControllers[4].text.toString());
                              print(otpControllers[5].text.toString());
                              String number = '';
                              for (TextEditingController controller
                                  in otpControllers) {
                                number += controller.text;
                              }

                              print(number);

                              otp(number);

                              print("test");

                              /*print(otpControllers[0].text);
                              print(otpControllers[1].text);
                              print(otpControllers[2].text);
                              print(otpControllers[3].text);
                              print(otpControllers[4].text);
                              print(otpControllers[5].text);*/

                              /*ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("OTP Verified successfully"),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                duration: Duration(seconds: 2),
                              ));*/

                              /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewPassword()));*/
                            }

                            /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("OTP Verified successfully"),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              duration: Duration(seconds: 2),
                            ));*/

                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewPassword()));*/
                          } /*else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Enter a valid OTP"),
                              backgroundColor: Colors.redAccent,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              duration: Duration(seconds: 2),
                            ));
                          }*/
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text("Submit"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Text("Did not receive the code?"),
            SizedBox(height: 10.0),
            Text(
              "$countdown Seconds Wait",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
