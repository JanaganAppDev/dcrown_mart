import 'dart:convert';

import 'package:dcrown_mart/const.dart';
import 'package:dcrown_mart/screen/addresslist_page.dart';
import 'package:dcrown_mart/screen/home%20page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}
String token = "";
String auth_key = token;

bool _isButtonClicked = false;

class _MyAddressPageState extends State<MyAddressPage> {
  List<String> location = [
    'Location',
    'Madurai',
    'Chennai',
    'Bangalore',
    'Others'
  ];
  String selectedLocation = 'Location';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController useridControler = TextEditingController();
  TextEditingController flatControler = TextEditingController();
  TextEditingController addressControler = TextEditingController();
  TextEditingController districtControler = TextEditingController();
  TextEditingController stateControler = TextEditingController();
  TextEditingController landmarkControler = TextEditingController();
  TextEditingController pincodeControler = TextEditingController();

  //String token = "";


  //static get index => null;

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid name';
    }

    return null;
  }

  String? validateAddresstype(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your address type';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid address type';
    }

    return null;
  }

  String? validateLocation(String? value) {
    if (value == null || value.trim().isEmpty || value == 'Location') {
      return 'Please select a valid location';
    }

    return null;
  }

  String? validateFlatno(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your house/flat no';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid house/flat no';
    }

    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your address';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid address';
    }

    return null;
  }

/*
  String? validateArea(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid address type';
    }

    return null;
  }
*/
  String? validateLandmark(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your land mark';
    }

    final nameRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid land mark';
    }

    return null;
  }

  String? validatepincode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your pincode';
    }

    final nameRegex = RegExp(r'^[0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid pincode';
    }

    return null;
  }

  /// api integration

  void myaddress(
      String userid, flat, address, district, landmark, pincode) async {
    try {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      token = await prefs.getString('token') ?? "";
      print("check");
      print(token);

      print(useridControler.text.toString());
      final response =
          await http.post(Uri.parse('http://localhost:5000/adress/add'), body: {
        'userid': userid.toString(),
        'flat': flat.toString(),
        'address': address.toString(),
        'district': district.toString(),
/*
        'state': state.toString(),
*/
        'landMark': landmark.toString(),
        'pincode': pincode.toString(),
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(response.body);

      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

 /// api integration put

  void updateAddress(
      String name, addresstype, flatno, address, landmark, pincode) async {
    try {
      print('Update failed');
      final response = await http.put(
          Uri.parse('http://localhost:5000/address/put'),
        body: {
          'name': name.toString(),
          'addresstype': addresstype.toString(),
          'flatno': flatno.toString(),
          'address': address.toString(),
          'landmark': landmark.toString(),
          'pincode': pincode.toString(),
        },
      );

      if (response.statusCode == 200) {
        var update_data = jsonDecode(response.body.toString());
        print(update_data);
        print(response.body);

      } else {
        print('Update failed');
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddresslistPage()),
            );
          },
        ),
        title: const Text('My Address'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    /*Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: useridControler,
                        cursorColor: colorPrimary,
                        //initialValue: 'Your default text here',
                        decoration: InputDecoration(
                          hintText: 'userid',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed : colorPrimary,
                            ),
                          ),
                        ),
                        validator: validateName,
                      ),
                    ),*/
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: flatControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: 'flat',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed : colorPrimary,
                            ),
                          ),
                        ),
                        validator: validateAddresstype,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: addressControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: ' address',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed : colorPrimary,
                            ),
                          ),
                        ),
                        validator: validateFlatno,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: districtControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: 'district',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed : colorPrimary,
                            ),
                          ),
                        ),
                        validator: validateAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Area',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: colorGrey1,
                          ),
                        ),
                      ),
                    ),
                    /*Padding(
                      padding: EdgeInsets.all(10.0),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed : colorPrimary,
                            ),
                          ),
                        ),
                        value: selectedLocation,
                        onChanged: (newValue) {
                          setState(() {
                            selectedLocation = newValue!;
                          });
                        },
                        items: location.map((mode) {
                          return DropdownMenuItem<String>(
                            value: mode,
                            child: Text(mode),
                          );
                        }).toList(),
                        validator: validateLocation,
                      ),
                    ),*/
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: stateControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: ' state',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed : colorPrimary,
                            ),
                          ),
                        ),
                        validator: validateFlatno,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: landmarkControler,
                        cursorColor: colorPrimary,
                        decoration: InputDecoration(
                          hintText: 'Land Mark',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed : colorPrimary,
                            ),
                          ),
                        ),
                        validator: validateLandmark,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: pincodeControler,
                        cursorColor: colorPrimary,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          hintText: 'Pin code',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(55.0),
                            borderSide: BorderSide(
                              color: _isButtonClicked ? colorRed : colorPrimary,
                            ),
                          ),
                        ),
                        validator: validatepincode,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        width: 330.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {

                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isButtonClicked = true;
                              });
                              print("test");
                              myaddress;updateAddress(
                                useridControler.text.toString(),
                                flatControler.text.toString(),
                                addressControler.text.toString(),
                                addressControler.text.toString(),
                                districtControler.text.toString(),
                                landmarkControler.text.toString(),
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddresslistPage()));
                            } else {
                              print("test1");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25.0,
                                color: colorWhite),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

/*Future<void> getAddress() async {
    final url = Uri.parse('http://localhost:5000/adress/add');
    final response = await http.get(url);
    if (response.statusCode == 200||response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);
      data = jsonResponse;
    } else {
      print("not match");
    }
  }*/
}
