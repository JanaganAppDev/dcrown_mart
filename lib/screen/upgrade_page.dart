import 'package:dcrown_mart/screen/home_page.dart';
import 'package:dcrown_mart/screen/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:dcrown_mart/const.dart';

class UpgradePage extends StatefulWidget {
  const UpgradePage({super.key});

  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  String? selectedPaymentMethod;

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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Column(
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
                    fontWeight: FontWeight.w600,
                  ),
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
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Container(
                  width: 60.0,
                  height: 35.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPage()),
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
            label: "",
          ),
        ],
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
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  cursorColor: colorPrimary,
                  decoration: InputDecoration(
                    hintText: "Referral ID",
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
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                height: 281.0,
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
                    Container(
                      child: RadioListTile(
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
                    ),
                    Container(
                      child: RadioListTile(
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
                    ),
                    Container(
                      child: RadioListTile(
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
                    ),
                    Container(
                      child: RadioListTile(
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
                    ),
                    Container(
                      child: RadioListTile(
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
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                height: 281.0,
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
                    Container(
                      child: RadioListTile(
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
                    ),
                    Container(
                      child: RadioListTile(
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
                    ),
                    Container(
                      child: RadioListTile(
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
                    ),
                    Container(
                      child: RadioListTile(
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
                    ),
                    Container(
                      child: RadioListTile(
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
