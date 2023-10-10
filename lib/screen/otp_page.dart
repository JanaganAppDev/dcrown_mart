import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
              "We have sent you an MAIL on santhiya.\n duskcoder@gmail.com \nwith 6 digit verification code",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 40.0,
                  child: TextField(
                    controller: TextEditingController(),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '',
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        // Automatically focus the next field when one character is entered.
                        if (index < 5) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          // The last digit has been entered.
                          // You can perform validation or submit the OTP here.
                        }
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
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Submit"),
                ),
              ),
            )
            /*ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, index) {
                Container(
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
                );
              },
            )*/
          ],
        ),
      ),
    );
  }
}
