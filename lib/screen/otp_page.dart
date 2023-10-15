import 'dart:async';
import 'dart:convert';
import 'package:dcrown_mart/screen/NewPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  int countdown = 60;
  late Timer timer;

  get email => null;

  void otp(String otp) async {
    try {
      final url = Uri.parse("otp");

      final response = await http.post(url, body: {
        'otp': otp,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());

        print(response.body);
        setState(() {
          var globalVariable = data["token"];
          print(globalVariable);
          print("Otp sent successfully");
        });
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception("");
  }

  @override
  void initState() {
    super.initState();

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
              "We have sent you an MAIL on \n${email}\nwith 6-digit verification code",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      6,
                      (index) => SizedBox(
                        width: 30.0,
                        child: TextField(
                          controller: otpControllers[index],
                          focusNode: _focusNodes[
                              index], // Use a FocusNode for each TextField
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter
                                .digitsOnly, // Allow only numeric input
                          ],
                          cursorColor: Colors.grey[700],
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                          ),
                          onChanged: (text) {
                            if (text.isEmpty) {
                              // If the field is empty, move focus to the previous field
                              if (index > 0) {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[index - 1]);
                              }
                            } else if (text.isNotEmpty && index < 5) {
                              // If a number is entered and it's not the last field, move focus to the next field
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index + 1]);
                            }
                          },
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewPassword()));
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
