import 'dart:convert';

import 'package:dcrown_mart/screen/home%20page/home_page.dart';
import 'package:dcrown_mart/screen/payment_page.dart';
import 'package:dcrown_mart/service/api_response.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';
import 'package:http/http.dart' as http;

class UpgradePage extends StatefulWidget {
  const UpgradePage({super.key});

  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

bool _isButtonClicked = false;

class _UpgradePageState extends State<UpgradePage> {
  String? selectedPaymentMethod;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController referralidController = TextEditingController();
  TextEditingController idController = TextEditingController();

  void upgrade(String id, ref_id) async {
    print(ref_id);
    print(id);
    try {
      final url = Uri.parse("$base_url/membership/membershipadd");
      print(referralidController.text.toString());

      final response = await http.post(url, body: {"id": id, "ref_id": ref_id});

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        print(response.body);
        print(response.statusCode);
        print(data);
      } else {
        print(response.body);
        print('Upgrade failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Dcrown Mart",
          style: TextStyle(
            fontSize: 16.0,
            color: colorWhite,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 0.0),
          //padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Amount",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: colorBlack,
                    ),
                  ),
                  Text(
                    "₹ 99",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: colorBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Handle fee: ₹ 0.00",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: colorBlack,
                    ),
                  ),
                ],
              ),
              Container(
                width: 75.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      upgrade(
                        referralidController.text.toString(),
                        idController.text.toString(),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentPage()));
                    } else {
                      print("failed");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Pay",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              /*  BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment Amount",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: colorBlack,
                          ),
                        ),
                        Text(
                          "₹ 99",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: colorBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Handle fee: ₹ 0.00",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: colorBlack,
                          ),
                        ),
                      ],
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Container(
                          width: 60.0,
                          height: 30.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: toolbar,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text("Pay"),
                          ),
                        ),
                      ],
                    ),

                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Membership Plan",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: colorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "₹ 99",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: colorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: referralidController,
                        cursorColor: colorPrimary,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Referral ID is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Referral ID",
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                          filled: true,
                          fillColor: colorWhite,
                          prefixIcon: Icon(Icons.person, color: colorGrey),
                          hintStyle: TextStyle(color: colorGrey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: colorPrimary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
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
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
                      height: 290.0,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: colorWhite,
                        boxShadow: [
                          BoxShadow(
                            color: colorGrey1,
                            blurRadius: 8,
                            spreadRadius: -2.1,
                            offset: Offset(-1, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "Payment Method ₹ 99",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: colorBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Divider(
                            height: 5,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: colorGrey1,
                          ),
                          RadioListTile(
                            title: Text("Payment Gateway"),
                            value: "Method 1",
                            groupValue: selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value as String;
                              });
                            },
                            activeColor: colorPrimary,
                            dense: true,
                          ),
                          RadioListTile(
                            title: Text("Paytm"),
                            value: "Method 2",
                            groupValue: selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value as String;
                              });
                            },
                            activeColor: colorPrimary,
                            dense: true,
                          ),
                          RadioListTile(
                            title: Text("Google Pay"),
                            value: "Method 3",
                            groupValue: selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value as String;
                              });
                            },
                            activeColor: colorPrimary,
                            dense: true,
                          ),
                          RadioListTile(
                            title: Text("PhonePe"),
                            value: "Method 4",
                            groupValue: selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value as String;
                              });
                            },
                            activeColor: colorPrimary,
                            dense: true,
                          ),
                          RadioListTile(
                            title: Text("Direct Bank Transfer"),
                            value: "Method 5",
                            groupValue: selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value as String;
                              });
                            },
                            activeColor: colorPrimary,
                            dense: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /*Padding(
                padding: EdgeInsets.only(top: 240.0),
                child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment Amount",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: colorBlack,
                          ),
                        ),
                        Text(
                          "₹ 99",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: colorBlack,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Handle fee: ₹ 0.00",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: colorBlack,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60.0,
                          height: 35.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: toolbar,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text("Pay"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
